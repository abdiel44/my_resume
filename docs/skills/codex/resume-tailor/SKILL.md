---
name: resume-tailor
description: Tailor a resume for a job description, company, industry, academic program, scholarship, or specific professional purpose.
metadata:
  short-description: Tailor resumes to opportunities
---

# Resume Tailor

Use this skill when the user provides or describes a target opportunity and wants the resume adapted to it.

## Inputs To Use

Consider any available:

- Job description, program description, or call for applications.
- Company, institution, lab, or organization.
- Industry, academic field, or role family.
- Purpose such as internship, research, graduate school, scholarship, conference, or full-time role.
- Required skills, keywords, constraints, page limit, and deadline.

## Tailoring Strategy

- Identify the target reader and the first 10-second signal they need.
- Rank the user's strongest matching evidence.
- Recommend section order, summary angle, skills emphasis, and bullet edits.
- Preserve truth and avoid keyword stuffing.
- Keep general reusable improvements separate from one-off targeting edits.

## Git Convention

When editing a versioned resume repo:

- Use purpose branches such as `role/company-position`, `application/program-name`, or `research`.
- Keep broadly useful improvements suitable for `main`.
- Tag submitted versions when the user asks to preserve an application snapshot.
