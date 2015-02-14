###What is it?
A [Posh-CI](https://github.com/Posh-CI/Posh-CI) step that builds one or more [Visual Studio](http://www.visualstudio.com) solutions

**How do I use it?**

add an entry in your ci plans `Packages.config` file
```XML
<packages>
  <package id="posh-ci-buildvisualstudiosln" />
  <!-- other dependencies snipped -->
</packages>
```

then just pass variables to Invoke-CIPlan according to the following parameters:

#####SlnFilePaths Parameter
explicit paths to .sln files you want build; defaults is all .sln files within your project root dir @ any depth
```PowerShell
[string[]][Parameter(ValueFromPipelineByPropertyName=$true)]$SlnFilePaths
```
#####PathToMsBuildExe Parameter
path to msbuild.exe on your machine
```PowerShell
[string][Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]$PathToMsBuildExe
```

###What's the build Status?
![](https://ci.appveyor.com/api/projects/status/9tp100rf05jd7mcy?svg=true)

