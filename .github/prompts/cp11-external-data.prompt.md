---
agent: agent
description: CP11 - integrate external data (Lab 4, parts A to D)
---

Please implement parts A to D of
docs/design/lab-4-external-data-and-background-processing.md using the TALXIS skills:
the Product table, the Open Food Facts custom connector, wiring both into the
Warehouse Picking code app, and the barcode scan.

Work under src/ and the solution file. Name the projects however you like, but keep
the table, column and choice names exactly as the spec has them.

Do it in the order the spec lists the parts, and make sure each one works before
starting the next. The Product table has to be live in the Dev environment before the
code app can bind to it, so check that it's deployed before you start wiring the app.

If you get stuck, .lab-scripts/CP11-integrate-external-data.ps1 does this same step
and is a good example to read.

When you're done, run `dotnet build WarehouseManagement.slnx` and fix anything it
reports. It also builds the code app, which takes a couple of minutes. Then tell me to run `lab save`.
