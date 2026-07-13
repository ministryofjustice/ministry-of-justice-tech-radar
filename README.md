# Ministry of Justice Technology Radar

[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/ministry-of-justice-tech-radar/badge)](https://github-community.service.justice.gov.uk/repository-standards/ministry-of-justice-tech-radar)

A visual representation of the technologies, tools, techniques, platforms, and frameworks used and recommended across the Ministry of Justice. The Technology Radar helps teams make informed decisions about technology choices and promotes knowledge sharing across the organization.

## What is a Technology Radar?

The Technology Radar is an opinionated guide to technology trends, providing insights into technology choices based on our experiences. It's organized into four quadrants:

- **Languages & Frameworks** - Programming languages and development frameworks
- **Techniques** - Software development methods and design patterns
- **Platforms & Operations** - Infrastructure platforms and operational tools
- **Tools** - Development and productivity tools

Each technology is placed in one of four rings based on our recommendation:

- **Adopt** - Technologies we have high confidence in and recommend for appropriate use cases
- **Trial** - Technologies worth pursuing in projects that can handle the risk
- **Assess** - Technologies worth exploring to understand their potential impact
- **Hold** - Technologies to proceed with caution or avoid for new projects

## Running Locally

### Prerequisites

- Node.js (version 14 or higher)
- npm
- (Optional) Make - for simplified commands

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/ministryofjustice/ministry-of-justice-tech-radar.git
   cd ministry-of-justice-tech-radar
   ```

2. Install dependencies:
   
   **Using Make (recommended):**
   ```bash
   make setup
   ```
   
   **Or using npm directly:**
   ```bash
   npm install
   ```

### Development

Start the local development server:

**Using Make:**
```bash
make serve
```

**Or using npm:**
```bash
npm run serve
```

This will start a local server (typically at `http://localhost:3000`) where you can preview the tech radar.

**Other useful Make commands:**
```bash
make help         # Show all available commands
make build        # Build the tech radar
make validate     # Validate configuration files
make docker-run   # Run using Docker
```

### Build

Generate a production build:

```bash
npm run build
```

This creates an optimized build with strict validation in the `public/` directory.

## Project Structure

```
.
├── radar/              # Technology entries organized by release date
│   └── YYYY-MM-DD/    # Release directories containing markdown files
├── public/            # Built static files (generated)
├── config.json        # Radar configuration (quadrants, colors, toggles)
├── about.md          # Introduction and usage documentation
├── custom.css        # Custom styling
└── package.json      # Project dependencies and scripts
```

## Contributing

### Adding or Updating Technology Entries

1. Create a new branch:
   ```bash
   git checkout -b feature/add-technology-name
   ```

2. Navigate to the appropriate release directory in `radar/` or create a new one following the `YYYY-MM-DD` format.

3. Create or update the technology's markdown file with the following structure:
   ```markdown
   ---
   title: "Technology Name"
   ring: adopt|trial|assess|hold
   quadrant: languages-and-frameworks|methods-and-patterns|platforms-and-operations|tools
   tags: [tag1, tag2]
   ---

   ## Description
   Brief description of the technology...

   ## Rationale
   Why we recommend this technology...
   ```

4. Commit your changes and create a pull request.

### Guidelines

- Keep descriptions concise and focused on MoJ context
- Include clear rationale for the recommendation
- Use appropriate tags for discoverability
- Follow existing naming conventions

### Source of Truth

The source of truth for this radar configuration is [ministryofjustice/octo-access](https://github.com/ministryofjustice/octo-access).

If you make UI or configuration changes in this repository, you must backport the same changes to `octo-access` to avoid drift between repositories.

## Configuration

The radar's appearance and behavior can be customized in [config.json](config.json):

- Quadrant definitions and colors
- UI toggles (search, chart, filters)
- Branding (logo, colors)
- Base paths and URLs

## Built With

- [AOE Technology Radar](https://github.com/AOEpeople/aoe_technology_radar) - The underlying framework

## Environments

| Environment | Branch    | URL                                   | Deployment trigger         |
|-------------|-----------|---------------------------------------|----------------------------|
| Production  | `main`    | https://tech-radar.justice.gov.uk     | Manual (`workflow_dispatch`) |
| Development | `main`    | GitHub Pages preview URL (see below)  | Push to `main`             |

### Branch Strategy

```
feature/*  ──── merged to ──►  main  ──► dev preview auto-deploy
                                     └──► prod deploy (manual trigger)
```

- Work on feature branches (`feature/your-change`)
- Merge to `main` to deploy and validate in the dev preview environment
- Trigger production deployment manually when ready

---

## Deployment

### Production

The Tech Radar is deployed to GitHub Pages from `main` using a manual production workflow.

**Initial Setup:**

1. Go to repository **Settings** → **Pages**
2. Under **Build and deployment**, select **Source: GitHub Actions**
3. Save changes

The production site is available at: `https://tech-radar.justice.gov.uk`

**Deployment Process:**

- **Manual**: Run [Deploy to GitHub Pages](.github/workflows/deploy-prod.yml) from the **Actions** tab (must be run from `main`)
- **CLI option**: `make deploy-prod`

---

### Development Environment

The development environment deploys from `main` using GitHub Pages preview deployments. It is completely isolated from production — it does not use the production CNAME and cannot affect `tech-radar.justice.gov.uk`.

**Deployment Process:**

- **Automatic**: Every push to `main` triggers [Deploy to Dev](.github/workflows/deploy-dev.yml)
- **Manual**: Go to **Actions** → **Deploy to Dev** → **Run workflow**

The live dev URL is shown in the workflow run summary under the `deploy` job and in the repository's **Deployments** panel (environment: `dev`).

---

### Dev DNS Setup

To expose the dev environment at a stable custom subdomain (`dev.tech-radar.justice.gov.uk`) instead of the GitHub preview URL, follow these steps:

#### 1. Configure the GitHub Pages environment

In repository **Settings** → **Environments** → `dev`:

- Enable **Required reviewers** if gated approvals are needed for dev
- Set **Deployment branches**: `main` only

#### 2. Add a GitHub repository variable for the dev base URL

In repository **Settings** → **Secrets and variables** → **Actions** → **Variables**:

| Name            | Value                                     |
|-----------------|-------------------------------------------|
| `DEV_BASE_URL`  | `https://dev.tech-radar.justice.gov.uk`   |

This overrides the base URL in the dev build so all internal links resolve correctly under the subdomain.

#### 3. Create a DNS record

Add the following DNS record via the MoJ DNS management process (raise a request with the Operations Engineering team or update the relevant DNS zone file):

```
dev.tech-radar.justice.gov.uk  CNAME  ministryofjustice.github.io
```

> **Note:** GitHub Pages only supports one CNAME per repository for the production custom domain. The dev subdomain is handled separately through GitHub's preview deployment feature, which serves at a unique URL. For a stable `dev.*` subdomain, the team managing `justice.gov.uk` DNS must add the CNAME above.

#### 4. Add a `dev` CNAME file to the build (optional stable subdomain)

If you want the dev environment to consistently serve at `dev.tech-radar.justice.gov.uk`, remove the `rm -f build/CNAME` step in [deploy-dev.yml](.github/workflows/deploy-dev.yml) and instead add a `public/CNAME-dev` file with the content:

```
dev.tech-radar.justice.gov.uk
```

Then update the workflow build step to copy it:

```yaml
- name: Set dev CNAME
  run: cp public/CNAME-dev build/CNAME
```

> This requires GitHub Pages to be configured to allow the custom domain on the `dev` environment. This is an advanced setup — the simpler approach is to use the GitHub preview URL for day-to-day dev testing.

---

### Monitoring & Rollback

**Check deployment status:**
- **Actions** tab shows workflow runs and deployment history
- **Deployments** panel (right sidebar of the repo) shows both `github-pages` (prod) and `dev` environments

**Rollback production if needed:**
```bash
git revert HEAD  # Revert the problematic commit on main
git push         # Push the revert commit to main
make deploy-prod # Trigger production deployment
```

**Rollback dev:**
```bash
git revert HEAD  # On the main branch
git push origin main
```

### Troubleshooting

**Build failures:**
- Check Actions logs for errors
- Test locally: `npm run build`
- Verify Node.js version matches `NODE_VERSION` repository variable

**404 errors:**
- Confirm GitHub Pages source is "GitHub Actions" (not branch) in repo Settings
- Check that `build/` directory is present in the deployment artifact

**Dev URL not working:**
- Check the `deploy` job summary in the Actions run for the preview URL
- Verify DNS propagation: `dig dev.tech-radar.justice.gov.uk`

**DNS issues (production):**
```bash
dig tech-radar.justice.gov.uk  # Should return CNAME to ministryofjustice.github.io
```

For deployment support, contact Developer Experience Team (#developer-experience-team on Slack).

If your repository is private with no GitHub Advanced Security license, remove the `.github/workflows/dependency-review.yml` file.

```bash
npm run build
```

This creates an optimized build with strict validation in the `public/` directory.

## Project Structure

```
.
├── radar/              # Technology entries organized by release date
│   └── YYYY-MM-DD/    # Release directories containing markdown files
├── public/            # Built static files (generated)
├── config.json        # Radar configuration (quadrants, colors, toggles)
├── about.md          # Introduction and usage documentation
├── custom.css        # Custom styling
└── package.json      # Project dependencies and scripts
```

## Contributing

### Adding or Updating Technology Entries

1. Create a new branch:
   ```bash
   git checkout -b feature/add-technology-name
   ```

2. Navigate to the appropriate release directory in `radar/` or create a new one following the `YYYY-MM-DD` format.

3. Create or update the technology's markdown file with the following structure:
   ```markdown
   ---
   title: "Technology Name"
   ring: adopt|trial|assess|hold
   quadrant: languages-and-frameworks|methods-and-patterns|platforms-and-operations|tools
   tags: [tag1, tag2]
   ---

   ## Description
   Brief description of the technology...

   ## Rationale
   Why we recommend this technology...
   ```

4. Commit your changes and create a pull request.

### Guidelines

- Keep descriptions concise and focused on MoJ context
- Include clear rationale for the recommendation
- Use appropriate tags for discoverability
- Follow existing naming conventions

## Configuration

The radar's appearance and behavior can be customized in [config.json](config.json):

- Quadrant definitions and colors
- UI toggles (search, chart, filters)
- Branding (logo, colors)
- Base paths and URLs

## Built With

- [AOE Technology Radar](https://github.com/AOEpeople/aoe_technology_radar) - The underlying framework

- [MoJ DevSecOps Hooks](https://github.com/ministryofjustice/devsecops-hooks)
- [MoJ DevSecOps Actions](https://github.com/ministryofjustice/devsecops-actions)
- [Conventional Commits](https://www.conventionalcommits.org/)

