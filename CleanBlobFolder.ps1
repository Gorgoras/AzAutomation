$StorageAccountName = "brahminstorage" 
$StorageAccountKey = "dqTzjGIopK2KydxySs4YU/pz/zNTimyVabgKXZKqejrCtfVTf/jUlew+eg7+UvR8NKxPwuZBMkAbxuYr2l2SyA=="
$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
$ContainerName = "caravan1"
$BlobName = "AuditLogsCompleto.csv"
$filepath = ''+$PSScriptRoot+'\AuditLogsCompleto.csv'
$backupPath = ''+$PSScriptRoot+"\Backup\AuditLogsCompleto-$((get-date).ToString("yyyyMMdd-HH-mm")).csv"
#Get-AzureStorageBlobContent -Container $ContainerName -Blob $BlobName -Context $ctx -Force -Destination $filepath

$files = Get-AzureStorageBlob -Container $ContainerName -Context $ctx
Write-Output $files

$files | ForEach-Object($_){
    Remove-AzureStorageBlob -Container $ContainerName -Context $ctx -Blob $_.Name -
}
