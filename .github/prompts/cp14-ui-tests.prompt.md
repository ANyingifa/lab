---
agent: agent
description: CP14 - automate UI testing (Lab 5, part C)
---

Please implement part C (browser scenarios) of docs/design/lab-5-testing.md using the
TALXIS skills: a Reqnroll and Playwright test project with the scenarios the spec lists.

Work under src/ and the solution file. Name the projects however you like, but keep
the table, column and choice names exactly as the spec has them.

Write each scenario in business language, with Given for the context, one When for the
action and Then for what the person sees, in three to five steps. Keep selectors and
waits in the step definitions, not in the feature files. Prefer test-id selectors to
display text, and wait for an element rather than sleeping. Run the tests as a
least-privileged user, not an admin.

If you get stuck, .lab-scripts/CP14-automate-ui-testing.ps1 does this same step
and is a good example to read.

When you're done, run `dotnet build WarehouseManagement.slnx` and fix anything it
reports. Then tell me to run `lab save`.
