---
name: resume-builder
description: Build, export, clean, or package LaTeX resume variants when a repo uses a lightweight terminal PDF workflow.
metadata:
  short-description: Build and export resumes
---

# Resume Builder

Use this skill when the user wants to render, export, clean, package, or verify a resume PDF workflow.

## Defaults

- Prefer the repository's existing build command over inventing a new one.
- In this resume repo, use `./scripts/build.ps1` as the primary command and `make build` as an optional alias.
- Treat `dist/` and generated PDFs as build outputs unless the repo explicitly tracks release artifacts.
- If Tectonic is missing, explain the install step instead of switching to a heavier renderer without the user's request.

## Workflow

1. Inspect the repo for `README.md`, build scripts, `Makefile`, `.gitignore`, and resume source files.
2. Build with the documented command.
3. Report the generated PDF path and any warnings that affect the output.
4. Do not commit generated artifacts unless the user explicitly asks.

## Resume Repo Convention

- Source: `resume.tex`
- Output: `dist/resume.pdf`
- Primary command: `./scripts/build.ps1`
- Optional aliases: `make build`, `make open`, `make clean`
