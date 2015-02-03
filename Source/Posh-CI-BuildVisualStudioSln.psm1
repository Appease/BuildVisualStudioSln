# halt immediately on any errors which occur in this module
$ErrorActionPreference = "Stop"

function Invoke-CIStep(
[string[]][Parameter(Mandatory=$true)]$SlnFilePaths,
[string][Parameter(Mandatory=$true)]$PathToMsBuildExe){
    
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
