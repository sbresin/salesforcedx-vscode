#!/usr/bin/env node

const path = require('path');
const { runIntegrationTests } = require('./vscode-integration-testrunner');
const { runWithRetry } = require('./test-suite-verification');

const cwd = process.cwd();

runWithRetry(() =>
  runIntegrationTests({
    extensionDevelopmentPath: cwd,
    extensionTestsPath: path.join(cwd, 'out', 'test', 'vscode-integration'),
    testWorkspace: path.join(cwd, 'out', 'test', 'vscode-integration')
  })
);
