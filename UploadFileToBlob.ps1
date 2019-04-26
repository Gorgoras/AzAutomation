#Datos de blob storage
$StorageAccountName = "fill!" 
$StorageAccountKey = "fill!"
$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
$ContainerName = "container-name"
$target = "C:\BlobStorage\files"

$files = Get-ChildItem -Path $target
$blob = Get-AzureStorageBlob -Container $ContainerName -Context $ctx

for($i = 0; $i -lt $files.Count; $i++){
    if($i -lt $files.Count){
      
        $null = Set-AzureStorageBlobContent -File $files[$i].FullName -Container $ContainerName -Blob "raw-data/$($files[$i].Name)" -Context $ctx
        #$null=Remove-AzureStorageBlob -Blob $_.Name -Container $ContainerName -Context $ctx
        $i
        }
}