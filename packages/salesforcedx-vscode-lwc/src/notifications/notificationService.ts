/*
 * Copyright (c) 2017, salesforce.com, inc.
 * All rights reserved.
 * Licensed under the BSD 3-Clause license.
 * For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */

import { CommandExecution } from '@salesforce/salesforcedx-utils-vscode/out/src/cli';
import { Observable } from 'rxjs/Observable';
import * as vscode from 'vscode';
import { channelService } from '../channel';
import { nls } from '../messages';

/**
 * A centralized location for all notification functionalities.
 */
export class NotificationService {
  private static instance: NotificationService;

  public static getInstance() {
    if (!NotificationService.instance) {
      NotificationService.instance = new NotificationService();
    }
    return NotificationService.instance;
  }

  // Prefer these over directly calling the vscode.show* functions
  // We can expand these to be facades that gather analytics of failures.

  public showErrorMessage(
    message: string,
    ...items: string[]
  ): Thenable<string | undefined> {
    return vscode.window.showErrorMessage(message, ...items);
  }

  public showInformationMessage(
    message: string,
    ...items: string[]
  ): Thenable<string | undefined> {
    return vscode.window.showInformationMessage(message, ...items);
  }

  public showWarningMessage(
    message: string,
    ...items: string[]
  ): Thenable<string | undefined> {
    return vscode.window.showWarningMessage(message, ...items);
  }

  public showWarningModal(
    message: string,
    ...items: string[]
  ): Thenable<string | undefined> {
    return vscode.window.showWarningMessage(message, { modal: true }, ...items);
  }

  public showFailedExecution(executionName: string) {
    this.showErrorMessage(
      nls.localize('notification_unsuccessful_execution_text', executionName)
    );
    channelService.showChannelOutput();
  }

  public reportExecutionError(
    executionName: string,
    observable: Observable<Error | undefined>
  ) {
    observable.subscribe(async data => {
      this.showErrorMessage(
        nls.localize('notification_unsuccessful_execution_text', executionName)
      );
      channelService.showChannelOutput();
    });
  }
}
