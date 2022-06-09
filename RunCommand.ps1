$Subscription=""
$TenantId=""
$ResourceGroupName=""
$VMname=""
#Get Subscription
Write-Host -foregroundcolor green "Get Azure Tenant and Subscription" 
Set-AzContext -TenantId $TenantId -Subscription $Subscription -Force
Write-Host -foregroundcolor green "Done"
$ErrorActionPreference = "Stop";


$VM = @(Get-AzVM | Where-Object Name -like $VMname)
$path = ".\"
$script = @("Install-Docker.ps1")


Write-Host -foregroundcolor green "Working on vm $($VM.Name)"
$out = Invoke-AzVMRunCommand -ResourceGroupName $VM.ResourceGroupName `
   -Name $VM.Name `
   -CommandId 'RunPowerShellScript' `
   -ScriptPath $path\$script
Write-Host -foregroundcolor green "-------------------------------------"   
$output = $VM.Name + " " + $out.Value[0].Message
Write-Host -foregroundcolor blue $output

Restart-AzVM -ResourceGroupName $ResourceGroupName -Name $VMname
