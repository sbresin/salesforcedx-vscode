import * as vscode from 'vscode';
import { lwrPreviewService } from '../service/lwrPreviewService';

export async function forceLightningLwrPreview(sourceUri: vscode.Uri) {
  await lwrPreviewService.showPreview(sourceUri);
}
