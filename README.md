![](https://ci.appveyor.com/api/projects/status/87mbd9q9psmvny4q?svg=true)

####What is it?

An [Appease](http://appease.io) task template that builds one or more [Visual Studio](http://www.visualstudio.com) solutions

####How do I install it?

```PowerShell
Add-AppeaseTask `
    -DevOpName YOUR-DEVOP-NAME `
    -Name YOUR-TASK-NAME `
    -TemplateId BuildVisualStudioSln
```

####What parameters are required?
none

####What parameters are optional?

#####IncludeSlnFilePath
description: a `string[]` representing included .sln file paths. Either literal or wildcard paths are allowed;  
default: all .sln files within the project root dir @ any depth

#####ExcludeSlnFilePath
description: a `string[]` representing .sln file names to exclude. Either literal or wildcard names are supported.

#####Recurse
description: a `switch` representing whether to include .sln files located in sub directories of $IncludeSlnFilePath (at any depth)

#####PathToMsBuildExe
description: `string` representing the path to msbuild.exe on your machine  
default: 'C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe'
