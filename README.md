# ICM-SWMM-Ruby

# Innovyze open source scripts
This repository will host open source code that can be used in the Innovyze Workgroup products. This includes Ruby for the UI/Exchange, SQL and other useful scripts.

The [Exchange](https://innovyze-emea01.s3-eu-west-1.amazonaws.com/WorkgroupProducts/Dropbear/2021.8/Exchange.pdf) documentation includes (almost) all available Ruby methods and will be updated regularly.

## Scope 
Scripts posted here are generally developed by Innovyze Support on the back of a specific customer request, but we're not programmers. Therefore, the scripts might not always be entirely optimised. Feel welcome to contribute with pull requests and raise issues for changes that you'd like to see.

It would be a desirable by-product if this space reached enough critical mass that a community of like-minded users would help each other, suggest improvements and propose new ideas. Feel free to make use of [Issues](https://github.com/innovyze/Open-Source-Support/issues).

This is not the place to develop bespoke code for customers, nor ever will we post it here. This can be requested from Innovyze within the scope of an implementation project.

# Languages
## Ruby
Ruby scripts are split into those which run from the UI and those which run via the Exchange API. The differences between the two are explicit in the [Exchange](https://innovyze-emea01.s3-eu-west-1.amazonaws.com/WorkgroupProducts/Dropbear/2021.8/Exchange.pdf) documentation.

In this repository:
* Scripts that run from the **UI** will follow the nomenclature `UI_script.rb`. These can be run from the Workgroup Client.
* Scripts that run from via **Exchange** will follow the nomenclature `EX_script.rb`. These need to be passed to `IExchange.exe` to run, which is present in the folders of every version of the Workgroup Client installation in both 32-bit and 64-bit. This requires a valid Exchange license.

The `bat` file encapsulates commands that call the Exchange executable and provide the Ruby script in the same folder as a parameter for a specific Workgroup Client version. It allows a degree of customisation - see an example below:
```bat
@ECHO OFF
SET script=EX_script.rb
SET version=2021.1
SET bit=64
IF %bit%==32 (SET "path=C:\Program Files (x86)")
IF %bit%==64 (SET "path=C:\Program Files")
"%path%\Innovyze Workgroup Client %version%\IExchange" "%~dp0%script%" ICM
```
This example BAT script passes an `EX_script.rb` Ruby script to the `IExchange.exe` executable version `2021.1` using the `64-bit` architecture.

Multiple scripts performing a similar task can be stored under the same folder. These should be appended with the suffix `_v?`, where `?` is an integer representing each variant.

## SQL (of the Innovyze Workgroup Products variety)
Innovyze implements its own subset of SQL (Structured Query Language) for selecting and updating network objects using specified criteria.
An SQL query consists of a number of clauses separated by semi-colons. Each clause can do one of the following:
* Select objects 
* Deselect objects 
* Update fields in objects 
* Clear the selection 

Within the GUI users can create Stored Query objects where SQL queries can be built using a dialog.

# Disclaimer
## Structure
This project is currently growing in a rather organic fashion. We might decide to change the structure, which might mean broken links. We're also open to structure changes by users if they improve usability. We'll try to avoid this as best as possible, but during the early stages of the project this can happen frequently.

## Liability
Innovyze Support will post and moderate code posted here in good faith. This is open source and is available for anyone to interrogate. 

**Innovyze is not liable for unintended consequences of code posted here, nor does it have a responsibility for maintaining it.**
-
 
# InfoWorks ICM - Ruby Scripts

## Index of contents

### Index

| ID   | Type     | Name                                                                | Category              |
|------|----------|---------------------------------------------------------------------|-----------------------|
| 0001 | UI & EX  | Decrease Manning's n roughness in all the river reaches             | Network Data Get      |
| 0002 | UI & EX  | Runoff surfaces from selected subcatchments                         | Network Data Get      |
| 0003 | UI & EX  | Find parent Model Group ID                                          | Database Data Get     |
| 0004 | UI & EX  | Connect subcatchment to nearest node                                | Network Data Set      |
| 0005 | UI & EX  | Trace network from selection                                        | Network Data Analysis |
| 0006 | EX       | Copy a run and set 'Working' flag                                   | Simulations Run       |
| 0007 | EX       | Running simulations                                                 | Simulations Run       |
| 0008 | UI & EX  | List all results fields in a simulation                             | Network Data Get      |
| 0009 | EX       | ICM Binary Results Export                                           | Network Data Export   |
| 0011 | UI & EX  | Find Root Model Group                                               | Database Get          |
| 0012 | UI & EX  | ODEC Export Node and Conduit tables to CSV and MIF                  | Network Data Export   |
| 0014 | UI & EX  | Find all flags in all objects of a network model                    | Network Data Get      |
| 0015 | UI & EX  | Import or Export RTC to txt                                         | Network RTC  Bin      |
| 0016 | UI & EX  | Example ODEC callback scripts                                       | Network Data Export   |
| 0017 | UI & EX  | Create a node from polygon boundary                                 | Network Data Set      |
| 0018 | UI & EX  | Checking conveyance using Ruby                                      | Network Data Analysis |
| 0019 | UI & EX  | River reach bank spacing                                            | Network Data Get      |
| 0020 | UI & EX  | Set the river reach section ends to the bank level                  | Network Data Set      |
| 0021 | UI & EX  | Populate conduit inverts with cross section Zs                      | Network Data Set      |
| 0022 | UI & EX  | Output CSV of calcs based on Subcatchment Data                      | Network Data Get      | <!--  Justification for category: CSV generated via Ruby File class rather than Export API -->
| 0023 | TBC      | Ground Model Import                                                 | Network Data Import   | <!--  Type: TBC - If this imports a ground model into the UI then this is `UI` only however if this actually updates manholes with ground model data this is `UI & EX`? -->
| 0025 | EX       | Recursively find model network                                      | Database Data Get     |
| 0026 | UI & EX  | Export to geodatabase                                               | Network Data Export   |
| 0027 | UI & EX  | Copy a subcatchment and rename it                                   | Network Data Set      |
| 0028 | UI & EX  | Percentage change in runoff surfaces upstream node into new scenario| Network Data Set      | <!-- Consider a Network Scenario Set Category -->
| 0030 | UI & EX  | Maintain only first and last river reach sections                   | Network Data Set      |
| 0031 | UI & EX  | Replace flag in all objects in a model network                      | Network Data Set      |
| 0033 | EX       | Export a tree object file                                           | Database Data Export  |
| 0034 | EX       | Check sim status                                                    | Simulations Data Get  |
| 0035 | EX       | Copy objects to new transportable                                   | Database Data Export  |
| 0036 | UI & EX  | Export CSV with QM results from UI                                  | Simulations Data Get  |
| 0037 | EX       | Rerunning existing simulation                                       | Simulations Run       |
| 0038 | EX       | Querying simulation objects                                         | Simulations Data Get  |
| 0039 | UI & EX  | Calculate subcatchment areas in all nodes upstream a node           | Network Data Analysis |
| 0040 | UI & EX  | Create a new selection list using a SQL query                       | Network Data Analysis |
| 0041 | UI & EX  | Minimum and maximum elevation of river reach section at node        | Network Data Get      |
| 0042 | UI       | Running an Exchange script from the UI                              | System Automation     |
| 0043 | UI       | Get results from all timesteps                                      | Simulations Data Get  |
| 0044 | UI       | Import Flow Survey Data                                             | Database Data Set     |
| 0044 | UI       | Trace Current Network family in database tree                       | Database Data Get     |
| 0045 | UI       | Clear SUDS control data from all the subcatchments                  | Network Data Set      |
| 0046 | UI       | Output SUDS control data from all subcatchments to a csv            | Network Data Get      |
| 0047 | UI       | Select links sharing the same us and ds node ids                    | Network Data Get      |
| 0048 | UI       | Delete all scenarios except Base                                    | Network Data Set      |
| 0049 | EX       | Extract river reach results                                         | Network Data Get      |
| 0050 | EX       | Find Nearest Storage Node                                           | Network Data Get      |
| 0051 | EX       | File Read                                                           | Network Data Get      |
| 0052 | EX       | Quick Trace for InfoWorks and SWMM Networks                         | Network Data Get      |
| 0053 | EX       | Extract river reach results                                         | Network Data Get      |
| 0054 | EX       | Extract river reach results                                         | Network Data Get      |
| 0055 | EX       | Extract river reach results                                         | Network Data Get      |
| 0055 | EX       | Extract river reach results                                         | Network Data Get      |
| 0055 | EX       | Extract river reach results                                         | Network Data Get      |
| 0055 | EX       | Extract river reach results                                         | Network Data Get      |
| 0055 | EX       | Extract river reach results                                         | Network Data Get      |
| 0055 | EX       | Extract river reach results                                         | Network Data Get      |
| 0055 | EX       | Extract river reach results                                         | Network Data Get      |
| 0055 | EX       | Extract river reach results                                         | Network Data Get      |
| 0055 | EX       | Extract river reach results                                         | Network Data Get      |

### Descriptions

* Field `Type`:
    * `UI & EX` - Script can be ran in either UI or ICM Exchange
    * `UI` - Script is designed to run in the UI only
    * `EX` - Script is designed to run in the ICM Exchange only
    * `TBC` - Requires assessment from a maintainer
* Field `Category`:
    * `Network Data Bin`      - Reading raw binary data from the network. Makes no attempt to parse data.
    * `Network Data Get`      - Reading useful data from a network
    * `Network Data Set`      - Writing data to a network
    * `Network Data Export`   - Export network data to a file
    * `Network Data Import`   - Import network data from a file
    * `Network Data Analysis` - Related to tracing through a network or checking for specific conditions. These examples are more like final products.
    * `Database Data Bin`     - Reading raw binary data from the database. Makes no attempt to parse data.
    * `Database Data Get`     - Reading useful data from a database
    * `Database Data Set`     - Writing data to a database
    * `Database Data Export`  - Export database data to a file
    * `Database Data Import`  - Import database data from a file
    * `Network RTC Bin`       - Reading raw binary data from the network RTC data. Makes no attempt to parse data.
    * `Network RTC Get`       - Reading useful data from the network RTC data
    * `Network RTC Set`       - Writing data to the network RTC data
    * `Simulations Run`       - Creating and Running simulations
    * `Simulations Data Get`  - Obtaining simulation data
    * `System Automation`     - Misc system tasks
    * `Developer Tools`       - Tools that can help you make / learn how to make Ruby scripts.
    
