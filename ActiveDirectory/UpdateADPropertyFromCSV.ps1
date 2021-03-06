# Script requires a .CSV file with user logon names (sAMAccountName) and
# a column containing the value of the property being updated

$start = Get-Date
$property = "carLicense" # Replace with the property name being modified
Import-Module ActiveDirectory
$inputFile = Import-CSV .\userinfo.csv # Include the full path to your .CSV file
$inputFile | ForEach{
    Set-ADUser $_.sAMAccountName -Replace @{$property=$_.$property}
    }
$end = Get-Date
Write-Host -ForegroundColor "Green" `
    "Time to Complete =" (New-TimeSpan $start $end)