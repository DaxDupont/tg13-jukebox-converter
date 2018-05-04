$url = Read-Host -Prompt 'Input url'
$songname = Read-Host -Prompt 'Input song name/alias'
$timeString = .\youtube-dl.exe $url --get-duration | Out-String
$timeString = "00:"+$timeString
$timespan = [TimeSpan]::Parse($timeString)
$totalSeconds = $timespan.TotalSeconds
$totalSeconds = $totalSeconds*10
$filename = $songname+"+"+ $totalSeconds.ToString()+"+5.%(ext)s"
.\youtube-dl.exe $url -x --audio-format vorbis --audio-quality 0 -o $filename