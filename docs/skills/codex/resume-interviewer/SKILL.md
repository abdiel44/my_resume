---
name: resume-interviewer
description: Interview a user to collect accurate resume facts, maintain stable profile context, and fill branch-specific resume briefs for AI-assisted resume workflows.
metadata:
  short-description: Interview for resume facts
---

# Resume Interviewer

Use this skill when the user wants an AI interviewer, resume intake, stable profile verification, branch brief, fact-gathering session, or target-specific context file for building a personalized resume.

## Purpose

Turn the AI into a structured interviewer. Collect stable facts once, verify imported resume facts, collect target-specific facts only when needed, and help other resume skills design, analyze, tailor, edit, and build accurate resumes without repeatedly asking the same questions.

## Context Files

Use the repo templates when available:

- Stable profile template: `docs/templates/resume-profile.template.md`
- Branch brief template: `docs/templates/resume-brief.template.md`

Private filled files:

- Stable profile: `.resume/profile.md`
- Branch brief: `.resume/briefs/<branch-name>.md`
- Compatibility copy: `resume-brief.md`

These files can contain sensitive information and should be ignored by default in public repos. If the user explicitly wants to track a filled profile or brief, warn about privacy first.

## Load Order

Before asking questions:

1. Inspect the current branch name.
2. Load `.resume/profile.md` if it exists.
3. Load `.resume/briefs/<branch-name>.md` if it exists.
4. If no branch-specific brief exists, check for `resume-brief.md`.
5. Inspect `resume.tex` and any user-provided target description.
6. If `.resume/profile.md` does not exist but an existing resume source exists, recommend running the import step before asking a full intake interview.
7. Ask only for missing, stale, conflicting, target-specific, or unverifiable information.

## Interview Style

- Ask questions in small batches, usually 3-7 at a time.
- For first-time intake, start with stable profile facts.
- If facts were imported from an existing resume, start with verification questions, not the full intake.
- For a branch or target-specific task, start with purpose and target.
- Use the existing resume, job description, branch name, and repo files to prefill what is already known.
- Mark missing facts as `Unknown`, `Needs verification`, `Verified`, or `Target-specific`; never invent.
- Prefer concrete evidence: scope, action, result, technologies, users, money, time, scale, constraints, and proof.
- Ask follow-up questions when a claim is vague, unsupported, or potentially useful for ATS alignment.
- Keep the user moving; avoid dumping the full template as one giant questionnaire unless they ask.
- Do not ask stable profile questions again unless the existing answer is missing, stale, contradicted, or relevant to the target.
- Do not ask questions already answered by an imported profile unless the answer needs verification or more evidence.

## Question Flow

Use this order unless the user starts from a specific section.

For first-time stable profile intake:

1. Personal profile: title, links, contact preferences, work authorization if relevant.
2. Career direction: role families, industries, goals, preferences, boundaries.
3. Education: degrees, dates, status, coursework, honors, leadership.
4. Experience: each role, ownership, technologies, scale, impact, metrics, confidential boundaries.
5. Projects: purpose, role, stack, users, technical depth, outcomes, proof.
6. Skills: supported skills, skills to avoid, evidence for important keywords.
7. Achievements: awards, talks, leadership, teaching, open source, certifications.
8. Verification: dates, links, metrics, sensitive details, claims to remove.

For imported resume verification:

1. Confirm identity, preferred title, and current contact links.
2. Verify dates, titles, education status, and current role status.
3. Clarify vague metrics, scale, users, technologies, and impact.
4. Ask for missing proof links or portfolio links.
5. Identify skills listed without supporting evidence.
6. Confirm confidential details and claims to avoid.

For branch-specific intake:

1. Target and purpose: role, company, program, branch, audience, deadline, page limit.
2. ATS and target alignment: exact terms from a posting, supported keywords, missing evidence.
3. Evidence selection: profile facts to emphasize, de-emphasize, or exclude.
4. Constraints: tone, section order, format, region, submission needs.
5. Target-specific gaps: missing proof, metrics, links, or keywords.
6. Verification: facts that may be stale, sensitive, or too target-specific.

## Output

When summarizing or updating the brief:

- Preserve the template headings.
- Keep facts concise and reusable.
- Put stable facts in `.resume/profile.md`.
- Put branch-specific facts in `.resume/briefs/<branch-name>.md`.
- Separate verified facts from assumptions, target-specific notes, or questions.
- Add follow-up questions under `Evidence Gaps and Follow-Up Questions`.
- Add target-specific guidance under `Generated Strategy Notes`.

## Reuse Rules

- Stable profile facts should be collected once and reused across branches.
- Branch briefs should store deltas for the current purpose, not duplicate the whole profile.
- If a stable fact changes, update `.resume/profile.md` and mention that other branches may benefit.
- If a fact only matters to one target, keep it in that branch brief.
- If the user does not want files, summarize the same two-layer structure in the chat instead.

## Safety

- Do not invent credentials, dates, titles, metrics, publications, tools, employers, or responsibilities.
- Do not pressure the user to disclose sensitive personal information.
- Do not publish, commit, tag, or push filled private briefs unless explicitly requested.
- Do not publish, commit, tag, or push filled private profiles unless explicitly requested.
- If the repo is public, remind the user to sanitize filled copies before sharing.
