# ===========================================================================
#   Set-VirtualEnvSearchDirs.ps1 --------------------------------------------
# ===========================================================================

#   function ----------------------------------------------------------------
# ---------------------------------------------------------------------------
function Set-VirtualEnvSearchDirs {

    <#
    .SYNOPSIS
        Add the content of an existing file with additional search directories to environment variable %PATH%.

    .DESCRIPTION
        Add the content of an existing file with additional search directories in predefined search directory folder to environment variable %PATH%. All available files can be accessed by autocompletion.
    
    .PARAMETER Path

    .PARAMETER Name

    .EXAMPLE
        PS C:\>Set-VirtualEnvAdditionalSearchDirs -Path \cuda-10.0-path.txt
        PS C:\>

        -----------
        Description
        Add the content of an existing path file with additional search directories in predefined search directory folder to environment variable %PATH%. All available files can be accessed by autocompletion.

    .INPUTS
        System.String. Relative path of existing file with additional search directories

    .OUTPUTS
        None.
    #>

    [CmdletBinding(PositionalBinding, DefaultParameterSetName="Path")]

    [OutputType([System.String])]

    Param(

        [ValidateSet([ValidateVenvSearchDirs])]
        [Parameter(ParameterSetName="Path", Position=1, Mandatory, HelpMessage="Relative path to existing file with additional search directories.")]
        [System.String] $Path,

        [ValidateSet([ValidateVirtualEnv])]     
        [Parameter(ParameterSetName="Public", Position=1, Mandatory, ValueFromPipeline, HelpMessage="Name of the virtual environment.")]
        [System.String] $Name,
  
        [Parameter(ParameterSetName="Private", Position=1, Mandatory, ValueFromPipeline, HelpMessage="Name of the virtual environment.")]
        [System.String] $PrivateName
    )

    Process {
        
        $value = $Null

        if ($PSCmdlet.ParameterSetName -ne "Path"){
            
            if($PSCmdlet.ParameterSetName -eq "Private"){
                $Name = $PrivateName
            }

            $settings = Get-VirtualEnvFile -Settings -Unformatted  | Where-Object{$_.Name -eq $Name}
            if ($settings -and ("SearchDirs" -in $settings.PSobject.Properties.Name)){
                $settings | Select-Object -ExpandProperty "SearchDirs" | ForEach-Object {
                    $value = $value + (Get-VirtualEnvFile -SearchDirs ("\" + $_) -Unformatted) + ";" 
                }
                $value = $value +  $env:PATH  
            }
        }
        else{
            $value = (Get-VirtualEnvFile -SearchDirs ("\" + $_) -Unformatted) + ";" +  $env:PATH
        }

        if ($value) {

            [System.Environment]::SetEnvironmentVariable("PATH", $value, "process")
        }
    }
}