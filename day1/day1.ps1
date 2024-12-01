$fileInput = Get-Content "C:\Users\david\Desktop\aoc2024\day1\day1.txt"
$inputAsArray = $fileInput.split("`n")
$leftColumnValues = @()
$rightColumnValues = @()
$sortedPairs = @()
$count = 0
[bigint]$similarityScore = 0

foreach($line in $inputAsArray) {
    $leftColumnValues += $line.split("   ")[0]
    $rightColumnValues += $line.split("   ")[1]
}

$leftSorted = $leftColumnValues | Sort-Object {[int]$_}
$rightSorted = $rightColumnValues | Sort-Object {[int]$_}

for($i = 0; $i -lt $leftSorted.Count; $i++) {
    $sortedPairs += [PSCustomObject]@{
        LeftColumnValue = [int]$leftSorted[$i]
        RightColumnValue = [int]$rightSorted[$i]
    }
}

# Part 1
foreach($pair in $sortedPairs) {
    $absoluteDifference = [Math]::Abs($pair.RightColumnValue - $pair.LeftColumnValue)
    $count += $absoluteDifference
}

Write-Host $count

#Part 2
foreach($pair in $sortedPairs) {
    $occurences = ($sortedPairs | Where-Object {$_.RightColumnValue -eq $pair.LeftColumnValue}).Count
    $similarity = $pair.LeftColumnValue * $occurences
    $similarityScore += $similarity
}

Write-Host $similarityScore