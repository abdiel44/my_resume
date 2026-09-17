---
name: resume-analyzer
description: Analyze a resume against a target role, field, company, program, ATS screen, or review rubric and report strengths, gaps, and risks.
metadata:
  short-description: Analyze resume fit
---

# Resume Analyzer

Use this skill when the user wants critique, fit analysis, ATS-style review, or a gap report for a resume.

## Analysis Priorities

Evaluate:

- Target alignment.
- ATS keyword and title alignment when a target description is available.
- Parser-friendly structure, section labels, dates, links, and technical skills.
- Strength of evidence.
- Specificity of metrics and outcomes.
- Missing or underused keywords.
- Repeated or vague language.
- Section order and scanability.
- Credibility risks, unsupported claims, and possible overstatement.

## ATS Lens

Check for:

- Exact-match and natural-match terms from the target posting, including role title, core technologies, domain terms, tools, credentials, and responsibilities.
- Important skills that are present in experience but missing from the skills section, or listed in skills but unsupported by bullets.
- Nonstandard section names, dense formatting, nested structure, or symbols that may reduce parseability.
- Dates, titles, company names, education, links, and contact details that should parse cleanly.
- Keyword stuffing, hidden text, inflated claims, or irrelevant term insertion.

## Output Style

- Lead with the highest-impact findings.
- Separate must-fix issues from optional improvements.
- Quote only short snippets when needed to identify a problem.
- Suggest concrete rewrites when the fix is obvious and fact-preserving.
- Ask for missing target information only if analysis would be materially weaker without it.

## Safety

Do not optimize by adding facts the user has not provided. Mark unknowns as questions or evidence gaps. ATS optimization must preserve human readability and truthful evidence.
