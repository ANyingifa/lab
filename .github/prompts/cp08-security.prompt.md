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

When you're done, run `dotnet build WarehouseManagement.slnx` and fix anything it
reports. Then save the checkpoint:

`.lab-scripts/save-checkpoint.ps1 -Id cp08 -Message "Add warehouse security roles and entity privileges"`

It opens a pull request on the fork and waits. Give me the PR link and tell me to review it and
merge it on GitHub (Files changed, Merge pull request, Confirm). Don't merge it yourself.
