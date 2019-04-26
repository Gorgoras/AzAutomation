# obtener TenantId y SubscriptionId
$Connection = Get-AutomationConnection -Name "AzureRunAsConnection"
$TenantId = $Connection.TenantId
$SubscriptionId = $Connection.SubscriptionId
$ResourceGroupName = Get-AutomationVariable -Name 'ResourceGroupName'
$DataFactoryName = Get-AutomationVariable -Name 'DataFactoryName'
$PipelineName = "pipelineName"

$SPCredential = Get-AutomationPSCredential -Name "creds_auto"

# Login Azure
Write-Output "Login to Azure using automation account 'creds_auto'."
$null = Login-AzureRmAccount -TenantId $TenantId -SubscriptionId $SubscriptionId -Credential $SPCredential

# Seleccionar suscripción
Write-Output "Selecting subscription '$($SubscriptionId)'."
$null = Select-AzureRmSubscription -SubscriptionID $SubscriptionId

#Llamamos al pipeline maestro, guardando el id
$id = Invoke-AzureRmDataFactoryV2Pipeline -PipelineName $PipelineName -ResourceGroupName $ResourceGroupName -DataFactoryName $DataFactoryName
Start-Sleep -s 10
$pipeRun = Get-AzureRmDataFactoryV2PipelineRun -DataFactoryName $DataFactoryName -ResourceGroupName $ResourceGroupName -PipelineRunId $_     
Write-output "Starting process"

Start-Sleep -s 120
$pipeRun = Get-AzureRmDataFactoryV2PipelineRun -DataFactoryName $DataFactoryName -ResourceGroupName $ResourceGroupName -PipelineRunId $_     

Write-output "Process started, state: $($Piperun.Status)"