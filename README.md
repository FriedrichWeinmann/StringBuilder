# StringBuilder

A simple wrapper around the StringBuilder type.
Allowing a simple and convenient way to incrementally build up your text.

## Install

```powershell
Install-Module StringBuilder
```

## Use

Create a new StringBuilder:

```powershell
$null = New-SBStringBuilder -Register
```

Add text to it:

```powershell
Add-SBLine "Some text"
Add-SBLine "More text"
Add-SBLine "Even more {0} with values provided from {1}" -Values 'text','outside'
```

Finally, finish it up:

```powershell
Close-SBStringBuilder
```
