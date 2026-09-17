# Resume Skill Suite

This document describes a shareable version of the resume-focused Codex skill system. The personal installed skills live outside this repository so they can be used across projects; this file is safe to show in presentations as the public idea.

## Skill Map

- `resume-builder`: build, export, clean, and package resume variants.
- `resume-editor`: improve resume wording, clarity, evidence, ATS readability, and brevity without inventing facts.
- `resume-tailor`: adapt a resume for a job description, company, industry, academic program, scholarship, ATS screen, or other purpose.
- `resume-analyzer`: review a resume against a target opportunity and report strengths, gaps, ATS risks, and alignment.
- `resume-workflow`: orchestrate the resume process from design, analysis, optimization, or build through the remaining steps.
- `resume-presenter`: prepare sanitized demos, slides, and teaching examples around resume versioning.

The shareable skill source files are in `docs/skills/codex/`. Install the same folders into your personal Codex skills directory to use them across resume repositories.

## Shared Principles

- Treat the resume as a truthful professional artifact, not marketing fiction.
- Preserve dates, titles, affiliations, technologies, and metrics unless the user explicitly changes them.
- Prefer concrete evidence over adjectives.
- Optimize for ATS by using truthful target keywords, standard section labels, parser-friendly formatting, and clear role/skill alignment.
- Never keyword-stuff, hide text, or add unsupported tools, titles, credentials, or responsibilities.
- Use branches for purpose-specific variants and tags for submitted versions.
- Keep generated PDFs and LaTeX artifacts out of Git unless there is a deliberate reason.

## Example Inputs

A tailoring request can include:

- Job description.
- Company or program name.
- Industry or academic field.
- Target purpose, such as internship, research, graduate school, scholarship, conference, or full-time role.
- Required fields, keywords, or constraints.
- ATS-relevant terms such as required technologies, role titles, credentials, and repeated responsibilities.
- Desired tone and page limit.

## Example Workflow

Use `resume-workflow` when you want the phases to run in sequence. It can start from any point and continue to the end:

```text
design -> analyze -> optimize -> build
```

Examples:

- `$resume-workflow design for this job description`
- `$resume-workflow analyze my current resume`
- `$resume-workflow optimize for research roles`
- `$resume-workflow build`

Under the hood, the workflow maps to the smaller skills:

1. Design the target strategy.
2. Use `resume-analyzer` to compare the current resume against the target opportunity, including ATS alignment.
3. Use `resume-tailor` and `resume-editor` to strengthen alignment while preserving facts.
4. Use `resume-builder` to export the final PDF.
5. Tag the submitted version in Git only when explicitly requested.

## Presentation Framing

The useful lesson is that Git and Codex can turn resume development into a system:

- Git tracks career growth.
- Branches keep different audiences separate.
- Tags preserve exactly what was submitted.
- Skills make repetitive review and tailoring easier.
- A lightweight renderer keeps exports predictable.
