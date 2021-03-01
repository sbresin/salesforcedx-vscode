const fs = require('fs-extra');
const path = require('path');

const categoryToFile = {
  'vscode-integration': 'junit-custom-vscodeIntegrationTests.xml',
  integration: 'junit-custom-integrationTests.xml',
  unit: 'junit-custom-unitTests.xml',
  system: 'junit-custom.xml'
};

function resultsGeneratedIfTestsPresent(packagePath, category) {
  const testDir = path.join(packagePath, 'test');
  if (fs.existsSync(testDir) && fs.statSync(testDir).isDirectory()) {
    for (const testEntry of fs.readdirSync(testDir)) {
      // if package test directory has a test category that matches the
      // category input, copy the junit results to the aggregate folder
      if (category === testEntry) {
        const junitFilePath = path.join(packagePath, categoryToFile[testEntry]);

        return fs.existsSync(junitFilePath);
      }
    }
  }
  return true;
}

async function runWithRetry(testFn, maxRetry = 3) {
  let retry = 0;
  const cwd = process.cwd();

  do {
    await testFn();

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
  } while (retry < maxRetry);

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

module.exports = {
  resultsGeneratedIfTestsPresent,
  runWithRetry
};
