---
agent: agent
description: CP09 - implement the user interface (Lab 3)
---

Please implement docs/design/lab-3-user-interface.md using the TALXIS skills: the
Warehouse model-driven app (sitemap, forms, views, subgrids, form scripts and the
ribbon button) and the Warehouse Picking code app for floor workers.

Work under src/ and the solution file. Name the projects however you like, but keep
the table, column and choice names exactly as the spec has them. Where the spec
leaves a design decision open, pick something sensible and tell me what you chose.

The UI solution should use the existing tables rather than define them again, so the
data model stays the single owner of every table.

If you get stuck, .lab-scripts/CP09-implement-ui.ps1 does this same step
and is a good example to read.

When you're done, run `.lab-scripts/lab-check.ps1 -Checkpoint cp09` and work through
anything it reports. Once it passes, tell me to run `lab save`.
