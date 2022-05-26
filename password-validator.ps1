
# Help
function Help 
{
    Write-Host
    Write-Host "**********************************************************************************************************************"
    Write-Host "** This script is for password validation                                                                           **"
    Write-Host "** Validation passed if password contains minimum 10 characters, numbers, small case letters and capital letter     **"
    Write-Host "** Syntax: scriptTemplate [h|f]                                                                                     **"
    Write-Host "** options:                                                                                                         **"        
    Write-Host "** h    Print this help.                                                                                            **"
    Write-Host "** f    Get path of file and password retrieved from file                                                           **"
    Write-Host "**********************************************************************************************************************"
    Write-Host
    exit 0
}


# PasswordVlidator get password and check if it valid
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

# Get the options
if(($args.Length -eq 2) -and ($args[0] -eq "-f"))
{
    Write-Host "here"
    # if user pass option -f , password will get from /path/file 
    $pas = Get-Content -Path $args[1]
    PasswordVlidator  $pas
}
elseif(($args.length -eq 1) -and ($args[0] -eq "-h") )
{
    Help
}
elseif($args.length -eq 1)
{
    PasswordVlidator $args[0]
}
else
{
    Write-Host "Invalid input. for help use option -h" -ForegroundColor Red
    exit 1
}


    



