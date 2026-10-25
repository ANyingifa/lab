# Lab guide

You'll build a **Warehouse Management** app on Power Platform: tables, server-side rules, security roles, an app for managers, an app for floor workers, and a barcode lookup. Everything is source code in your own copy of this repository, and every change reaches `main` through a pull request.

## How the lab works

You move forward in **checkpoints**. There are two kinds:

- **Scripts** set up the project and its pipelines. You run one in the terminal and read what it did.
- **The agent** builds the app. You tell Copilot Chat which part to build, it reads the spec and does the work, and you review the result.

Every checkpoint ends the same way: a **pull request** on your fork that you review and merge.

| Checkpoint | Who does it | What you get |
|---|---|---|
| CP01 | Script | Tools checked, you're signed in to everything |
| CP02 | Script | The repository layout |
| CP03 | Script | `main` protected: changes only through pull requests |
| CP04 | Script | Your Dev and Test environments |
| CP05 | Script | A pipeline that deploys to Test |
| CP06 | Agent | The data model |
| CP07 | Agent | The stock rules (plugins) |
| CP08 | Agent | The security roles |
| CP09 | Agent | The manager app and the worker app |
| CP10 | Script | Your app running in Dev, and a change pulled back to source |
| CP11 | Agent | Barcode lookup with external data |
| CP12 | Agent | Reference data that travels with the app |
| CP13 | Script | The build check becomes required on pull requests |

## Your screen

- **This guide**, on the left.
- **Copilot Chat**, on the right. You can ask it anything about the lab.
- **The terminal**, at the bottom. Open it with **Ctrl+`** if you don't see it. It runs PowerShell.
- **The specs** are in `docs/design/`. Each one opens as a readable page.

## Before you start

- Use a **fork** of this repository on your own GitHub account, and open the Codespace **from your fork**, not from `TALXIS/lab`.
- You'll sign in to GitHub, Power Platform, Azure and Power Apps. **Use the same Microsoft account for the last three.** It needs to be able to create a Power Platform environment.
- When the Codespace opens, its tools are still updating. **Wait until the terminal goes quiet** (about a minute) before you start.

## Part 1: Set up the project

Run each script from the terminal, one after the other.

```powershell
.lab-scripts/CP01-check-machine-setup.ps1
```

**CP01** checks the tools and signs you in. It shows a link and a code for each service: open the link, enter the code and approve. When GitHub asks, allow the `workflow` permission.

```powershell
.lab-scripts/CP02-create-repository-layout.ps1
.lab-scripts/CP03-setup-continuous-integration.ps1
.lab-scripts/CP04-setup-runtime.ps1
.lab-scripts/CP05-setup-continuous-deployment.ps1
```

- **CP02** creates the solution file and the `src/` folder.
- **CP03** blocks direct pushes to `main`.
- **CP04** creates your Dev and Test environments. It takes a few minutes.
- **CP05** creates the deployment identity and the build and deploy workflows. The build check on its pull request will probably show a red ✗. That's expected: the project it builds is added in CP06. You can still merge.

**Each script ends with a pull request link.** Open it and click **Files changed** to see what the script did. Then go back to the terminal and press **Enter**: the script merges the pull request for you.

## Part 2: Build the app with the agent

From here the agent does the building. For each step:

1. **Read the spec** if you want to know what's coming. It's linked in the table below.
2. **Type the command in Copilot Chat.** Start typing `/cp` and pick it from the list.
3. **Let the agent work.** It builds the project, fixes build errors, and tells you what it chose where the spec left a decision open.
4. **When it's done, it opens a pull request and waits.** It gives you the link. Open it and look at **Files changed**. Then click **Merge pull request** and **Confirm merge**, and come back here. The agent carries on by itself.
5. Run the next command.

The agent never merges for you.

| Command | Spec | You get |
|---|---|---|
| `/cp06-data-model` | [Lab 1](docs/design/lab-1-data-model.md) | The Location, Item and Transaction tables |
| `/cp07-backend` | [Lab 2](docs/design/lab-2-server-side-business-logic.md) | Plugins that validate and update stock |
| `/cp08-security` | [Lab 3](docs/design/lab-3-security.md) | The Warehouse manager and worker roles |
| `/cp09a-model-driven-app` | [Lab 4](docs/design/lab-4-user-interface.md) | The manager app |
| `/cp09b-code-app` | [Lab 4](docs/design/lab-4-user-interface.md) | The Warehouse Picking app for the floor |

Run `/cp09a-model-driven-app` first. It doesn't save; `/cp09b-code-app` does.

## Part 3: See it running

```powershell
.lab-scripts/CP10-deploy-and-sync.ps1
```

**CP10** deploys the app to your Dev environment and gives you a link to open it. It then asks you to change a security role in the browser (it tells you how), and pulls that change back into source. Press **Enter** when you've made the change.

## Part 4: External data and reference data

| Command | Spec | You get |
|---|---|---|
| `/cp11-external-data` | [Lab 5](docs/design/lab-5-external-data-and-background-processing.md) | A Product table, the Open Food Facts connector, and a barcode scan in the picking app |
| `/cp12-config-data` | [Lab 1](docs/design/lab-1-data-model.md) | Locations and items that every environment starts with |

`/cp11-external-data` opens **four** pull requests, one after each part. Merge each one before the agent starts the next.

## Part 5: Protect `main`

```powershell
.lab-scripts/CP13-extend-branch-policies-build-checks.ps1
```

**CP13** makes the build check required. From now on a pull request can only merge after its build shows a green ✓.

## If the agent gets stuck

1. Ask it what failed and to fix it. Most build errors it can fix itself.
2. Compare what it did with the spec section its command names.
3. Still stuck? **Run the checkpoint's script instead.** Scripts are safe to run again. First set the agent's half-finished work aside, so it doesn't get in the way:

   ```powershell
   git stash -u
   ```

   Then run the script for that checkpoint (for example `.lab-scripts/CP06-implement-data-model.ps1`). You can get the stashed work back with `git stash pop`.

## If something looks wrong

| What you see | What to do |
|---|---|
| You're not sure where you are | Run `.lab-scripts/lab-status.ps1`. It says what's done and what's next |
| Sign-in errors, or a new Codespace | Run `.lab-scripts/lab-signin.ps1`, or ask Chat to *sign me in* |
| Strange characters appear in the terminal | Close that terminal (the trash-can icon) and open a new one with **Ctrl+`**. Your progress is saved |
| A pull request's build check is red ✗ before CP13 | You can still merge. After CP13, the merge waits for a green ✓ |
| CP04 can't create an environment | Your account may not be allowed to. Ask a facilitator |
| A script stopped halfway | Run it again. Scripts pick up where they left off |

More detail is in the [README](README.md): the [full checkpoint list](README.md#checkpoints), [checkpoint tags](README.md#checkpoint-tags) and [resuming on another machine](README.md#resuming-on-a-different-machine).
