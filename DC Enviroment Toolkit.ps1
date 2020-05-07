#DC Enviroment Toolkit
function Show-Menu {
    param (
        [String]$Title = 'DC Enviroment Toolkit')
        Clear-Host
        Write-Host "========== $Title =========="
        Write-Host "========== $Info =========="
        Write-Host "1: Press "1" to Gather Domain information"

    }

    function GatherDCInfo {
        
        
    }



    do 
{
    Show-Menu -Title 'DC Enviroment Toolkit'
    $input = Read-Host "What do you want to do?"
    switch ($input) 
    {
        '1'{
            GatherDCInfo
            }
        'Q' {
                return      
            }
    }
    Pause
}
Until ($input -eq 'qQ')