# Resume Skill Suite

This document describes a shareable version of the resume-focused Codex skill system. The personal installed skills live outside this repository so they can be used across projects; this file is safe to show in presentations as the public idea.

## Skill Map

- `resume-builder`: build, export, clean, and package resume variants.
- `resume-editor`: improve resume wording, clarity, evidence, and brevity without inventing facts.
- `resume-tailor`: adapt a resume for a job description, company, industry, academic program, scholarship, or other purpose.
- `resume-analyzer`: review a resume against a target opportunity and report strengths, gaps, risks, and alignment.
- `resume-presenter`: prepare sanitized demos, slides, and teaching examples around resume versioning.

The shareable skill source files are in `docs/skills/codex/`. Install the same folders into your personal Codex skills directory to use them across resume repositories.

## Shared Principles

- Treat the resume as a truthful professional artifact, not marketing fiction.
- Preserve dates, titles, affiliations, technologies, and metrics unless the user explicitly changes them.
- Prefer concrete evidence over adjectives.
- Use branches for purpose-specific variants and tags for submitted versions.
- Keep generated PDFs and LaTeX artifacts out of Git unless there is a deliberate reason.

## Example Inputs

A tailoring request can include:

- Job description.
- Company or program name.
- Industry or academic field.
- Target purpose, such as internship, research, graduate school, scholarship, conference, or full-time role.
- Required fields, keywords, or constraints.
- Desired tone and page limit.

## Example Workflow

1. Use `resume-analyzer` to compare the current resume against the target opportunity.
2. Use `resume-tailor` to decide which sections need stronger alignment.
3. Use `resume-editor` to rewrite bullets while preserving facts.
4. Use `resume-builder` to export the final PDF.
5. Tag the submitted version in Git.

## Presentation Framing

The useful lesson is that Git and Codex can turn resume development into a system:

- Git tracks career growth.
- Branches keep different audiences separate.
- Tags preserve exactly what was submitted.
- Skills make repetitive review and tailoring easier.
- A lightweight renderer keeps exports predictable.
