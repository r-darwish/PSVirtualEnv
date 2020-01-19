# ===========================================================================
#   Remove-VirtualEnvFile.ps1 -----------------------------------------------
# ===========================================================================

#   function ----------------------------------------------------------------
# ---------------------------------------------------------------------------
function Remove-VirtualEnvFile {

    <#
    .SYNOPSIS
        Remove an existing requirement or script file.

    .DESCRIPTION
        Remove an existing requirement or script file in predefined folders. All available requirement and script files can be accessed by autocompletion.
    
    .PARAMETER Requirement

    .PARAMETER Script

    .EXAMPLE
        PS C:\> Remove-VirtualEnvFile -Requirement \general\venv-requirements.txt

        -----------
        Description
        Remove an existing requirement file in predefined requirements folder. All available requirement files can be accessed by autocompletion.

    .EXAMPLE
        PS C:\> Remove-VirtualEnvFile -Script \general\venv.py

        -----------
        Description
        Remove an existing script file in predefined scripts folder. All available script files can be accessed by autocompletion.

    .INPUTS
        System.String. Relative path of an existing requirement or script file.

    .OUTPUTS
        None.
    #>

    [CmdletBinding(PositionalBinding, DefaultParameterSetName="Requirement")]

    [OutputType([Void])]

    Param(
        [ValidateSet([ValidateVenvRequirements])]
        [Parameter(ParameterSetName="Requirement", Position=1, ValueFromPipeline, HelpMessage="Relative path to a requirements file in predefined requirements folder.")]
        [System.String] $Requirement,

        [ValidateSet([ValidateVenvScripts])]
        [Parameter(ParameterSetName="Script", Position=1, ValueFromPipeline, HelpMessage="Relative path to a script file in predefined scripts folder.")]
        [System.String] $Script
    )

    Process {

        # get existing requirement or script file
        if ($PSCmdlet.ParameterSetName -eq "Requirement" ){
            $file_path = Join-Path -Path $PSVirtualEnv.RequireDir -ChildPath $Requirement 
        }
        else {
            $file_path = Join-Path -Path $PSVirtualEnv.ScriptDir -ChildPath $Script
        }

        # remove specified requirement file 
        Remove-Item -Path $file_path -Recurse -Force
            
        # check whether the requirement file could be removed
        if (-not $(Test-Path -Path $file_path)) {
            Write-FormattedSuccess -Message "File '$file_path' was deleted permanently." -Module $PSVirtualEnv.Name -Space
        }
        else {
            Write-FormattedError -Message "File '$file_path' could not be deleted." -Module $PSVirtualEnv.Name -Space
        }
    }
}
