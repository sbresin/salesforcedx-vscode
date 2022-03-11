import * as cpx from 'cpx';
import * as fs from 'fs';
import * as path from 'path';
import * as tcpPortUsed from 'tcp-port-used';
import * as vscode from 'vscode';
import { channelService } from '../channel';
import { nls } from '../messages';
import { notificationService } from '../notifications';
import { telemetryService } from '../telemetry';
import { webviewService } from './webviewService';

export class LwrPreviewService {
  private startedServers: Map<string, boolean> = new Map();

  constructor() {
    vscode.tasks.onDidEndTask(
      taskEndEvent => {
        const { execution } = taskEndEvent;
        const { definition } = execution.task;
        const { type } = definition;
        if (type === 'serverTask') {
          const { rootWorkspaceFolderPath } = definition;

          this.startedServers.set(rootWorkspaceFolderPath, false);

          // stop watching!
        }
      },
      null
      // context.subscriptions
    );
  }

  public async showPreview(uri: vscode.Uri) {
    if (!uri) {
      const editor = vscode.window.activeTextEditor;
      if (editor && editor.document.languageId !== 'forcesourcemanifest') {
        uri = editor.document.uri;
      }
    }
    const workspaceFolder = vscode.workspace.getWorkspaceFolder(uri);
    if (!workspaceFolder) {
      // TODO: report error?
      // untitled document?
      const errorMessage = nls.localize('unsupported_workspace');
      telemetryService.sendException('unsupported_workspace', errorMessage);
      notificationService.showErrorMessage(errorMessage);
      channelService.appendLine(errorMessage);
      channelService.showChannelOutput();
      return;
    }
    const pathSegments = uri.fsPath.split(path.sep);
    if (!this.serverStarted(workspaceFolder.uri.fsPath)) {
      await this.startServer(workspaceFolder, uri, pathSegments);
    }
    const componentName = this.getComponentName(pathSegments);
    const namespace = this.getNamespace(pathSegments);
    const componentFullName = `${namespace}-${camelToDashed(componentName)}`;
    const previewAppBasePath = this.getPreviewAppBasePath();
    const result = `<template><${componentFullName}></${componentFullName}></template>`;

    fs.writeFile(previewAppBasePath, result, 'utf8', err => {
      if (err) {
        return console.log(err);
      }
    });
    // Create webview
    await webviewService.createOrShowWebview();
  }

  // Swap previewapp/app content
  public getComponentName(uriPath: string[]): string {
    return uriPath[uriPath.length - 2];
  }

  public getPreviewAppBasePath(): string {
    return path.join(
      __dirname,
      '.lwr-preview-app/src/modules/previewapp/app/app.html'
    );
  }

  public getNamespace(pathSegments: string[]): string {
    let namespace: string;
    if (pathSegments.indexOf('modules') === -1) {
      // HACK for SFDX : why c?
      namespace = 'c';
    } else {
      namespace = pathSegments[pathSegments.length - 3];
    }
    return namespace;
  }

  private serverStarted(fsPath: string): boolean | undefined {
    return this.startedServers.get(fsPath);
  }

  private async startServer(
    workspaceFolder: vscode.WorkspaceFolder,
    uri: vscode.Uri,
    pathSegments: string[]
  ) {
    this.startedServers.set(workspaceFolder.uri.fsPath, true);

    // const lwrDevServer = new LwrDevServer(workspaceFolder.uri.fsPath);
    // lwrDevServer.startDevServer();

    // Copy Modules to Preview App
    console.log(uri);
    // Get Module Path: HACK hacky here.
    // For LWR -> should read from lwr config: { "lwc": { "modules": [{ "dir": "$rootDir/src/modules" }] },

    // HACK for LWR
    let moduleIndex = pathSegments.indexOf('modules');
    let modulesPath = '';
    if (moduleIndex === -1) {
      // HACK for sfdx
      moduleIndex = pathSegments.indexOf('lwc');
      modulesPath = path.join(
        ...pathSegments.slice(0, pathSegments.indexOf('lwc') + 1)
      );
      cpx.watch(
        path.join(path.sep, modulesPath, '**', '*'),
        path.join(__dirname, '.lwr-preview-app/src/modules/c')
      );
    } else {
      modulesPath = path.join(
        ...pathSegments.slice(0, pathSegments.indexOf('modules') + 1)
      );
      cpx.watch(
        path.join(path.sep, modulesPath, '**', '*'),
        path.join(__dirname, '.lwr-preview-app/src/modules')
      );
    }

    // Create Server task
    const taskSource = 'SFDX';
    const taskScope = workspaceFolder;
    const taskDefinition = {
      type: 'serverTask',
      rootWorkspaceFolderPath: workspaceFolder.uri.fsPath
    };
    const taskName = 'LWR Dev Server';
    const cmd = 'node';
    const args = [path.join(__dirname, '.lwr-preview-app/build/index.js')];
    const taskShellExecutionOptions: vscode.ShellExecutionOptions = {
      cwd: path.join(__dirname, '.lwr-preview-app')
    };
    const taskShellExecution = new vscode.ShellExecution(
      cmd,
      args,
      taskShellExecutionOptions
    );
    const task = new vscode.Task(
      taskDefinition,
      taskScope,
      taskName,
      taskSource,
      taskShellExecution
    );
    await vscode.tasks.executeTask(task);

    const interval = 200;
    const timeout = 100000;
    await tcpPortUsed.waitUntilUsed(3000, interval, timeout);
  }
}

// https://stackoverflow.com/questions/47836390/how-to-convert-a-camel-case-string-to-dashes-in-javascript/47836484
function camelToDashed(camel: string) {
  return camel.replace(/[A-Z]/g, (m: string) => '-' + m.toLowerCase());
}

export const lwrPreviewService = new LwrPreviewService();
