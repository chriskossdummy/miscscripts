# Following tutorial at
# https://learn-powershell.net/2013/08/14/powershell-and-events-permanent-wmi-event-subscriptions/
#Create Filter
$instanceFilter = ([wmiclass]"\\.\root\subscription:__EventFilter").CreateInstance()
$instanceFilter.QueryLanguage = "WQL"
$instanceFilter.Query = "select * from __instanceModificationEvent within 5 where targetInstance isa 'win32_Service'"
$instanceFilter.Name = "ServiceFilter"
$instanceFilter.EventNamespace = 'root\cimv2'
$result = $instanceFilter.Put()
$Global:newFilter = $result.Path

#Create Consumer
$instanceConsumer = ([wmiclass]"\\.\root\subscription:LogFileEventConsumer").CreateInstance()
$instanceConsumer.Name = 'ServiceConsumer'
$instanceConsumer.Filename = "C:\Scripts\Log.log"
$instanceConsumer.Text = 'A change has occurred on the service: %TargetInstance.DisplayName%'
$result = $instanceConsumer.Put()
$Global:newConsumer = $result.Path

#Bind filter and consumer
$instanceBinding = ([wmiclass]"\\.\root\subscription:__FilterToConsumerBinding").CreateInstance()
$instanceBinding.Filter = $newFilter
$instanceBinding.Consumer = $newConsumer
$result = $instanceBinding.Put()
$Global:newBinding = $result.Path

##Removing WMI Subscriptions using [wmi] and Delete() Method
#([wmi]$newFilter).Delete()
#([wmi]$newConsumer).Delete()
#([wmi]$newBinding).Delete()
