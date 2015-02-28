####What is it?

A [Posh-CI](https://github.com/Posh-CI/Posh-CI) step that builds one or more [Visual Studio](http://www.visualstudio.com) solutions

####How do I install it?

```PowerShell
Add-CIStep -Name "YOUR-CISTEP-NAME" -ModulePackageId "Posh-CI-BuildVisualStudioSln"
```

####What parameters are available?

#####SlnFilePaths
explicit paths to .sln files you want build; defaults is all .sln files within your project root dir @ any depth
```PowerShell
[string[]][Parameter(ValueFromPipelineByPropertyName=$true)]$SlnFilePaths
```
#####PathToMsBuildExe
path to msbuild.exe on your machine
```PowerShell
[string][Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]$PathToMsBuildExe
```

####What's the build status?
![](https://ci.appveyor.com/api/projects/status/9tp100rf05jd7mcy?svg=true)
