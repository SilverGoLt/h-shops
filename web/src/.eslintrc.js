module.exports = {
  root: true,
  env: {
    node: true,
  },
  extends: [
    '@vue/eslint-config-airbnb',
    'plugin:vue/recommended',
    '@vue/typescript',
  ],
  rules: {
    camelcase: 0,
    "@typescript-eslint/naming-convention": [
      "error",
      {
        selector: 'default',
        format: ['camelCase'],
        leadingUnderscore: 'allow',
        trailingUnderscore: 'allow',
      },
      {
        selector: 'variable',
        format: ['camelCase', 'UPPER_CASE', 'PascalCase'],
        leadingUnderscore: 'allow',
        trailingUnderscore: 'allow',
      },
      {
        selector: ["function"],
        // Later should only be left as camelCase
        format: ["camelCase", "PascalCase"],
        leadingUnderscore: "allow",
      },
      {
        selector: 'typeLike',
        // Later should only be left as PascalCase
        format: ['PascalCase', 'camelCase'],
      },
      {
        selector: ['property', 'memberLike'],
        // Should be turned on after mixins are removed
        // format: ['PascalCase', 'snake_case', 'UPPER_CASE', 'camelCase'],
        format: null,
        leadingUnderscore: 'allow',
      },
      {
        selector: "interface",
        format: ["PascalCase"],
        custom: {
          regex: "^I[A-Z]",
          match: true,
        },
      },
    ],
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    "vue/attribute-hyphenation": ["error", "never", {
      ignore: [],
    }],
    "no-shadow": "off",
    "@typescript-eslint/no-shadow": ["error"],
    'no-script-url': 1,
    // TODO: These rules should be removed later, they are added so we could more easily move to vue CLI 4
    // without rewriting all of the files.
    // But after CLI4 is in main branch rules should be removed bit by bit and code updated.
    'vue/no-mutating-props': 1,
    indent: 1,
    'no-tabs': 1,
    'vue/no-use-v-if-with-v-for': 1,
    'function-paren-newline': 1,
    'max-len': [1, 120, 4],
    'arrow-parens': [1, 'always'],
    'import/extensions': 1,
    'no-param-reassign': 1,
    'import/prefer-default-export': 0,
    'import/no-extraneous-dependencies': 1,
    'operator-linebreak': 1,
    'object-curly-newline': 1,
    'prefer-destructuring': 1,
    'eol-last': 1,
    'comma-dangle': 1,
    'no-unused-vars': 1,
    'import/order': 1,
    'no-mixed-spaces-and-tabs': 1,
    'no-trailing-spaces': 1,
    'import/no-useless-path-segments': 1,
    'no-irregular-whitespace': 1,
    'no-restricted-globals': 1,
    'implicit-arrow-linebreak': 1,
    'linebreak-style': 0,
    quotes: [0],
    'prefer-object-spread': 1,
    'no-multiple-empty-lines': 1,
    'no-nested-ternary': 1,
    'no-use-before-define': 1,
    'no-underscore-dangle': 1,
    'vue/script-setup-uses-vars': 0,
  },
  parserOptions: {
    parser: '@typescript-eslint/parser',
  },
  overrides: [
    {
      files: ['**/__tests__/*.{j,t}s?(x)'],
      env: {
        mocha: true,
      },
    },
  ],
  settings: {
    "import/parsers": {
      "@typescript-eslint/parser": [".ts", ".tsx"],
    },
    "import/resolver": {
      typescript: {},
      project: ["tsconfig.json"],
    },
  },
};
