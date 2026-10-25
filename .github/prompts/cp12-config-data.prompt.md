---
agent: agent
description: CP12 - move configuration data as source (Lab 1, reference data)
---

Please implement the reference data from docs/design/lab-1-data-model-and-security.md
(the Reference data section) as a Configuration Migration package, using the TALXIS
skills, so the records travel with the app instead of being typed into each environment.

Work under src/ and the solution file. Name the projects however you like, but keep
the table and column names exactly as the spec has them. Give each seed record a fixed
GUID, so every environment imports the same records.

The data needs the tables to exist first, so build on the earlier checkpoints.

If you get stuck, .lab-scripts/CP12-move-configuration.ps1 does this same step
and is a good example to read.

When you're done, run `dotnet build WarehouseManagement.slnx` and fix anything it
reports. Then tell me to run `lab save`.
