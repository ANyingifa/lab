---
agent: agent
description: CP09b - implement the Warehouse Picking code app (Lab 3)
---

Please implement the Warehouse Picking code app from docs/design/lab-3-user-interface.md,
using the TALXIS skills. That's user stories US-06 to US-12 and the technical
specification sections "Warehouse Picking code app" and "Test-hook contract".

Start from the `pp-app-code` starter. It comes with Fluent UI and the TALXIS base controls,
so use those for the lists, lookups and form fields. Then add the warehouse screens
on top of it, and reference the app from the UI solution the previous prompt created.

Work under src/ and the solution file. Name the projects however you like, but keep the
table, column and choice names, and the app name, exactly as the spec has them. A few rules
from the spec matter here:
- All data goes through the generated services, with no hand-written calls to Dataverse.
- The app only checks that required fields are filled. It never compares stock itself.
- Server errors are shown with the server's message unchanged.
- The test hooks in the spec's Test-hook contract go on the elements it names, exactly as
  listed, whatever controls you use. The barcode scan comes later, so don't build it now.

You can add extra screens, like a home screen with quick actions, as long as they follow
these rules. Where the spec leaves a design decision open, pick something sensible and
tell me what you chose.

If you get stuck, .lab-scripts/CP09-implement-ui.ps1 does the whole UI step. The code app
part is scaffold/05f-code-app.ps1 and the files under .lab-scripts/templates/05f-code-app/,
which are a good working example.

When you're done, run `dotnet build WarehouseManagement.slnx`. It also builds the code
app, which takes a couple of minutes. Fix anything it reports, then tell me to run `lab save`.
