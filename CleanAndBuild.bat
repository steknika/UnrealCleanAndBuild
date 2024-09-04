@echo off
setlocal enabledelayedexpansion

REM Set the current directory as the base path
set "BASE_PATH=%~dp0"

REM File to store the UnrealBuildTool.exe path
set "UBT_PATH_FILE=%BASE_PATH%ubt_path.txt"

REM Check if the UnrealBuildTool.exe path is already saved
if exist "%UBT_PATH_FILE%" (
    set /p UE5_UBT_PATH=<"%UBT_PATH_FILE%"
) else (
    REM Ask the user for the UnrealBuildTool.exe path
    set /p UE5_UBT_PATH="Please enter the full path to UnrealBuildTool.exe (e.g., C:\Path\To\UnrealBuildTool.exe): "
    
    REM Save the path to the file without extra characters
    (
        echo !UE5_UBT_PATH!
    ) > "%UBT_PATH_FILE%"
)

REM Remove surrounding quotes from the path if they exist
set "UE5_UBT_PATH=%UE5_UBT_PATH:"=%"

REM Find the .uproject file in the current directory and extract its name
set "UPROJECT_FILE="
for %%f in ("%BASE_PATH%*.uproject") do (
    set "UPROJECT_FILE=%%~nxf"
    set "PROJECT_NAME=%%~nf"
)

REM Check if the .uproject file was found
if "%UPROJECT_FILE%"=="" (
    echo Error: No .uproject file found in the current directory.
    goto :end
)

REM Set the path to your .uproject file
set "UPROJECT_PATH=%BASE_PATH%%UPROJECT_FILE%"

REM Delete the Intermediate, Binaries, and Saved folders
echo Deleting Intermediate, Binaries, and Saved folders...
if exist "%BASE_PATH%Intermediate" rmdir /s /q "%BASE_PATH%Intermediate"
if exist "%BASE_PATH%Binaries" rmdir /s /q "%BASE_PATH%Binaries"
if exist "%BASE_PATH%Saved" rmdir /s /q "%BASE_PATH%Saved"

REM Delete the .sln file
echo Deleting .sln file...
if exist "%BASE_PATH%%PROJECT_NAME%.sln" (
    del /q "%BASE_PATH%%PROJECT_NAME%.sln"
) else (
    echo .sln file not found, proceeding with regeneration...
)

REM Regenerate project files using UnrealBuildTool
echo Regenerating project files...
"%UE5_UBT_PATH%" -projectfiles -project="%UPROJECT_PATH%" -game -rocket -progress

echo Done!
pause

:end
endlocal