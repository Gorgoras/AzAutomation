# Datos para BD
$instancia = Get-AutomationVariable -Name "InstanciaSqlServer"
$nombreBD = Get-AutomationVariable -Name "DBName"
$usuarioBD = Get-AutomationVariable -Name "UserDB"
$passwordBD = Get-AutomationVariable -Name "Pass"

# Query para traer todas las tablas de la base de datos
$tablas = Invoke-Sqlcmd -ServerInstance $instancia `
                        -Database $nombreBD `
                        -Username $usuarioBD `
                        -Password $passwordBD `
                        -Query "SELECT * FROM SOMETABLE"

# Limpiamos metadataload
Invoke-Sqlcmd   -ServerInstance $instancia `
                -Database $nombreBD `
                -Username $usuarioBD `
                -Password $passwordBD `
                -Query "SELECT * FROM ANOTHER_TABLE"