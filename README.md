# MinecraftSkinDecoder

The Minecraft launcher does not store your Skins in the cloud. Instead it encodes them and stores them inside the `launcher_skins.json` file. If you lose your old skins, you can use the PowerShell script in this repository to extract them out of the `json` file.

## Usage

The following example is how you can use the script on Windows. If you are using Linux, adjust the paths accordingly.

```ps1
 .\decode_minecraft_skin.ps1 -launcherJsonFile "C:\Users\<USER_NAME>\AppData\Roaming\.minecraft\launcher_skins.json" -outputPath "C:\My Docs\skins"
```
