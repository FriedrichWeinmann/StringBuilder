function Add-SBLine
{
<#
	.SYNOPSIS
		Add a line of text to a string builder.
	
	.DESCRIPTION
		Add a line of text to a string builder.
	
	.PARAMETER Text
		The text to add.
	
	.PARAMETER Values
		Any values to format into the text specified.
		Uses the -f operator.
	
	.PARAMETER Name
		Name of the string builder to work with.
		Defaults to the caller's module name (if present) or '<none>' (if not so)
	
	.EXAMPLE
		PS C:\> Add-SBLine -Text 'Example line of text'
	
		Adds the specified string into the open string builder.
	
	.EXAMPLE
		PS C:\> Add-SBLine -Text '{0} is larger than {1}' -Values 42,23
	
		Adds the specified string into the open string builder, after formatting in the values offered.
#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[string]
		$Text,
		
		[Alias('f')]
		[object[]]
		$Values,
		
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
	process
	{
		$newLine = $Text
		if ($Values) { $newLine = $Text -f $Values }
		
		$null = $script:builders[$sbName].AppendLine($newLine)
	}
}