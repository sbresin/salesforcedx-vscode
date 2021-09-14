/*
 * Copyright (c) 2019, salesforce.com, inc.
 * All rights reserved.
 * Licensed under the BSD 3-Clause license.
 * For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */

import * as vscode from 'vscode';
import { fs } from '@salesforce/core';
import { getRootWorkspace, getRootWorkspacePath } from '../util';
const { ComponentSet } = require('@salesforce/source-deploy-retrieve');

export async function forceCreateManifest(sourceUri?: vscode.Uri) {
  const fsPaths: string[] = [];
  // @ts-ignore
  const selected = sourceUri?.fullName as string;
  // @ts-ignore
  const selectedFullPath = getRootWorkspacePath() + '/force-app/main/default/' + sourceUri._parent.directoryName + '/' + selected + '.' + sourceUri._parent.suffix;
  fsPaths.push(selectedFullPath);
  const componentSet = ComponentSet.fromSource({ fsPaths });
  componentSet.getPackageXml();

  return fs.writeFile(getRootWorkspacePath() + '/package.xml', componentSet.getPackageXml());
}
