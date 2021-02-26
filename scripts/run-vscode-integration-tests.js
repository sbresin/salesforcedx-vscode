#!/usr/bin/env node

const path = require('path');
const { runIntegrationTests } = require('./vscode-integration-testrunner');
const { resultsGeneratedIfTestsPresent } = require('./verify-test-results');

const MAX_RETRY = 3;

async function runWithRetry() {
  let retry = 0;
  const cwd = process.cwd();

  do {
    await runIntegrationTests({
      extensionDevelopmentPath: cwd,
      extensionTestsPath: path.join(cwd, 'out', 'test', 'vscode-integration'),
      testWorkspace: path.join(cwd, 'out', 'test', 'vscode-integration')
    });

    const resultsGenerated = resultsGeneratedIfTestsPresent(
      cwd,
      'vscode-integration'
    );

    if (resultsGenerated) {
      return;
    }

    retry += 1;
    console.log(
      `WARNING: Tests results not generated...retrying (${retry}/${MAX_RETRY})`
    );
  } while (retry < MAX_RETRY);

  missingMessage = `Missing junit results for the ${path.basename(
    path.dirname(cwd)
  )} package!\n`;
  missingMessage += '\n\nPossible Issues:\n\n';
  missingMessage +=
    "1) Tests in the expected suite categories haven't run yet (unit, integration, etc.).\n";
  missingMessage +=
    '2) An unexpected test runner or reporter failure while running tests. Sometimes extension activation issues or issues in the tests can silently fail.\n';
  missingMessage += '3) Test run configuration is improperly set up.\n';
  missingMessage += '4) Circular imports.\n';
  console.error(missingMessage);
  process.exit(1);
}

runWithRetry();
