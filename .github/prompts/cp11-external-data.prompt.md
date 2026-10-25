---
agent: agent
description: CP11 - integrate external data (Lab 5, parts A to D)
---

Please implement parts A to D of
docs/design/lab-5-external-data-and-background-processing.md using the TALXIS skills:
the Product table, the Open Food Facts custom connector, wiring both into the
Warehouse Picking code app, and the barcode scan.

Work under src/ and the solution file. Use the project names from the project table in docs/design/00-solution-architecture.md,
because the build and deploy steps look for them, and keep
the table, column and choice names exactly as the spec has them.

Do it in the order the spec lists the parts, and make sure each one works before
starting the next. The Product table has to be live in the Dev environment before the
code app can bind to it, so check that it's deployed before you start wiring the app.

If you get stuck, .lab-scripts/CP11-integrate-external-data.ps1 does this same step
and is a good example to read.

When you're done, run `dotnet build WarehouseManagement.slnx` and fix anything it
reports. It also builds the code app, which takes a couple of minutes.
Save the checkpoint after each part, not only at the end, with these messages:

1. After the Product table and the Item lookup: `.lab-scripts/save-checkpoint.ps1 -Id cp11 -Message "Add Product table and Item lookup for external data integration"`
2. After the Open Food Facts connector: `.lab-scripts/save-checkpoint.ps1 -Id cp11 -Message "Add Open Food Facts custom connector, deployed to Dev"`
3. After wiring both into the code app: `.lab-scripts/save-checkpoint.ps1 -Id cp11 -Message "Wire the Product table and Open Food Facts connector into the code app"`
4. After the barcode scan: `.lab-scripts/save-checkpoint.ps1 -Id cp11 -Message "Add barcode scan UI to the item detail page"`

Each save opens its own pull request on the fork and waits. Give me the PR link and tell me to
review it and merge it on GitHub (Files changed, Merge pull request, Confirm), then carry on with the
next part. Don't merge it yourself.
