#Datos y login de Service Principal
$secpasswd = ConvertTo-SecureString "SecretKey" -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential ("AppID", $secpasswd)
Login-AzureRmAccount -Credential $creds -ServicePrincipal -TenantId "TenantID"
Select-AzureRmSubscription -SubscriptionName Investigacion

#Datos de Data Factory
$ADFName = "DataFactoryName"
$pipeName = "PipelineName"
$RGName = "ResourceGroupName"

$runID = "pipeRunId"


$ahora = Get-Date
$antes = (Get-Date).AddDays(-1)

$activities = Get-AzureRmDataFactoryV2ActivityRun -DataFactoryName $ADFName -PipelineRunId $runID -ResourceGroupName $RGName `
                                    -RunStartedAfter $antes -RunStartedBefore $ahora

foreach($activ in $actividades){
    if($activ.ActivityName -like "activities"){
        $activ
        $tiempoActiv = $activ.ActivityRunEnd - $activ.ActivityRunStart
        Write-Output "Duracion de actividad: $($tiempoActiv)"
    }
}

$i = 0
foreach($activ in $activities){
    if($activ.Status -like "Failed"){
        $activ.ActivityName
        $i++
    }
}
$i
