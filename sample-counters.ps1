
$config = @{}
$config['\processor(_total)\% processor time'] = @{
multiplier = 1,
metric_name = "CPU"
}
$config['\memory\% committed bytes in use'] = @{}
$config['\physicaldisk(_total)\% disk time'] = @{}

foreach ($c in $config)
{
  $c
}
#$map = @{}

$counter_name1 = '\processor(_total)\% processor time'
$counter_name2 = '\memory\% committed bytes in use'
$counter_name3 = '\physicaldisk(_total)\% disk time'
$counter_list = $counter_name1, $counter_name2, $counter_name3
$start = $current_time = Get-Date -Date (Get-Date).toUniversalTime() -UFormat %s
$counter_value =  ((Get-Counter -Counter $counter_list).countersamples | select -expandproperty cookedvalue)
$stop = $current_time = Get-Date -Date (Get-Date).toUniversalTime() -UFormat %s
$duration = $stop - $start
<#
Write-Host $counter_value $duration
Write-Host $counter_value.GetType()
$counter_value | Get-Member
Get-Member -InputObject $counter_value
#>

foreach ($i in $counter_value)
{
   $i
}

$map = @{}
