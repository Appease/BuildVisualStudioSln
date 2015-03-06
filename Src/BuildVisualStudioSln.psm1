# halt immediately on any errors which occur in this module
$ErrorActionPreference = "Stop"

function Invoke-CIStep(

[String]
[ValidateNotNullOrEmpty()]
[Parameter(
    Mandatory=$true,
    ValueFromPipelineByPropertyName=$true)]
$PoshCIProjectRootDirPath,

[String[]]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$IncludeSlnFilePath,

[Switch]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$Recurse,

[String]
[ValidateNotNullOrEmpty()]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$PathToMsBuildExe = 'C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe'){
    
    # default to recursively picking up any .sln files below the project root directory path
    if(!$IncludeSlnFilePath){

        $SlnFilePaths = gci -Path $PoshCIProjectRootDirPath  -File -Recurse -Filter '*.sln' | %{$_.FullName}
    
    }
    else{
        
        $SlnFilePaths += gci -File -Path $IncludeSlnFilePath -Recurse:$Recurse -Filter "*.sln" | %{$_.FullName}
               
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
