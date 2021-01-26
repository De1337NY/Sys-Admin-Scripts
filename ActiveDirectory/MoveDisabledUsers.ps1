$OUTransfer = "OU=DisabledUsers,DC=DOMAIN,DC=com"

Search-ADAccount -AccountDisabled -UsersOnly |
    Where-Object DistinguishedName -notlike "*$OUTransfer" |
    Move-ADObject -TargetPath $OUTransfer
