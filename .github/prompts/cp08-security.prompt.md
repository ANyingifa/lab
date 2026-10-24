---
agent: agent
description: CP08 - implement security roles (Lab 1)
---

Please implement the security roles in docs/design/lab-1-data-model-and-security.md
(the Security roles section): Warehouse Manager and Warehouse Worker, using the TALXIS
skills.

Work under src/ and the solution file. Name the projects however you like, but keep
the role names and the table names exactly as the spec has them.

Follow the privilege depths in the spec exactly: a worker's access is deliberately
narrower than a manager's, and the depth matters as much as the privilege itself.
Put the roles in their own Dataverse solution.

If you get stuck, .lab-scripts/CP08-implement-security.ps1 does this same step
and is a good example to read.

When you're done, run `.lab-scripts/lab-check.ps1 -Checkpoint cp08` and work through
anything it reports. Once it passes, tell me to run `lab save`.
