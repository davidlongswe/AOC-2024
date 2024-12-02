$start = Get-Date
$fileInput = Get-Content "C:\Users\david\Desktop\aoc2024\day2\day2.txt" | ForEach-Object {
    $_ -split '`n*'
}
$safeReports = @()
$fixedReports = @()

function Decreasing {
    param(
        [Array]$arr
    )
    for ($i = 1; $i -lt $arr.Count; $i++) {
        if ($arr[$i] -ge $arr[$i - 1]) {
            return $false
        }
    }
    return $true
}
function Increasing {
    param(
        [Array]$arr
    )
    for ($i = 1; $i -lt $arr.Count; $i++) {
        if ($arr[$i] -le $arr[$i - 1]) {
            return $false
        }
    }
    return $true
}

function Safe {
    param(
        [Array]$arr
    )
    if((Increasing -arr $arr) -or (Decreasing -arr $arr)){
        for($i = 0; $i -lt $arr.Length-1; $i++) {
            $difference = [Math]::Abs($arr[$i+1] - $arr[$i])
            if ($difference -gt 3 -or $difference -lt 1) {
                return $false
            }
        }
        return $true
    }
}

foreach($line in $fileInput) {

    $report = $line -split " " | ForEach-Object {[int]$_}

    if(Safe -arr $report) {
        $safeReports += [PSCustomObject]@{
            SafeReport = $report
        }
    }else {
        $isFixed = $false
        for($i = 0; $i -lt $report.Length; $i++){
            [System.Collections.ArrayList]$tempArray = $report.Clone()
            [System.Collections.ArrayList]$tempArray.RemoveAt($i)
            if(Safe -arr $tempArray){
                if(!$isFixed) {
                    $fixedReports += [PSCustomObject]@{
                        OldReport = $report
                        FixedReport = $tempArray
                    }
                }
                $isFixed = $true
            }
        }
    }
}

#Part 1
Write-Host "Part 1: $($safeReports.Count) safe reports found." -ForegroundColor Green

#Part 2
Write-Host "Part 2: $($fixedReports.Count) were mistakenly deemed unsafe, making a total of $($safeReports.Count + $fixedReports.Count) safe reports." -ForegroundColor Green

Write-Host "Elapsed time: $([math]::Round(((Get-Date) - $start).TotalSeconds,3)) seconds"


       