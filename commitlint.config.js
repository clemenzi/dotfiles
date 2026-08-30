const fs = require('node:fs');
const path = require('node:path');

const configDirectory = path.join(__dirname, 'config');
const configScopes = fs
  .readdirSync(configDirectory, { withFileTypes: true })
  .filter((entry) => entry.isDirectory())
  .map((entry) => entry.name);

const allowedScopes = [...new Set([...configScopes, 'scripts'])];

module.exports = {
  extends: ['@commitlint/config-conventional'],
  plugins: [
    {
      rules: {
        'scope-required-for-feat-fix': ({ type, scope }) => {
          const requiresScope = type === 'feat' || type === 'fix';

          return [
            !requiresScope || Boolean(scope),
            'feat and fix commits must specify a scope, e.g. feat(nvim): ...',
          ];
        },
      },
    },
  ],
  rules: {
    'scope-required-for-feat-fix': [2, 'always'],
    'scope-enum': [2, 'always', allowedScopes],
  },
};
