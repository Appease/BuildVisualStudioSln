**What is it?**
A [Posh-CI](https://github.com/Posh-CI/Posh-CI) step that builds one or more [Visual Studio](http://www.visualstudio.com) solutions

**How do I use it?**

add an entry in your ci plans `Packages.config` file
```XML
<packages>
  <package id="posh-ci-buildvisualstudiosln" />
  <!-- other dependencies snipped -->
</packages>
```

then just pass variables to Invoke-CIPlan according to the following signature 
```POWERSHELL
function Invoke-CIStep(
[string[]][Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]$SlnFilePaths,
[string][Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]$PathToMsBuildExe){
  <# implementation snipped #>
}
```

**What's the build Status?**
![](https://ci.appveyor.com/api/projects/status/9tp100rf05jd7mcy?svg=true)

