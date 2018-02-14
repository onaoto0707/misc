$name = ".\score.txt"

$scores = Select-String "^[1234]{1}(-[1234])+" $name | %{$_.Line} | %{$_ -split "-"}


$sigle = Select-String "^[1234]" $name | ?{$_.Line.Length -eq 1 }| %{$_.Line}
$scores = $scores + $single

$total = (0, 0, 0, 0)


foreach($score in $scores) {
    switch($score) {
        1 {$total[0] += 1}
        2 {$total[1] += 1}
        3 {$total[2] += 1}
        4 {$total[3] += 1}
    }
}

$total
