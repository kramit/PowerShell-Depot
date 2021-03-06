Function Global:ConvertTo-Number($string){
    for($i=1;$i -le ($string.Length);$i++){
        [byte][char]$string.substring($i - 1, 1)
    }
}
Function Global:Encrypt-It{
    Param(
        [string]$message = "Hello",
        [string]$script:key = "S3cret!"
     )
    Write-Host "$message = " ($messageArray = ConvertTo-Number($message)) -ForeGroundColor Blue
    Write-Host "$key = " ($keyArray = ConvertTo-Number($key)) -ForeGroundColor Green
    Set-Variable cryptoNumerals -Scope global
    For($j = 0; $j -le $messageArray.Count -1;$j++){
        $cryptoNumerals += [string]($messageArray[$j] -bxor $keyArray[$j]) + " "
        $displayMessage += [char]($messageArray[$j] -bxor $keyArray[$j])
    }
    Write-Host "$displayMessage = $cryptoNumerals" -ForegroundColor Red
}
