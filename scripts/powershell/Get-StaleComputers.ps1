Import-Module ActiveDirectory; 

$date = Get-Date;


#Get Computers
Get-ADComputer -filter * -Properties LastLogonDate,Name,Description,Created|
#filters such as last login
#Where-Object {$_.LastLogonDate -lt $date.AddDays(-365)}|
#Where-Object {$_.Created -lt $date.AddDays(-365)}| 


#Write results
Select Name,DistinguishedName,Created,LastLogonDate,Description,DNSHostName,Enabled|
export-csv -Path "C:\temp\AllComputers.csv"