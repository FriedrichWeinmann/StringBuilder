Register-PSFTeppScriptblock -Name 'StringBuilder.Name' -ScriptBlock {
	& (Get-Module StringBuilder) { $script:builders.Keys }
}
