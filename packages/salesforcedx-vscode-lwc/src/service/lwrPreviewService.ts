import * as fs from 'fs';
import * as cpx from 'cpx';
import * as path from 'path';
import * as vscode from 'vscode';
import { WorkspaceFolder } from 'vscode';
import { Uri } from 'vscode';
import { webviewService } from './webviewService';
// import { LwrDevServer } from '../lwr-local-server';
import * as tcpPortUsed from 'tcp-port-used';

export class LwrPreviewService {
  private startedServers: Map<string, boolean> = new Map();

  constructor() {
    vscode.tasks.onDidEndTask(
      (taskEndEvent) => {
        const { execution } = taskEndEvent;
        const { definition } = execution.task;
        const { type } = definition;
        if (type === "serverTask") {
          const { rootWorkspaceFolderPath } = definition;

          this.startedServers.set(rootWorkspaceFolderPath, false);

          // stop watching!
        }
      },
      null
      // context.subscriptions
    );
  }

  async showPreview(uri: Uri) {
    const workspaceFolder = vscode.workspace.getWorkspaceFolder(uri);
    if (workspaceFolder) {
      const pathSegments = uri.fsPath.split(path.sep);
      if (!this.startedServers.get(workspaceFolder.uri.fsPath)) {
        this.startedServers.set(workspaceFolder.uri.fsPath, true);

        // const lwrDevServer = new LwrDevServer(workspaceFolder.uri.fsPath);
        // lwrDevServer.startDevServer();

        // Copy Modules to Preview App
        console.log(uri);
        // Get Module Path: HACK hacky here.
        // For LWR -> should read from lwr config: { "lwc": { "modules": [{ "dir": "$rootDir/src/modules" }] },

        // HACK for LWR
        let moduleIndex = pathSegments.indexOf("modules");
        let modulesPath = "";
        if (moduleIndex === -1) {
          // HACK for sfdx
          moduleIndex = pathSegments.indexOf("lwc");
          modulesPath = path.join(
            ...pathSegments.slice(0, pathSegments.indexOf("lwc") + 1)
          );
          cpx.watch(
            path.join(path.sep, modulesPath, "**", "*"),
            path.join(__dirname, ".lwr-preview-app/src/modules/c")
          );
        } else {
          modulesPath = path.join(
            ...pathSegments.slice(0, pathSegments.indexOf("modules") + 1)
          );
          cpx.watch(
            path.join(path.sep, modulesPath, "**", "*"),
            path.join(__dirname, ".lwr-preview-app/src/modules")
          );
        }

        // Create Server task
        const taskSource = "SFDX";
        const taskScope = workspaceFolder;
        const taskDefinition = {
          type: "serverTask",
          rootWorkspaceFolderPath: workspaceFolder.uri.fsPath,
        };
        const taskName = "LWR Dev Server";
        const cmd = "node";
        const args = [path.join(__dirname, ".lwr-preview-app/build/index.js")];
        const taskShellExecutionOptions: vscode.ShellExecutionOptions = {
          cwd: path.join(__dirname, ".lwr-preview-app"),
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

      // Swap previewapp/app content
      const componentName = pathSegments[pathSegments.length - 2];
      //https://stackoverflow.com/questions/47836390/how-to-convert-a-camel-case-string-to-dashes-in-javascript/47836484
      let camelToDashed = (camel: string) =>
        camel.replace(/[A-Z]/g, (m: string) => "-" + m.toLowerCase());

      let namespace: string;
      if (pathSegments.indexOf("modules") === -1) {
        // HACK for SFDX
        namespace = "c";
      } else {
        namespace = pathSegments[pathSegments.length - 3];
      }
      const componentFullName = `${namespace}-${camelToDashed(componentName)}`;

      const previewAppBasePath = path.join(
        __dirname,
        ".lwr-preview-app/src/modules/previewapp/app/app.html"
      );
      const result = `<template><${componentFullName}></${componentFullName}></template>`;

      fs.writeFile(previewAppBasePath, result, "utf8", function (err) {
        if (err) {
          return console.log(err);
        }
      });

      // Create webview
      await webviewService.createOrShowWebview();
    } else {
      // untitled documents
    }
  }
}

export const lwrPreviewService = new LwrPreviewService();
