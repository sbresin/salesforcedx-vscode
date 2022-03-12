const sourceRoot = 'packages/salesforcedx-vscode-core'

module.exports = function (plop) {
  // controller generator
  plop.setGenerator('sfdx-cli', {
      description: 'Adds a SFDX CLI command to VSCode Command Palette',
      prompts: [{
          type: 'input',
          name: 'cmd',
          message: 'SFDX CLI command'
      },
      {
        type: 'input',
        name: 'id',
        message: 'VSCode command ID',
        default: 'sfdx.force.'
        }
    ],
      actions: [{
          type: 'append',
          path: `${sourceRoot}/package.json`,
          pattern: `"commandPalette": [`,
          template: `       
            { 
                "command": "{{id}}" 
            },`
      },
      {
        type: 'append',
        path: `${sourceRoot}/package.json`,
        pattern: `"commands": [`,
        // TODO(fix): for title replace "." with "_" in id
        template: `   
        { 
            "command": "{{id}}", 
            "title": "%{{id}}_text%"
        },`
        }
    ]
  });
};