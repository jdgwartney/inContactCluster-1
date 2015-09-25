$metric_id = 'PROCESSOR_PERCENT_USER_TIME'
$source = Get-Content Env:\COMPUTERNAME
$counter_name = '\processor(_total)\% user time'

while($true)
{
    $counter_value =  ((get-counter -counter $counter_name).countersamples | select -expandproperty cookedvalue)/100.0
    $current_time = get-date -UFormat %s
    $timestamp = [math]::round($current_time)
    write-host $metric_id $counter_value $source $timestamp
    [Console]::Out.Flush()
}

