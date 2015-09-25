$metric_id = 'PROCESSOR_PERCENT_PROCESSOR_TIME'
$source = Get-Content Env:\COMPUTERNAME
$counter_name = '\processor(_total)\% processor time'

while($true)
{
    $counter_value =  ((Get-Counter -Counter $counter_name).countersamples | select -expandproperty cookedvalue)/100.0
    $current_time = Get-Date -Date (Get-Date).toUniversalTime() -UFormat %s
    $timestamp = [math]::round($current_time)
    write-host $metric_id $counter_value $source $timestamp
    [Console]::Out.Flush()
}

