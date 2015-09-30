# Define constants for program, PS way of doing this to make the real constants??
$CONFIG_FILE_NAME="counters.json"

# Check if configuration file exists and readable exit with error

# Read configuration file which is encoded in JSON into PSObject
# How to handle if the JSON is not properly formed. What is returned, null?
$config = (Get-Content $CONFIG_FILE_NAME) -join "`n" | ConvertFrom-JSON

# Generate an array of the counters to collect from the configuration
# Initialize an array
$counters = @()
$multipliers = @()
$metrics = @()
foreach ($counter in $config.counters) {
# add each of the counters into the array
  $counter.name
  $counter.multiplier
  $counter.metric
  
}
$metric_id = 'PROCESSOR_PERCENT_PROCESSOR_TIME'
$source = Get-Content Env:\COMPUTERNAME
$counter_name1 = '\processor(_total)\% processor time'
$counter_name2 = '\memory\% committed bytes in use'
$counter_name3 = '\physicaldisk(_total)\% disk time'

while($true)
{
    foreach ($counter in $config.counters) {
        $counter_value =  ((Get-Counter -Counter $counter_name).countersamples | select -expandproperty cookedvalue)/100.0
        $current_time = Get-Date -Date (Get-Date).toUniversalTime() -UFormat %s
        $timestamp = [math]::round($current_time)
    }
    write-host $metric_id $counter_value $source $timestamp
    [Console]::Out.Flush()
}
