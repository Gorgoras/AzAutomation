#blob storage data
$StorageAccountName = "fill!" 
$StorageAccountKey = "fill!"
$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
$ContainerName = "blob-container"

#get all files in a blob
$blob = Get-AzureStorageBlob -Container $ContainerName -Context $ctx

#pattern to look for
$patron = "*anything*"

#print every file name that matches with pattern
foreach($archivo in $blob){
    if($archivo.Name -like $patron){
        Write-Output "Found $($archivo.Name)"
    }
}