# UnrealCleanAndBuild

## Description

`UnrealBuildHelper` is a batch script designed to streamline the process of managing and regenerating Unreal Engine project files. It simplifies the task of cleaning old build files, regenerating project files your Unreal Engine projects. This is basically simulates the manual `Generate Visual Studio project`.

## Features

- **File Cleanup**: Automatically delete `Intermediate`, `Binaries`, and `Saved` folders.
- **Project File Regeneration**: Regenerate `.sln` files and other project files using UBT.

## Usage

1. **Clone the Repository**
   
   ```bash
   git clone https://github.com/steknika/UnrealCleanAndBuild
   cd UnrealCleanAndBuild
   ```

2. **Place the Script**

    Copy the `CleanAndBuild.bat` script into your Unreal Engine project root folder.



    **3. Run the Script**

    Double-click `CleanAndBuild.bat` or run it from the command line:

```bash
.\CleanAndBuild.bat
```

4. **Provide Full Path to UnrealBuildTool.exe**
   
   - When prompted, enter the full path to `UnrealBuildTool.exe`. For example: `C:\Program Files\Epic\Games\UE_5.4\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe`
   - The script will save this path into `ubt_path.txt` for future use.

5. **Follow Prompts**
   The script will automatically delete old build files and regenerate necessary project files the `Binaries`, `Intermediate`, `Saved` and `YourProjectName.sln` folders and files. And recreate the your visual studio project. 

## Notes

- The script assumes that `.uproject` files are located in the same directory as the batch file.
- The path to `UnrealBuildTool.exe` will be saved in `ubt_path.txt` for future use.
