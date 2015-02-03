try {

    . "$PSScriptRoot\Posh-CI-BuildVisualStudioSln\Install.ps1"

    Write-ChocolateySuccess 'Posh-CI-BuildVisualStudioSln'

} catch {

    Write-ChocolateyFailure 'Posh-CI-BuildVisualStudioSln' $_.Exception.Message

    throw 
}
