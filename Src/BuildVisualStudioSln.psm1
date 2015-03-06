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
[ValidateCount(1,[Int]::MaxValue)]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$IncludeSlnFilePath = @(gci -Path $PoshCIProjectRootDirPath  -File -Recurse -Filter '*.sln'|%{$_.FullName}),

[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$ExcludeSlnNameLike,

[Switch]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$Recurse,

[String]
[ValidateNotNullOrEmpty()]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$PathToMsBuildExe = 'C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe'){
           
    $SlnFilePaths = @(gci -Path $IncludeSlnFilePath -File -Exclude $ExcludeSlnNameLike -Recurse:$Recurse -Filter "*.sln" | %{$_.FullName})

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
