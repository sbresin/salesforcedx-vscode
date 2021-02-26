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

module.exports = {
  resultsGeneratedIfTestsPresent
};
