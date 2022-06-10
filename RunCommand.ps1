$config=Get-Content ./env-variables.json -raw | ConvertFrom-Json

$Subscription=$config.v_subscription_id
$TenantId=$config.v_tenant_id
$ResourceGroupName=$config.v_rg
$VMname=$config.v_vm_name
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