# Ministry of Justice Template Repository

[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/template-repository/badge)](https://github-community.service.justice.gov.uk/repository-standards/template-repository)

This template repository equips you with the default initial files required for a Ministry of Justice GitHub repository.

## Included Files

The repository comes with the following preset files:

- LICENSE
- .gitignore
- CODEOWNERS
- dependabot.yml
- GitHub Actions example files
- Ministry of Justice Compliance Badge (public repositories only)

## Setup Instructions

Once you've created your repository using this template, ensure the following steps:

### Update README

Edit this README.md file to document your project accurately. Take the time to create a clear, engaging, and informative README.md file. Include information like what your project does, how to install and run it, how to contribute, and any other pertinent details.

### Update repository description

After you've created your repository, GitHub provides a brief description field that appears on the top of your repository's main page. This is a summary that gives visitors quick insight into the project. Using this field to provide a succinct overview of your repository is highly recommended.

This description and your README.md will be one of the first things people see when they visit your repository. It's a good place to make a strong, concise first impression. Remember, this is often visible in search results on GitHub and search engines, so it's also an opportunity to help people discover your project.

### Grant Team Permissions

Assign permissions to the appropriate Ministry of Justice teams. Ensure at least one team is granted Admin permissions. Whenever possible, assign permissions to teams rather than individual users.

Prefer to user GitHub Teams over individual access to repositories. Where appropriate, ensure GitHub Teams used are related to a Parent Team associated with a Business Unit to help ensure ownership can be easily identified.

### Read about the GitHub repository standards

Familiarise yourself with the Ministry of Justice GitHub Repository Standards. These standards ensure consistency, maintainability, and best practices across all our repositories.

You can find the standards [here](https://github-community.service.justice.gov.uk/repository-standards/guidance).

Please read and understand these standards thoroughly and enable them when you feel comfortable.

### Modify the GitHub Standards Badge

Once you've ensured that all the [GitHub Repository Standards](https://github-community.service.justice.gov.uk/repository-standards/guidance) have been applied to your repository, it's time to update the Ministry of Justice (MoJ) Compliance Badge located in the README file.

The badge demonstrates that your repository is compliant with MoJ's standards.

To update the badge, replace the `template-repository` in the badge URL with your repository's name. The badge URL should look like this:

```markdown
[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/${your-repository-name}/badge)](https://github-community.service.justice.gov.uk/repository-standards/${your-reposistory-name})
```

**Please note** the badge will not function correctly if your repository is internal or private. In this case, you may remove the badge from your README.

### Update CODEOWNERS

(Optional) Modify the CODEOWNERS file to specify the teams or users authorized to approve pull requests.

### Configure Dependabot

Adapt the dependabot.yml file to match your project's [dependency manager](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file#package-ecosystem) and to enable [automated pull requests for package updates](https://docs.github.com/en/code-security/supply-chain-security).

### Dependency Review

If your repository is private with no GitHub Advanced Security license, remove the `.github/workflows/dependency-review.yml` file.

## DevSecOps Integration

This repository implements comprehensive DevSecOps practices using Ministry of Justice standards:

### Pre-Commit Hooks

Pre-commit hooks automatically run security and quality checks before each commit:

1. **Install pre-commit** (choose one):
   ```bash
   # Using prek (recommended)
   pip install prek
   
   # Or using pre-commit
   pip install pre-commit
   ```

2. **Activate hooks**:
   ```bash
   prek install
   # Or: pre-commit install
   ```

3. **Test hooks** (optional):
   ```bash
   prek run --all-files
   # Or: pre-commit run --all-files
   ```

**Configured Hooks:**
- 🔐 **Secret Scanner** - Detects hardcoded secrets using GitLeaks
- ✂️ **Trailing Whitespace** - Removes trailing whitespace
- ✅ **YAML/JSON Validation** - Validates syntax
- 📦 **Large File Check** - Prevents files >500KB
- 🔑 **Private Key Detection** - Detects private keys

### Conventional Commits

Commit messages must follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

**Format:** `<type>(<scope>): <subject>`

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `chore`: Maintenance tasks
- `ci`: CI/CD changes
- `refactor`: Code refactoring
- `test`: Test changes

**Examples:**
```bash
git commit -m "feat(radar): add AWS Lambda technology entry"
git commit -m "fix(config): correct quadrant colors"
git commit -m "docs(readme): update installation guide"
git commit -m "chore(deps): bump npm dependencies"
```

### GitHub Actions Workflows

Automated security and quality workflows run on every push and pull request:

- **🔍 SCA (Software Composition Analysis)** - Multi-tool security scanning
  - Dependency Review
  - OWASP Dependency Check
  - Secret Scanning (GitLeaks + TruffleHog)
  - CodeQL SAST Analysis
  - SBOM Generation
  - OpenSSF Scorecard

- **✏️ Lint Check** - Code quality validation
  - JSON validation
  - YAML validation
  - Build verification

### Security Configuration

- `.gitleaks.toml` - GitLeaks configuration for secret detection
- `.gitleaksignore` - False positive exclusions
- `.github/dependency-review-config.yml` - Dependency security policies
- `commitlint.config.js` - Commit message validation rules

### References

- [MoJ DevSecOps Hooks](https://github.com/ministryofjustice/devsecops-hooks)
- [MoJ DevSecOps Actions](https://github.com/ministryofjustice/devsecops-actions)
- [Conventional Commits](https://www.conventionalcommits.org/)
