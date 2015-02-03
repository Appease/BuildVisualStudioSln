# remove source
$installRootDirPath = "C:\Program Files\Posh-CI\Modules\Posh-CI-BuildVisualStudioSln"

# make idempotent
if(Test-Path "$installRootDirPath"){
    Remove-Item $installRootDirPath -Force -Recurse
}
