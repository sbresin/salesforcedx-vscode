import {
  commands,
  CompletionItem,
  CompletionList,
  Position,
  TextDocument,
  Uri,
  workspace
} from 'vscode';
import { Middleware } from 'vscode-languageclient/lib/main';
import ProtocolCompletionItem from 'vscode-languageclient/lib/protocolCompletionItem';

const virtualDocumentContents = new Map<string, string>();

workspace.registerTextDocumentContentProvider('embedded-soql', {
  provideTextDocumentContent: uri => {
    const originalUri = uri.path.slice(1).slice(0, -5);
    const decodedUri = decodeURIComponent(originalUri);
    return virtualDocumentContents.get(decodedUri);
  }
});

function insideSOQLBlock(
  apexItems: ProtocolCompletionItem[],
  document: TextDocument,
  position: Position
): any {
  const soqlItem = apexItems.find(i => i.label === 'SOQL');
  return soqlItem
    ? { queryText: soqlItem.detail, location: soqlItem.data }
    : undefined;
}

function getSOQLVirtualContent(
  document: TextDocument,
  position: Position,
  soqlBlock: { queryText: string; location: any }
): string {
  let content = document
    .getText()
    .split('\n')
    .map(line => {
      return ' '.repeat(line.length);
    })
    .join('\n');

  content =
    content.slice(0, soqlBlock.location.startIndex) +
    soqlBlock.queryText +
    content.slice(soqlBlock.queryText.length);

  return content;
}

export const soqlMiddleware: Middleware = {
  provideCompletionItem: async (document, position, context, token, next) => {
    const apexCompletionItems = await next(document, position, context, token);
    const items: ProtocolCompletionItem[] = Array.isArray(apexCompletionItems)
      ? (apexCompletionItems as ProtocolCompletionItem[])
      : ((apexCompletionItems as CompletionList)
          .items as ProtocolCompletionItem[]);

    const soqlBlock = insideSOQLBlock(items, document, position);
    const wordAtCursor = document.getText(
      document.getWordRangeAtPosition(position, /[:(_.\w]+/)
    );

    if (soqlBlock && !wordAtCursor.startsWith(':')) {
      return await doSOQLCompletion(document, position, context, soqlBlock);
    } else {
      return apexCompletionItems;
    }
  }
};

async function doSOQLCompletion(
  document: TextDocument,
  position: Position,
  context: any,
  soqlBlock: any
): Promise<CompletionItem[] | CompletionList<CompletionItem>> {
  const originalUri = document.uri.toString();
  virtualDocumentContents.set(
    originalUri,
    getSOQLVirtualContent(document, position, soqlBlock)
  );

  const vdocUriString = `embedded-soql://soql/${encodeURIComponent(
    originalUri
  )}.soql`;
  const vdocUri = Uri.parse(vdocUriString);
  const soqlCompletions = await commands.executeCommand<CompletionList>(
    'vscode.executeCompletionItemProvider',
    vdocUri,
    position,
    // new vscode.Position(0, 0),
    context.triggerCharacter
  );
  console.log(
    '****** Apex<SOQL> middleware 3, returning ' +
      soqlCompletions?.items.length +
      ' items'
  );
  return soqlCompletions || [];
}
