#DC Enviroment Toolkit
function Show-Menu {
    param (
        [String]$Title = 'DC Enviroment Toolkit')
        Clear-Host
        Write-Host "========== $Title =========="
        Write-Host "1: Press "1" to Gather Domain information"
        Write-Host "2: Press "2" to Gather DHCP Settings"
        Write-Host "Q: Press "Q" to Quit" 
    }

    function GatherDCInfo {
        #Gathers Information on the forest mode and how many domains exist
        Get-ADForest | Select-Object DomainNamingMaster, Domains,ForestMode,Name,RootDomain
        #Gathers Information on fsmo roles
        Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator
        Get-ADForest | Select-Object DomainNamingMaster, SchemaMaster   
    }

    function GatherDHCPInfo {
        $ScopeId = (Get-DhcpServerv4Scope | Select-Object ScopeId)
        Get-DhcpServerv4Scope | Select-Object ScopeId,SubnetMask,StartRange,EndRange | Format-List
        Get-DhcpServerv4Reservation -ScopeId $ScopeId 

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
        '2'{
            GatherDHCPInfo
            }
        'Q' {
                return      
            }
    }
    Pause
}
Until ($input -eq 'qQ')