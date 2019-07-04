# [PSVirtualEnv](https://github.com/wbrandenburger/PSVirtualEnv) Beta

## Table of Contents

- [PSVirtualEnv Beta](#PSVirtualEnv-Beta)
  - [Table of Contents](#Table-of-Contents)
  - [Description](#Description)
    - [Origin](#Origin)
  - [Installation](#Installation)
  - [Dependencies](#Dependencies)
  - [Examples](#Examples)
  - [Authors/Contributors](#AuthorsContributors)
    - [Author](#Author)

## Description

The module PSVirtualEnv is a set of PowerShell extensions to Ian Bicking’s virtualenv tool in python. The module includes wrappers for creating and deleting virtual environments and otherwise managing your development workflow, making it easier to work on more than one project at a time without introducing conflicts in their dependencies.

### Origin

This module is an extension of [virtualenvwrapper-powershell](https://github.com/regisf/virtualenvwrapper-powershell) and adds more functionality to manage virtual environments with the PowerShell, especially offline installations.

## Installation

Set the environment variable `%PYTHONHOME%` to the directory with the python executable, which comes with the installation of a python distribution.

```batch
set PYTHONHOME=C:\Python\Python37
```

and run the file `.\PSVirtualEnv.Install.bat` from PowerShell as administrator.

The configuration file `psvirtual.ini` can be copied to the location, which is defined in environment variable `%CONFIG%`, in the directory `%HOME%\.config` or in the local module directory of PSVirtualEnv. Change the fields in file `psvirtual.ini` to existing locations:

```ini
[settings]

; default path where virtual environments are located
venv-work-dir = "A:\VirtualEnv"

; config path of virtual environments
venv-config-dir =  "A:\VirtualEnv\.config"

; default download path for python packages
venv-local-dir =  "A:\VirtualEnv\.temp"

; default path for the requirements
venv-requirement = "A:\VirtualEnv\.temp\%rplc.txt"

; default python distribution
python = "C:\Python\Python37\python.exe"
```

Finally add the subdirectory `.\PSVirtualEnv` with its subdirectories and files to on directory of the system, where PowerShell search for modules.

## Dependencies

The following PowerShell modules have to be installed: 

 - [PSIni](https://github.com/wbrandenburger/PsIni)

Additionally, a python distribution version 3.3 or higher has to be installed.

## Examples

## Authors/Contributors

### Author

- [Wolfgang Brandenburger](https://github.com/wbrandenburger)

