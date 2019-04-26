#Datos de blob storage
$StorageAccountName = "AccName" 
$StorageAccountKey = "AccKey"
$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
$ContainerName = "container-name"
$target = "C:\Folder\To\Files\"

 #subimos los archivos al blob storage y lo eliminamos del directorio local
$archivosDescomprimidos = Get-ChildItem -Path $target
$archivosDescomprimidos | ForEach-Object($_){
    $BlobNameBackup = "gdm-rawdata\$($_.Name)"
    Set-AzureStorageBlobContent -File "$($target)\$($_.Name)" -Container $ContainerName -Blob $BlobNameBackup `
                                -Context $ctx -Force
}
