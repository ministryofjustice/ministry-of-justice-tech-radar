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

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/ministryofjustice/ministry-of-justice-tech-radar.git
   cd ministry-of-justice-tech-radar
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

### Development

Start the local development server:

```bash
npm run serve
```

This will start a local server (typically at `http://localhost:3000`) where you can preview the tech radar.

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

## Configuration

The radar's appearance and behavior can be customized in [config.json](config.json):

- Quadrant definitions and colors
- UI toggles (search, chart, filters)
- Branding (logo, colors)
- Base paths and URLs

## Built With

- [AOE Technology Radar](https://github.com/AOEpeople/aoe_technology_radar) - The underlying framework

