---
agent: agent
description: CP15 - implement unit tests (Lab 5, parts A and B)
---

Please implement parts A and B of docs/design/lab-5-testing.md using the TALXIS
skills: unit tests for the two plugins with FakeXrmEasy, and Jest tests for the form
and ribbon scripts.

Work under src/ and the solution file. Name the projects however you like, but keep
the table, column and choice names exactly as the spec has them.

Test the behavior the spec describes, including the Inbound and Outbound cases, and
run the tests with `dotnet test` and `npm test` before you finish. They shouldn't
need a Dataverse environment.

If you get stuck, .lab-scripts/CP15-implement-unit-tests.ps1 does this same step
and is a good example to read.

When you're done, run `dotnet build WarehouseManagement.slnx` and fix anything it
reports. Then save the checkpoint:

`.lab-scripts/save-checkpoint.ps1 -Id cp15 -Message "Add plugin and script unit test projects with CI workflow"`

It opens a pull request on the fork and waits. Give me the PR link and tell me to review it and
merge it on GitHub (Files changed, Merge pull request, Confirm). Don't merge it yourself.
