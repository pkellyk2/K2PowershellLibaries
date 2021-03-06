Param(

    [parameter(Mandatory=$false)]               
    [ValidateNotNullOrEmpty()]    
	[string]$K2ServerWithAllEnvSettings,
   
    [parameter(Mandatory=$false)]               
    [ValidateNotNullOrEmpty()]    
	[string]$K2ServerPortWithAllEnvSettings,
   
    [parameter(Mandatory=$false)]               
    [ValidateNotNullOrEmpty()]    
    [String] $DeploymentPath,
	
    [parameter(Mandatory=$false)]               
    [ValidateNotNullOrEmpty()]    
	[String] $VSProjectFileAndPath
	
)


$CURRENTDIR=pwd
trap {write-host "error"+ $error[0].ToString() + $error[0].InvocationInfo.PositionMessage  -Foregroundcolor Red; cd "$CURRENTDIR"; read-host 'There has been an error'; break}


$K2SmOProject= resolve-path "$VSProjectFileAndPath"
$OutputPath= resolve-path  "$DeploymentPath"
New-K2Package    "$Global_FrameworkPath"  "$K2ServerWithAllEnvSettings" $K2ServerPortWithAllEnvSettings "$K2SmOProject" "$OutputPath"



$message= "======Finished Building K2 packages for SmO and WF======"
If($DoNotStop){Write-Host $message} else {Read-Host $message}
