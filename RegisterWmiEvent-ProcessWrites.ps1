$WMI = @{
	Query = "select * from __instanceModificationEvent within 5 where targetInstance isa 'win32_Process'"
	Action = {
		if ($Event.SourceEventArgs.NewEvent.TargetInstance.WriteOperationCount -gt $Event.SourceEventArgs.NewEvent.PreviousInstance.WriteOperationCount) {
			Write-Host("new writes from {0}({3}): {2}->{1}" -f $Event.SourceEventArgs.NewEvent.TargetInstance.Name,$Event.SourceEventArgs.NewEvent.TargetInstance.WriteOperationCount, $Event.SourceEventArgs.NewEvent.PreviousInstance.WriteOperationCount,
$Event.SourceEventArgs.NewEvent.TargetInstance.ProcessId)
		}
		$Global:Data = $Event
	}
	SourceIdentifier = "Process.Action"
}
$Null = Register-WMIEvent @WMI
#####
