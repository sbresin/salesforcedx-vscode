/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * Licensed under the BSD 3-Clause license.
 * For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
import {
  Command,
  SfdxCommandBuilder
} from '@salesforce/salesforcedx-utils-vscode/out/src/cli';
import { PostconditionChecker } from '@salesforce/salesforcedx-utils-vscode/out/src/types';
import {
  CancelResponse,
  ContinueResponse
} from '@salesforce/salesforcedx-utils-vscode/out/src/types/index';
import { ComponentSet } from '@salesforce/source-deploy-retrieve';
import { createReadStream, createWriteStream } from 'fs';
import { homedir } from 'os';
import { basename, join } from 'path';
import { withParser } from 'stream-json/streamers/StreamArray';
import * as vscode from 'vscode';
import { channelService } from '../channels';
import { nls } from '../messages';
import { notificationService } from '../notifications';
import { sfdxCoreSettings } from '../settings';
import { SfdxPackageDirectories } from '../sfdxProject';
import { telemetryService } from '../telemetry';
import { RetrieveExecutor } from './baseDeployRetrieve';
import {
  FilePathGatherer,
  SfdxCommandlet,
  SfdxCommandletExecutor,
  SfdxWorkspaceChecker
} from './util';

export class ForceSourceRetrieveSourcePathExecutor extends SfdxCommandletExecutor<
  string
> {
  public build(sourcePath: string): Command {
    return new SfdxCommandBuilder()
      .withDescription(nls.localize('force_source_retrieve_text'))
      .withArg('force:source:retrieve')
      .withFlag('--sourcepath', sourcePath)
      .withLogName('force_source_retrieve_with_sourcepath')
      .build();
  }
}

export class LibraryRetrieveSourcePathExecutor extends RetrieveExecutor<
  string
> {
  constructor() {
    super(
      nls.localize('force_source_retrieve_text'),
      'force_source_retrieve_with_sourcepath_beta'
    );
  }

  protected async getComponents(
    response: ContinueResponse<string>
  ): Promise<ComponentSet> {
    return ComponentSet.fromSource(response.data);
  }
}

export class SourcePathChecker implements PostconditionChecker<string> {
  public async check(
    inputs: ContinueResponse<string> | CancelResponse
  ): Promise<ContinueResponse<string> | CancelResponse> {
    if (inputs.type === 'CONTINUE') {
      const sourcePath = inputs.data;
      try {
        const isInSfdxPackageDirectory = await SfdxPackageDirectories.isInPackageDirectory(
          sourcePath
        );
        if (isInSfdxPackageDirectory) {
          return inputs;
        }
      } catch (error) {
        telemetryService.sendException(
          'force_source_retrieve_with_sourcepath',
          `Error while parsing package directories. ${error.message}`
        );
      }

      const errorMessage = nls.localize(
        'error_source_path_not_in_package_directory_text'
      );
      telemetryService.sendException(
        'force_source_retrieve_with_sourcepath',
        errorMessage
      );
      notificationService.showErrorMessage(errorMessage);
      channelService.appendLine(errorMessage);
      channelService.showChannelOutput();
    }
    return { type: 'CANCEL' };
  }
}

export async function forceSourceRetrieveSourcePath(explorerPath: vscode.Uri) {
  let count = 1000;
  const myList = [];
  while (count > 0) {
    myList.push({
      classname: `yellow${count}${basename(explorerPath.fsPath)}`
    });
    count--;
  }

  const writer = createWriteStream(join(homedir(), 'Desktop', 'yesh.json'));
  const parser = withParser();
  writer.write(JSON.stringify(myList));
  // @ts-ignore
  createReadStream(join(homedir(), 'Desktop', 'yesh.json')).pipe(parser.input);
  parser.on('data', ({ key, value }) => {
    console.log(key, value);
  });
  // @ts-ignore
  parser.on('end', () => {
    console.log('all done');
  });

  // const processingStream = new Writable({
  //   write({ key, value }, encoding, callback) {
  //     // any other async actions

  //     // setTimeout(() => {
  //     //   console.log(value);
  //     //   //Next record will be read only current one is fully processed
  //     //   callback();
  //     // }, 1000);
  //   },
  //   //Don't skip this, as we need to operate with objects, not buffers
  //   objectMode: true
  // });
  // // @ts-ignore
  // filestream.pipe(parser.input);
  // parser.pipe(processingStream);
  // processingStream.on('finish', () => console.log('All done'));

  if (!explorerPath) {
    const editor = vscode.window.activeTextEditor;
    if (editor && editor.document.languageId !== 'forcesourcemanifest') {
      explorerPath = editor.document.uri;
    } else {
      const errorMessage = nls.localize(
        'force_source_retrieve_select_file_or_directory'
      );
      telemetryService.sendException(
        'force_source_retrieve_with_sourcepath',
        errorMessage
      );
      notificationService.showErrorMessage(errorMessage);
      channelService.appendLine(errorMessage);
      channelService.showChannelOutput();
      return;
    }
  }

  const commandlet = new SfdxCommandlet(
    new SfdxWorkspaceChecker(),
    new FilePathGatherer(explorerPath),
    sfdxCoreSettings.getBetaDeployRetrieve()
      ? new LibraryRetrieveSourcePathExecutor()
      : new ForceSourceRetrieveSourcePathExecutor(),
    new SourcePathChecker()
  );
  await commandlet.run();
}
