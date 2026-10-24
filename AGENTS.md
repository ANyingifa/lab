# Working in this repository

A hands-on Power Platform ALM lab: attendees run the checkpoint scripts in `.lab-scripts/`.

- When the person asks you to sign them in, run `.lab-scripts/lab-signin.ps1` in the terminal
  and walk them through it one tool at a time: tell them which link to open and which code
  to enter, then wait until they're done. Never start a sign-in on your own.
- Don't commit, push, merge or deploy. `lab save` does the saving.
- The person may be new to Git, so explain in plain words.
- When a script prints a PR link, give it to the person with the three clicks (Files changed,
  Merge pull request, Confirm) and wait. Never merge it yourself.
- `.lab-scripts/lab-status.ps1` shows where the lab left off.
- Read `.lab-scripts/` as working examples, but don't edit it.
- Use the `txc` discovery commands to scaffold, not `dotnet new`.
- Ignore the build warning that PDPackage targets aren't verified against the .NET SDK.
- Don't run `txc env sln import` in this lab (it fails with `Build output directory not
  found`). Use `dotnet build`.
- If `pac` reports `No such file or directory` in the first couple of minutes, the tools are
  still updating: wait a minute and retry.
