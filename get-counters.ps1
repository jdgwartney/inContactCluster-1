	function ConvertTo-UnixTimestamp 
		{ 
 			$epoch = Get-Date -Year 1970 -Month 1 -Day 1 -Hour 0 -Minute 0 -Second 0	 
  			$input | % {		 
 					$milliSeconds = [math]::truncate($_.ToUniversalTime().Subtract($epoch).TotalSeconds) 
 					Write-Output $milliSeconds 
 			   	   }
		} 

	$counter_id = 'INCONTACT_ACTIONS_PER_SECOND'
	$hostname = get-content env:computername


while($true)
{
	$result =  (get-counter -counter '\UCN Virtual Cluster\Actions Per Second').countersamples | select -expandproperty cookedvalue
	$seconds = get-date | convertto-unixtimestamp
	$out = [math]::round($result)

write-host $counter_id $out $hostname $seconds
"$counter_id $out $hostname $seconds" | out-file -append 'result.txt'

	[Console]::Out.Flush()
}
