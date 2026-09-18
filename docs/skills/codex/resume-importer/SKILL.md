---
name: resume-importer
description: Extract stable resume facts from an existing resume and draft a private resume profile for later verification and tailoring.
metadata:
  short-description: Import resume facts
---

# Resume Importer

Use this skill when the user already has a resume and wants to create or update a stable resume profile from it.

## Purpose

Convert an existing resume into structured profile context so the AI does not need to ask the full intake interview. The importer drafts facts; the interviewer verifies gaps afterward.

## Inputs

Use any available resume source:

- `resume.tex` in this repo.
- Pasted resume text.
- Markdown or plain text resume files.
- Another user-provided resume file that can be read in the workspace.

If multiple resume sources exist, prefer the one the user named. Otherwise prefer `resume.tex`.

## Output

Draft or update the stable profile:

- `.resume/profile.md`

Use the tracked template as the structure:

- `docs/templates/resume-profile.template.md`

This profile is private by default and should remain ignored by Git unless the user explicitly asks to track a sanitized copy.

## Import Rules

- Preserve the meaning of the source resume.
- Mark facts found directly in the resume as `Extracted from resume`.
- Mark unclear or possibly stale facts as `Needs verification`.
- Mark missing facts as `Unknown`.
- Do not infer unsupported metrics, responsibilities, dates, titles, tools, awards, credentials, publications, work authorization, or links.
- Keep branch-specific target strategy out of `.resume/profile.md`; put target-specific details in a branch brief instead.

## Extraction Priorities

Extract stable facts first:

1. Contact and public links.
2. Professional title or summary signals.
3. Education.
4. Experience inventory.
5. Project inventory.
6. Skills and evidence.
7. Achievements and leadership signals.
8. Reusable resume preferences and privacy boundaries when visible.
9. Verification questions.

## Follow-Up

After drafting the profile:

- Summarize the strongest extracted facts.
- List the highest-value verification questions.
- Recommend using `resume-interviewer` to fill only missing or ambiguous profile sections.
- Do not proceed to tailoring, editing, building, committing, or publishing unless requested.

## Safety

- Treat imported resumes as potentially private.
- Do not commit, tag, push, or publish `.resume/profile.md` unless explicitly requested after a privacy warning.
- If the source resume includes sensitive details, preserve them only when needed and flag them under privacy boundaries.
