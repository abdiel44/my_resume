# Resume Versioning Demo

Use this as a talk track for students and professionals who want a practical way to manage resumes over time.

## Core Message

Version control is not only for code. It can help people track how their professional story changes, compare resume versions, and submit targeted resumes without losing the original.

## Demo Outline

1. Show the problem:
   - `Resume.pdf`
   - `Resume_Final.pdf`
   - `Resume_Final_Real_Final.pdf`
2. Show the repo:
   - `resume.tex`
   - `README.md`
   - `scripts/build.ps1`
   - `dist/resume.pdf`
3. Show branches:
   - `main`
   - `internship`
   - `research`
   - `grad-school`
   - `role/company-position`
4. Show tags:
   - `submitted-google-swe-intern-2026`
   - `submitted-grad-school-fall-2027`
5. Show a build:
   - `./scripts/build.ps1`
   - optional: `make build`

## Demo Script

```bash
git checkout -b role/example-company
git diff
git commit -m "targeting: tailor resume for example company"
git tag submitted-example-company-2026-09
./scripts/build.ps1
```

## Teaching Points

- Branches are for audience and purpose.
- Commits are for meaningful resume changes.
- Tags are for submitted or shared versions.
- Diffs make resume editing reviewable.
- A build script removes friction from exporting PDFs.

## Privacy Reminder

Before presenting, use a sanitized demo branch. Remove private phone numbers, personal email addresses, confidential client names, internal project names, and private application history.
