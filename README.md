# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)

## Pull Custom Object Metadata from ScratchOrg
https://salesforce.stackexchange.com/questions/199177/salesforce-dx-fails-to-pull-report-and-dashboard-metadata

sfdx force:source:retrieve -m CustomObject

validation rules are included when importing custom object

## Pull Custom Tabs Metadata from ScratchOrg

sfdx force:source:retrieve -m CustomTab

## Pull Custom Metadata Type from ScratchOrg

sfdx force:source:retrieve -m CustomMetadata

## Pull Application from ScratchOrg

sfdx force:source:retrieve -m CustomApplication

## Pull Layouts from ScratchOrg

sfdx force:source:retrieve -m Layout

## Pull Static Resources from ScratchOrg

sfdx force:source:retrieve -m StaticResource

## Pull Picklist value set from ScratchOrg

sfdx force:source:retrieve -m GlobalValueSet

## Pull Reports and Dashboards set from ScratchOrg
For some reason did not work when executing
sfdx force:source:retrieve -m Report
So try retrieving the specific report such as
sfdx force:source:retrieve -m Report:AgroReports/Sectors_with_SoilAnalysis_Report
https://salesforce.stackexchange.com/questions/353499/how-to-retrieve-salesforce-reports-in-a-subfolder-using-vs-code
In case of dashboards, if the look up for the value of the DeveloperName field
sfdx force:source:retrieve -m Dashboard:AgroDashboards/ZiqqorDFgzQZLdlusngGvkumrSGyzD

## Badge Styling

https://www.lightningdesignsystem.com/components/badges/#Styling-Hooks-Overview

sfdx force:source:retrieve -m [FEATURE]:[NAME]

## Push Source and Override Conflicts
sfdx force:source:push -f
