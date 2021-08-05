function Assert-StringBuilder
{
<#
	.SYNOPSIS
		Asserts a valid stringbuilder has been created.
	
	.DESCRIPTION
		Asserts a valid stringbuilder has been created.
	
	.PARAMETER Name
		Name of the stringbuilder that must exist.
	
	.PARAMETER Cmdlet
		The $PSCmdlet variable of the calling command.
		Causes the error record to be created in the context of that command
	
	.EXAMPLE
		PS C:\> Assert-StringBuilder -Name 'MyModule' -Cmdlet $Cmdlet
	
		Ensures that the string builder 'MyModule' exists.
#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$Name,
		
		[Parameter(Mandatory = $true)]
		$Cmdlet
	)
	
	process
	{
		if ($script:builders[$Name]) { return }
		
		$exception = [Exception]::new("String builder '$Name' not found! Ensure a proper string builder has been created!")
		$record = [System.Management.Automation.ErrorRecord]::new($exception, 'MissingStringBuilder', [System.Management.Automation.ErrorCategory]::InvalidOperation, $null)
		$Cmdlet.ThrowTerminatingError($record)
	}
}