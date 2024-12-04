$start = Get-Date
$fileInput = Get-Content "C:\Users\daelfvin\aoc2024\day3\day3.txt"

$p1_matches = [regex]::Matches($fileInput, "mul\((\d+),(\d+)\)")
$p2_matches = [regex]::Matches($fileInput, "mul\((\d+),(\d+)\)|do\(\)|don't\(\)")

$p1_results = $p1_matches | ForEach-Object { 
    [PSCustomObject]@{
        Num1 = [int]$_.Groups[1].Value
        Num2 = [int]$_.Groups[2].Value
    }  
}

$shouldMultiply = $true

$p2_results = $p2_matches | ForEach-Object { 
    if($_.Value -eq "do()"){
        $shouldMultiply = $true
    }elseif($_.Value -eq "don't()"){
        $shouldMultiply = $false
    }else {
        if($shouldMultiply) {
            [PSCustomObject]@{
                Num1 = [int]$_.Groups[1].Value
                Num2 = [int]$_.Groups[2].Value
            }  
        }
    }
} 

$p1 = 0
foreach($res in $p1_results) {
    $p1 += ($res.Num1 * $res.Num2)
}

$p2 = 0
foreach($res in $p2_results) {
    $p2 += ($res.Num1 * $res.Num2)
}

#Part 1
Write-Host "Part 1: $($p1)"

#Part 2
Write-Host "Part 2: $($p2)"

Write-Host "Elapsed time: $([math]::Round(((Get-Date) - $start).TotalSeconds,3)) seconds"


       