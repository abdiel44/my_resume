# Resume Versioning System

This repository tracks my resume over time using Git. The goal is to keep a clean historical record, preserve reusable resume variants, and make it easy to tailor a resume for different purposes such as internships, research roles, graduate school, scholarships, conferences, and full-time industry applications.

The core idea is simple: treat a resume like a living professional artifact, not a file named `Resume_Final_Final_v7.pdf`.

## Repository Structure

```text
.
+-- README.md
+-- Makefile
+-- docs/
+-- scripts/
`-- resume.tex
```

Current convention:

- `resume.tex` is the main LaTeX source file.
- Generated files such as PDFs, logs, aux files, and build artifacts should not be committed unless there is a deliberate reason.
- Public or shareable versions should be created from tagged commits or clearly named branches.

## Build and Export

This repo uses [Tectonic](https://tectonic-typesetting.github.io/) as the preferred lightweight LaTeX renderer. Tectonic is a single command-line tool that can render `resume.tex` directly to PDF without installing a full traditional TeX distribution.

Build the resume:

```powershell
./scripts/build.ps1
```

The output is written to:

```text
dist/resume.pdf
```

Open the PDF after building:

```powershell
./scripts/build.ps1 -Open
```

Clean generated output:

```powershell
./scripts/build.ps1 -Clean
```

If `make` is installed, these aliases are also available:

```bash
make build
make open
make clean
```

If Tectonic is missing, the script prints install guidance. The official Windows install option from Tectonic is:

```powershell
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://drop-ps1.fullyjustified.net'))
```

Run that command from the repo root to create a local `tectonic.exe`, or place `tectonic` somewhere on PATH. A local `tectonic.exe` is ignored by Git.

Package-manager availability can vary, so verify before installing:

```powershell
winget search tectonic
```

## Branch Strategy

Use branches to represent resume purposes, not random experiments.

Recommended long-lived branches:

- `main`: the canonical, general-purpose resume.
- `internship`: version optimized for internships and early-career opportunities.
- `research`: version focused on research experience, publications, labs, grants, and technical depth.
- `grad-school`: version tailored for graduate school applications.
- `industry`: version focused on software engineering roles.
- `teaching`: version focused on mentoring, tutoring, workshops, and academic service.

Recommended short-lived branches:

- `role/company-name`: a resume tailored for one company or role.
- `application/program-name`: a resume tailored for a school, scholarship, fellowship, or program.
- `experiment/topic`: a temporary branch for testing a new structure, layout, or narrative.

Examples:

```bash
git checkout -b role/google-swe-intern
git checkout -b application/nsf-grfp
git checkout -b experiment/one-page-research-layout
```

## Naming Conventions

Use lowercase branch names with hyphens.

Good:

```text
grad-school
role/microsoft-new-grad
application/mit-ms-cs
experiment/skills-first-layout
```

Avoid:

```text
FinalResume
new-stuff
changes
test
resume2
```

## Commit Rules

Each commit should describe one meaningful resume change.

Good commit messages:

```text
Update Example Cloud Systems impact metrics
Tailor summary for research assistant roles
Add ABET platform project details
Condense experience section to one page
Refine graduate school version
```

Avoid vague messages:

```text
update
fix
resume changes
final
more edits
```

Recommended commit types:

- `content`: experience, projects, education, skills, summary, metrics.
- `layout`: spacing, typography, section order, page length.
- `targeting`: tailoring for a role, school, field, or audience.
- `cleanup`: wording, grammar, consistency, formatting.

Example:

```bash
git commit -m "content: add payment estimation pipeline"
git commit -m "targeting: tailor resume for research roles"
git commit -m "layout: reduce spacing for one-page version"
```

## Tagging Important Versions

Use tags for versions that were submitted, published, shared, or used in an important application.

Examples:

```bash
git tag submitted-google-swe-intern-2026
git tag submitted-grad-school-fall-2027
git tag portfolio-version-2026-09
```

Tags make it easy to answer questions later:

- What resume did I send to this company?
- What did my resume look like before an interview?
- Which version did I use for graduate school applications?
- How has my professional story improved over time?

## Suggested Workflow

1. Start from the most relevant branch.

```bash
git checkout main
git pull
```

2. Create a branch for the purpose.

```bash
git checkout -b role/company-position
```

3. Edit `resume.tex`.

Focus on relevance:

- Put the strongest matching experience first.
- Replace generic claims with evidence.
- Use numbers when they are honest and useful.
- Keep language direct and specific.
- Remove details that do not serve the target audience.

4. Review the diff before committing.

```bash
git diff
```

5. Commit the tailored version.

```bash
git add resume.tex
git commit -m "targeting: tailor resume for company position"
```

6. Tag submitted versions.

```bash
git tag submitted-company-position-2026-09
```

7. Merge reusable improvements back into `main`.

If a change improves the general resume, bring it back:

```bash
git checkout main
git merge role/company-position
```

If a change was only useful for one application, leave it on that branch.

## What Belongs on `main`

The `main` branch should stay broadly useful and truthful across audiences.

Good changes for `main`:

- New jobs, internships, projects, publications, talks, awards, or degrees.
- Stronger metrics or clearer impact.
- Better wording that improves the resume for most readers.
- Layout improvements that help readability.

Changes that usually belong on a branch:

- A summary written for one company or program.
- A reordered project list for one opportunity.
- A field-specific skills section.
- A resume version that exceeds or breaks the normal page limit for a specific purpose.

## Resume Tailoring Rules

Before creating a targeted version, define the audience.

Ask:

- Is this for industry, research, graduate school, teaching, leadership, or scholarship review?
- What will the reader care about in the first 10 seconds?
- Which 3 pieces of evidence best prove fit?
- What can be removed because it does not help this specific reader?

Use this priority order:

1. Truth.
2. Relevance.
3. Evidence.
4. Brevity.
5. Polish.

Never invent experience, metrics, titles, publications, affiliations, or technologies.

## Review Checklist

Before submitting a resume version:

- The branch name clearly explains the purpose.
- The resume fits the required page limit.
- The summary matches the target audience.
- The strongest evidence appears early.
- Dates, titles, company names, and school names are accurate.
- Metrics are honest and defensible.
- Links and email addresses work.
- The PDF was rebuilt from the current commit.
- The submitted version is tagged.

## Privacy and Sharing Rules

This repository may contain personal information.

Before making the repository public or using it in a presentation:

- Remove or replace private phone numbers, addresses, emails, IDs, and sensitive links.
- Avoid exposing private application branches.
- Consider using a sanitized demo branch.
- Do not publish resumes that reveal confidential employer, client, or project details.

Suggested public demo branch:

```bash
git checkout -b demo/resume-versioning
```

## Presentation Tip

This repository can be presented as a practical career habit:

> Version control is not only for code. It can help students and professionals track how their story, skills, and opportunities evolve over time.

Useful points for students and professionals:

- Git creates a history of professional growth.
- Branches make tailoring safer and cleaner.
- Tags preserve exactly what was submitted.
- Diffs make resume edits easier to review.
- A resume repository turns career development into an intentional system.

Additional presentation and skill notes live in:

- `docs/presentation/resume-versioning-demo.md`
- `docs/skills/resume-skills.md`

## Golden Rule

Every resume version should answer one question clearly:

> Why am I a strong fit for this specific opportunity?

If a change does not help answer that question, remove it or move it to a different branch.
