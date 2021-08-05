function Get-SBStringBuilder {
<#
	.SYNOPSIS
		Return a specific stringbuilder object.
	
	.DESCRIPTION
		Return a specific stringbuilder object.
	
	.PARAMETER Name
		Name of the string builder to retrieve.
		Defaults to the caller's module name (if present) or '<none>' (if not so)
	
	.EXAMPLE
		PS C:\> Get-SBStringBuilder
	
		Return the current stringbuilder of the calling module.
#>
	[CmdletBinding()]
	param (
		[PsfArgumentCompleter('StringBuilder.Name')]
		[string]
		$Name
	)
	
	begin {
		$sbName = [PSFramework.Utility.UtilityHost]::FriendlyCallstack.Entries[1].InvocationInfo.MyCommand.Module.Name
		if (-not $sbName) { $sbName = '<none>' }
		if ($Name) { $sbName = $Name }
	}
	process {
		$script:builders[$sbName]
	}
}