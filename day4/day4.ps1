$start = Get-Date
$fileInput = Get-Content "C:\Users\daelfvin\aoc2024\day4\day4.txt" | ForEach-Object {
    $_ -split '`n*'
}

function inbounds {
    param(
        [Array]$arr,
        [int]$x,
        [int]$y
    )
    return ($arr[$y][$x] -eq "X") -or ($arr[$y][$x] -eq "M") -or ($arr[$y][$x] -eq "A") -or ($arr[$y][$x] -eq "S")
}
function checkHorizontal {

}

function check-Vertical {

}

function check-Diagonal {

}

#Part 1
Write-Host "Part 1:"

#Part 2
Write-Host "Part 2:"

Write-Host "Elapsed time: $([math]::Round(((Get-Date) - $start).TotalSeconds,3)) seconds"