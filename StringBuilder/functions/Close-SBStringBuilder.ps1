function Close-SBStringBuilder {
<#
	.SYNOPSIS
		Closes out an open stringbuilder, returning its string value content.
	
	.DESCRIPTION
		Closes out an open stringbuilder, returning its string value content.
	
	.PARAMETER Name
		Name of the string builder to work with.
		Defaults to the caller's module name (if present) or '<none>' (if not so)
	
	.EXAMPLE
		PS C:\> Close-SBStringBuilder
	
		Close out the current stringbuilder object.
#>
	[OutputType([string])]
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
		
		Assert-StringBuilder -Name $sbName -Cmdlet $PSCmdlet
	}
	process {
		$script:builders[$sbName].ToString()
		$script:builders.Remove($sbName)
	}
}