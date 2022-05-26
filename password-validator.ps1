function PasswordVlidator {
   
    $password = $args[0]

    #check if password minimum of 10 characters
    if ($password.Length -lt 10)
    {
        Write-Host "The length of password need be minimum of 10 characters" -ForegroundColor Red
        exit 1
    }

    # checks if password contain numbers
    if ($password -match "[0-9]")
    {
        # checks if password contain uppercase
        if($password -cmatch "[A-Z]")
        {
            # checks if password contain  small case
            if($password -cmatch "[a-z]")
            {
                Write-Host "Password pass validation." -ForegroundColor Green
                exit 0
            }
            else 
            {
                Write-Host "Password need contain small case letters." -ForegroundColor Red   
                exit 1
            }
        }
        else
        {
            Write-Host "Password need contain capital case letters." -ForegroundColor Red
            exit 1
        }
    }
    else
    {
        Write-Host "Password need contain numbers" -ForegroundColor Red
        exit 1
    }
}


    



