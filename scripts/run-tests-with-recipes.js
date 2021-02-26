#!/usr/bin/env node

const path = require('path');
const { runWithRetry } = require('./verify-test-results');
const { runIntegrationTests } = require('./vscode-integration-testrunner');

const cwd = process.cwd();

runWithRetry(() =>
  runIntegrationTests({
    extensionDevelopmentPath: path.join(__dirname, '..', 'packages'),
    extensionTestsPath: path.join(cwd, 'out', 'test', 'vscode-integration'),
    testWorkspace: path.join(
      __dirname,
      '..',
      'packages',
      'system-tests',
      'assets',
      'lwc-recipes'
    )
  })
);
