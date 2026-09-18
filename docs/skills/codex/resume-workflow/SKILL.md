---
name: resume-workflow
description: Orchestrate a resume process from import, interview, design, analysis, optimization, or build through the remaining downstream steps.
metadata:
  short-description: Run resume workflows
---

# Resume Workflow

Use this skill when the user wants a resume process, cascade, pipeline, or end-to-end workflow. It coordinates the resume skills and lets the user start from any phase.

## Pipeline

Default phase order:

1. `import`: extract stable facts from an existing resume and draft `.resume/profile.md`.
2. `interview`: verify imported facts, reuse stable profile context, and fill or update a branch-specific resume brief.
3. `design`: define audience, target, branch purpose, success criteria, ATS needs, and resume strategy.
4. `analyze`: review the current resume against the target and identify gaps, risks, ATS alignment, and strengths.
5. `optimize`: edit or recommend edits for clarity, truth, relevance, ATS readability, evidence, and page fit.
6. `build`: render/export the resume PDF and report the output path.

Phase aliases:

- `extract`, `parse`, `onboard`, `current-resume`, `existing-resume` -> `import`
- `intake`, `brief`, `profile`, `questions`, `interviewer`, `verify` -> `interview`
- `strategy`, `plan`, `target`, `purpose` -> `design`
- `review`, `audit`, `score`, `critique` -> `analyze`
- `tailor`, `edit`, `improve`, `rewrite`, `polish` -> `optimize`
- `generate`, `render`, `export`, `pdf` -> `build`

## Start Point

Infer the start phase from the user's request:

- If they mention a job description, company, industry, school, program, scholarship, or target audience, start at `design`.
- If they ask to import, extract, parse, or onboard from an existing resume, start at `import`.
- If they ask to collect information, fill a profile, create a brief, or interview them, start at `interview`.
- If they ask for critique or fit review, start at `analyze`.
- If they ask to improve, rewrite, tailor, or optimize existing content, start at `optimize`.
- If they ask only to render/export, start at `build`.
- If unclear and no `.resume/profile.md` exists but a resume source exists, start at `import`.
- If unclear, start at `analyze` for an existing resume with profile context, `interview` when facts are missing, and `design` for a new target-specific version.

After choosing the start phase, continue through every downstream phase unless the user explicitly asks to stop earlier.

## Phase Behavior

- `import`: use resume-importer behavior when available. Draft stable profile context from `resume.tex` or another named resume source and mark facts for verification.
- `interview`: use resume-interviewer behavior when available. Load stable profile context first, ask concise delta questions, prefill from repo facts, and mark unknowns or verification needs.
- `design`: produce a compact target brief. Identify branch purpose, audience, resume angle, ATS keywords/requirements, strongest evidence to emphasize, likely sections to change, and any missing facts that would materially improve the result.
- `analyze`: use the resume-analyzer lens when available. Lead with must-fix issues, then optional improvements.
- `optimize`: use resume-tailor and resume-editor behavior when available. Preserve truth, improve ATS and human readability, separate suggested edits from confirmed edits, and do not invent facts.
- `build`: use resume-builder behavior when available. Prefer the repo's documented build command and do not commit generated artifacts unless requested.

## Operating Rules

- Keep a visible workflow state: current phase, completed phases, and remaining phases.
- Prefer importing an existing resume before running a full first-time interview.
- Ask only for missing information that blocks a truthful or useful result; otherwise make a reasonable assumption and name it.
- Reuse `.resume/profile.md` for stable facts and `.resume/briefs/<branch-name>.md` for branch-specific facts when those files exist.
- Before editing files, state the intended edit scope.
- Do not commit, tag, push, or publish unless the user explicitly asks.
- For branch-based work, follow the repo's resume convention: purpose branches for variants, `main` for broadly reusable improvements, and tags for submitted versions.
- If a phase cannot run, explain why and continue with the next useful phase when possible.
