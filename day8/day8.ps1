$start = Get-Date
$fileInput = Get-Content "C:\Users\daelfvin\aoc2024\day8\day8.txt" | ForEach-Object {
    $_ -split '`n*'
}


#Part 1
Write-Host "Part 1:"

#Part 2
Write-Host "Part 2:"

Write-Host "Elapsed time: $([math]::Round(((Get-Date) - $start).TotalSeconds,3)) seconds"