properties {
	$downloadurl = "http://sdk-for-net.amazonwebservices.com/latest/AWSToolsAndSDKForNet.msi"
}

task default -depends ScriptA

task ScriptA -depends ScriptB { 
  Write-Host "This script runs after the AWS install script"
  .\mike.ps1
}

task ScriptB  { 
	.\installawssdk.ps1
}

