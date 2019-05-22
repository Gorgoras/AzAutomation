Login-AzureRmAccount
Select-AzureRmSubscription -Subscription "yourSubId"

$dfname = "youDataFActoryName"
$rgName = "yourResourceGroupName"
$pipe = "pipeName"
$parameters = @{
    "param1" = "asdasd"
    "param2" = "123456"
}

Invoke-AzureRmDataFactoryV2Pipeline -DataFactoryName $dfname -ResourceGroupName $rgName -PipelineName $pipe -Parameter $parameters