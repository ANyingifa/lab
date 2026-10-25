#!/usr/bin/env pwsh
#
# Save a checkpoint the way every CP script ends: commit on checkpoint/<Id>, open a PR on your
# fork, wait for it to be merged on GitHub, then tag <Id>. Use it when you or an agent built a
# checkpoint by hand instead of running its script.
#
# Before saving, it records the checkpoint's lab-state flags, the ones the CP script's scaffold
# steps set. lab-status.ps1 only calls a checkpoint done when its tag AND these flags are there,
# and the scaffold steps skip work whose flag is set, so a checkpoint saved here is treated like
# one the script built. Run it only after the build passes.
#
# It otherwise only calls Save-Checkpoint from lib/Lab.Common.ps1. It runs as its own process on
# purpose: Save-Checkpoint calls 'exit' when something goes wrong, which would close your terminal
# if the function were loaded into it.
#
# Run:  .lab-scripts/save-checkpoint.ps1 -Id cp06 -Message "Add warehouse data model schema and column definitions"
#       .lab-scripts/save-checkpoint.ps1 -Id cp11 -Step 2 -Message "Add Open Food Facts custom connector, deployed to Dev"
#       (-Body takes the PR description; without it the PR body is the message. CP11 saves four
#        times, so it needs -Step 1 to 4.)
# ──────────────────────────────────────────────────────────────────────────────────────────

param(
    [Parameter(Mandatory)][string]$Id,
    [Parameter(Mandatory)][string]$Message,
    [string]$Body,
    [ValidateRange(0, 4)][int]$Step = 0
)

$ErrorActionPreference = "Stop"
. "$PSScriptRoot/lib/Lab.Common.ps1"

# The same keys lab-status.ps1 checks. CP11 lands in four steps, each with its own flags;
# productTableDeployed and connectorDeployed are set by the imports into Dev that steps 1 and 2 do.
$flags = @{
    cp06 = @('packageDeployerScaffolded', 'dataModelScaffolded', 'columnsScaffolded')
    cp07 = @('pluginsScaffolded', 'logicSolutionScaffolded')
    cp08 = @('securityScaffolded')
    cp09 = @('uiSolutionScaffolded', 'sitemapScaffolded', 'formsScaffolded', 'viewsSubgridsScaffolded',
             'formScriptsScaffolded', 'ribbonScaffolded', 'gridControlScaffolded')
    cp11 = @{
        1 = @('productTableScaffolded', 'productTableDeployed')
        2 = @('connectorScaffolded', 'connectorDeployed')
        3 = @('productDataSourceScaffolded', 'connectorDataSourceScaffolded')
        4 = @('barcodeScanUiScaffolded')
    }
}

$keys = $flags[$Id]
if ($Id -eq 'cp11') {
    if ($Step -lt 1) { Write-Err "CP11 saves in four steps: pass -Step 1 to 4."; exit 1 }
    $keys = $keys[$Step]
}
foreach ($key in $keys) { Set-LabValue $key $true }

# CP12's flags hold the paths of the reference data package, not true/false.
if ($Id -eq 'cp12') {
    $dataDir = Join-Path $LabRoot "src/Packages.Main/Data"
    Set-LabValue 'configDataDirectory'  $dataDir
    Set-LabValue 'configDataSchemaPath' (Join-Path $dataDir "data_schema.xml")
    Set-LabValue 'configDataFilePath'   (Join-Path $dataDir "data.xml")
}

Save-Checkpoint -Id $Id -Message $Message -Body $Body
