function New-SBStringBuilder
{
<#
	.SYNOPSIS
		Create a new stringbuilder object.
	
	.DESCRIPTION
		Create a new stringbuilder object.
	
	.PARAMETER Register
		Register the string builder under the name (if specified) or the current module (if not so).
	
	.PARAMETER Name
		Name under which to register a string builder.
		Defaults to the caller's module name (if present) or '<none>' (if not so)
	
	.EXAMPLE
		PS C:\> New-SBStringBuilder
	
		Create a new string builder under the current module's name.
#>
	[CmdletBinding()]
	Param (
		[switch]
		$Register,
		
		[PsfArgumentCompleter('StringBuilder.Name')]
		[string]
		$Name
	)
	
	begin{
		$sbName = [PSFramework.Utility.UtilityHost]::FriendlyCallstack.Entries[1].InvocationInfo.MyCommand.Module.Name
		if (-not $sbName) { $sbName = '<none>' }
		if ($Name) { $sbName = $Name }
	}
	process
	{
		$stringBuilder = [System.Text.StringBuilder]::new()
		if ($Register -or $Name) { $script:builders[$sbName] = $stringBuilder }
		$stringBuilder
	}
}