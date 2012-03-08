	# Quit if AWS SDK is already installed
	$isInstalled = gwmi win32_product | where {$_.name -eq "AWS SDK for .NET"}

	if ($isInstalled -eq $null)
	{
		# Create Temp folder and initialise variables
		$tempFolder = "c:\temp"
		mkdir -force "$tempFolder"
		$installfile  = Join-Path "$tempFolder" "AWSSDKForNET.msi"

		# Download installer
		$downloadurl = "http://sdk-for-net.amazonwebservices.com/latest/AWSToolsAndSDKForNet.msi"

		Write-Output "Downloading $downloadurl..."

		$wc = new-object system.net.webclient
		$wc.DownloadFile($downloadurl,$installfile)

		Write-Output "Done."

		# Install AWS SDK

		Write-Output "Installing AWS SDK for .NET msi"
		& "$installfile" "/quiet"
		Write-Output "Done."
	}
	else
	{
		Write-Host "AWS SDK is already installed"
	}