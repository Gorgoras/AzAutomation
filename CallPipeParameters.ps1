$secpasswd = ConvertTo-SecureString "SecretKey" -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential ("AppID", $secpasswd)
Login-AzureRmAccount -Credential $creds -ServicePrincipal -TenantId "TenantId"

Select-AzureRmSubscription -Subscription "SubsId"

$dfname = "ADFNAME"
$rgName = "RGNAME"
$pipe = "PIPE_NAME"
$parameters = @{
    "Param1" = "Aasd"
    "Param2" = "123123"
}

$runId = Invoke-AzureRmDataFactoryV2Pipeline -DataFactoryName $dfname -ResourceGroupName $rgName -PipelineName $pipe -Parameter $parameters
Start-Sleep -s 5
$estado = 'InProgress'

while($estado -like "InProgress"){
    Write-Output "Status: $($estado)"
    Start-Sleep -s 5
    $estado = (Get-AzureRmDataFactoryV2PipelineRun -ResourceGroupName $rgName -DataFactoryName $dfname -PipelineRunId $runId).Status
}

Write-Output "Status: $($estado)"
$pipeFinal = Get-AzureRmDataFactoryV2PipelineRun -ResourceGroupName $rgName -DataFactoryName $dfname -PipelineRunId $runId
$tiempo = $pipeFinal.RunEnd - $pipeFinal.RunStart 

Write-Output "Run time: $($tiempo)"
