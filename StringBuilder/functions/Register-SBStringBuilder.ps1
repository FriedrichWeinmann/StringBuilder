function Register-SBStringBuilder {
<#
	.SYNOPSIS
		Registers the specified string builder under a name.
	
	.DESCRIPTION
		Registers the specified string builder under a name.
		Useful to add an externally created string builder object to the system
	
	.PARAMETER StringBuilder
		The stringbuilder object to add.
	
	.PARAMETER Name
		Name of the string builder to work with.
		Defaults to the caller's module name (if present) or '<none>' (if not so)
	
	.EXAMPLE
		PS C:\> Register-SBStringBuilder -StringBuilder $StringBuilder
	
		Adds the specified stringbuilder object under the current module's name.
#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[System.Text.StringBuilder]
		$StringBuilder,
		
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
		$script:builders[$sbName] = $stringBuilder
	}
}