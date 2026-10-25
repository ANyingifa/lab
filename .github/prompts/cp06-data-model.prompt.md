---
agent: agent
description: CP06 - implement the data model (Lab 1)
---

Please implement the data model in docs/design/lab-1-data-model-and-security.md
(the Data dictionary section): the Location, Item and Transaction tables with all
their columns, using the TALXIS skills.

Work under src/ and the solution file. Name the projects however you like, but keep
the table, column and choice names exactly as the spec has them, because the checks
look them up by name.

Put the tables in their own Dataverse solution, and add a Package Deployer project
that references it, so one `dotnet build` produces the single package we deploy.

If you get stuck, .lab-scripts/CP06-implement-data-model.ps1 does this same step
and is a good example to read.

When you're done, run `dotnet build WarehouseManagement.slnx` and fix anything it
reports. Then tell me to run `lab save`.
