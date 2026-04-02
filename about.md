# Ministry of Justice Technology Radar

## Introduction

The Ministry of Justice Technology Radar is a guide to the technologies, tools, techniques, platforms, and frameworks that we recommend for building digital services at MoJ. It represents our collective experience and provides insights into technology choices based on real-world usage across our teams.

The radar is inspired by the [Thoughtworks Technology Radar](https://www.thoughtworks.com/radar) and built using the [AOE Technology Radar](https://github.com/AOEpeople/aoe_technology_radar) framework.

**Repository**: [ministryofjustice/ministry-of-justice-tech-radar](https://github.com/ministryofjustice/ministry-of-justice-tech-radar)

## Purpose

The Technology Radar serves several key purposes:

- **Guidance**: Help teams make informed decisions about technology choices
- **Consistency**: Promote common approaches and reduce fragmentation
- **Knowledge Sharing**: Share learnings and experiences across the organization
- **Innovation**: Highlight emerging technologies worth exploring
- **Standards**: Align with Ministry of Justice technical standards and best practices

## How to Read the Radar

### Quadrants

The radar is organized into four quadrants representing different types of technology:

1. **Languages & Frameworks** - Programming languages and development frameworks for building software
2. **Techniques** - Software development methods, design patterns, and architectural approaches
3. **Platforms & Operations** - Infrastructure platforms, cloud services, and operational tools
4. **Tools** - Development tools, productivity software, and utilities

### Rings

Each technology is placed in one of four rings based on our recommendation level:

- **Adopt** - Technologies we have high confidence in and recommend for use where appropriate. These are proven in production and well-supported.

- **Trial** - Technologies that show promise and are worth pursuing in projects that can handle the risk. Teams should gain experience with these, but they may not yet be proven at scale.

- **Assess** - Technologies worth exploring to understand their potential impact. These are on our radar for future adoption but require further evaluation.

- **Hold** - Technologies to proceed with caution or avoid for new projects. This doesn't mean "never use," but suggests looking at alternatives first.

## Contributing

We encourage contributions from across MoJ technical teams. To add or update a technology:

1. **Create a branch** from `main`
2. **Add or update** the technology's markdown file in the appropriate `radar/YYYY-MM-DD/` directory
3. **Follow the template** with clear description and rationale
4. **Submit a pull request** for review
5. **Engage in discussion** - ratings reflect collective experience

### Technology Entry Format

Each technology entry should include:

```markdown
---
title: "Technology Name"
ring: adopt|trial|assess|hold
quadrant: languages-and-frameworks|methods-and-patterns|platforms-and-operations|tools
tags: [relevant, tags]
---

## What is it?
Brief description of the technology

## Why MoJ uses/recommends it
Rationale for the rating, including real-world experience

## Considerations
Any caveats, limitations, or things to know
```

## Feedback and Questions

The Technology Radar is a living document. If you have questions, suggestions, or feedback:

- Open an issue in this repository
- Discuss in MoJ technical community channels #devx-nudge-group
- Contact the Developer Experience Team

## Related Resources

- [MoJ Technical Guidance](https://technical-guidance.service.justice.gov.uk/)
- [MoJ Standards](https://ministryofjustice.github.io/technical-guidance/)
- [AOE Technology Radar Framework](https://github.com/AOEpeople/aoe_technology_radar)
