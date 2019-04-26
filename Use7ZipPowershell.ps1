#folder to .zip files
$directorio = "C:\Users\fallout\Downloads\"
$archivosZip = Get-ChildItem -Path $directorio

set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"

#folder for unzipping
$target = "C:\Users\fallout\Downloads\"

#for each zip file
$archivosZip | ForEach-Object($_){
    if($_.Name -like "*.zip"){
        $source = $directorio + "\" + $_.Name
        Write-Output "Unzipping: $($source)"
        sz x -o"$($target)" $source -r 
        }
    }