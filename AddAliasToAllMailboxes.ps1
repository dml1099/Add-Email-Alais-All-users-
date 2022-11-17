#Gets all primary emails of the specified domain
$users = Get-Mailbox | Where-Object{$_.PrimarySMTPAddress -match "clientEmail.com"}
#Creates an alias for all users using the specified alias domain
foreach($user in $users){
    Write-Host "Adding Alias $($user.alias)@clientAlias.com"
    Set-Mailbox $user.PrimarySmtpAddress -EmailAddresses @{add="$($user.Alias)@clientAlias.com"}
}