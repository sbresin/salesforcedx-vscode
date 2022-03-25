/*
 * Copyright (c) 2022, salesforce.com, inc.
 * All rights reserved.
 * Licensed under the BSD 3-Clause license.
 * For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */

import * as vscode from 'vscode';

export async function getTrimmedString(projectNameInputOptions: vscode.InputBoxOptions) {
  const input = await vscode.window.showInputBox(
    projectNameInputOptions
  );
  return input ? input.trim() : input;
}
