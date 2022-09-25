	Param(
		[Parameter(Mandatory = $true, Position=0)]
		[string]$outputPath,

		[Parameter(Mandatory = $true, Position=1)]
		[string]$launcherJsonFile
	)

if (-Not (Test-Path $launcherJsonFile)) {
	Write-Error "Could not find launcher skins at: $launcherJsonFile."
	Exit
}

if (-Not (Test-Path $outputPath -PathType Container)) {
	Write-Error "$outputPath is not a valid outputPath"
	Exit
}

# extract the skins object from the json file.
$launcherSkins = Get-Content -Raw $launcherJsonFile | ConvertFrom-Json

# iterate over each skin, decoding the image data and saving it using the name of the skin.
$launcherSkins.PSObject.Properties | ForEach-Object {
	$name = $_.Value.Name;
	Write-Output "Found Skin $name"

	$encodedSkinImage = $_.Value.skinImage;
	$splitEncodedSkinImage = $encodedSkinImage.Split(",")[1]
	$bytes = [Convert]::FromBase64String($splitEncodedSkinImage)
	[IO.File]::WriteAllBytes("$outputPath\$name.png", $bytes)

}

Write-Output "Finished."