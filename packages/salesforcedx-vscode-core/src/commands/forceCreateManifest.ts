/*
 * Copyright (c) 2019, salesforce.com, inc.
 * All rights reserved.
 * Licensed under the BSD 3-Clause license.
 * For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */

import { fs } from '@salesforce/core';
import { ComponentSet } from '@salesforce/source-deploy-retrieve';
import * as vscode from 'vscode';
import { getRootWorkspacePath } from '../util';

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
