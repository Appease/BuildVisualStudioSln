# halt immediately on any errors which occur in this module
$ErrorActionPreference = "Stop"

function Invoke-CIStep(
[string][Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]$PoshCIProjectRootDirPath,
[string[]][Parameter(ValueFromPipelineByPropertyName=$true)]$SlnFilePaths,
[string][Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]$PathToMsBuildExe){
    
    # default to recursively picking up any .sln files below the project root directory path
    if(!$SlnFilePaths){
        $SlnFilePaths = Get-ChildItem -file -Recurse -Path "$PoshCIProjectRootDirPath" -Include '*.sln'
    }

    foreach($slnFilePath in $SlnFilePaths)
    {        
        # invoke msbuild
        & $PathToMsBuildExe $slnFilePath

        # handle errors
        if ($LastExitCode -ne 0) {
            throw $Error
        }
    }

}

Export-ModuleMember -Function Invoke-CIStep
