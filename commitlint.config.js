/**
 * Commitlint Configuration
 * 
 * Enforces Conventional Commits specification for commit messages
 * https://www.conventionalcommits.org/
 * 
 * Format: <type>(<scope>): <subject>
 * 
 * Types:
 * - feat: A new feature
 * - fix: A bug fix
 * - docs: Documentation only changes
 * - style: Changes that don't affect code meaning (whitespace, formatting)
 * - refactor: Code change that neither fixes a bug nor adds a feature
 * - perf: Code change that improves performance
 * - test: Adding missing tests or correcting existing tests
 * - build: Changes that affect the build system or external dependencies
 * - ci: Changes to CI configuration files and scripts
 * - chore: Other changes that don't modify src or test files
 * - revert: Reverts a previous commit
 * 
 * Examples:
 * - feat(radar): add new technology entry for AWS Lambda
 * - fix(config): correct quadrant color values
 * - docs(readme): update installation instructions
 * - chore(deps): bump aoe_technology_radar to v4.1.0
 */

module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      [
        'feat',     // New feature
        'fix',      // Bug fix
        'docs',     // Documentation changes
        'style',    // Formatting changes
        'refactor', // Code refactoring
        'perf',     // Performance improvements
        'test',     // Test changes
        'build',    // Build system changes
        'ci',       // CI/CD changes
        'chore',    // Other changes
        'revert',   // Revert a commit
      ],
    ],
    'type-case': [2, 'always', 'lower-case'],
    'type-empty': [2, 'never'],
    'scope-case': [2, 'always', 'lower-case'],
    'subject-empty': [2, 'never'],
    'subject-full-stop': [2, 'never', '.'],
    'header-max-length': [2, 'always', 100],
    'body-leading-blank': [1, 'always'],
    'body-max-line-length': [2, 'always', 100],
    'footer-leading-blank': [1, 'always'],
    'footer-max-line-length': [2, 'always', 100],
  },
};
