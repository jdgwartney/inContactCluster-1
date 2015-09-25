$metric_id = 'PHYSICAL_DISK_QUEUE_LENGTH'
$source = Get-Content Env:\COMPUTERNAME
$counter_name = '\physicaldisk(_total)\current disk queue length'

while($true)
{
    $counter_value =  (get-counter -counter $counter_name).countersamples | select -expandproperty cookedvalue
    $date = (get-date -UFormat %s)
    $timestamp = [math]::round($date)
    write-host $metric_id $counter_value $hostname $timestamp
    [Console]::Out.Flush()
}

