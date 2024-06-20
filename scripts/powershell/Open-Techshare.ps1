$cred = Get-Credential

New-PSDrive -Name "L" -PSProvider FileSystem -Root \\bcboe-fs4\techshare$ -Credential $cred

Invoke-Item -Path L:/