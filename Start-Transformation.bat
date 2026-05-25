@echo off
REM JesterBloxx Transformation Batch Script
REM This script helps automate the transformation process

setlocal enabledelayedexpansion

color 4C
title JesterBloxx Transformation Tool

echo.
echo ================================================================
echo           JesterBloxx Transformation Tool
echo ================================================================
echo.

REM Check if running from correct directory
if not exist "Bloxstrap" (
    color 4E
    echo ERROR: Bloxstrap folder not found!
    echo Please run this script from the root of your repository.
    echo.
    pause
    exit /b 1
)

echo [Step 1] Preparing transformation...
echo.

REM Create backup
if not exist "Bloxstrap_Backup" (
    echo Creating backup of Bloxstrap folder...
    xcopy "Bloxstrap" "Bloxstrap_Backup" /E /I /Y >nul
    if !errorlevel! equ 0 (
        echo ✓ Backup created: Bloxstrap_Backup
    ) else (
        echo ✗ Failed to create backup
        pause
        exit /b 1
    )
)

echo.
echo [Step 2] Key folders to reorganize:
echo   - Core\              (Bootstrapper, Installer, LaunchHandler)
echo   - Integrations\      (Discord, Server detection)
echo   - Models\            (Data models, Enums, Attributes)
echo   - UI\                (Windows, ViewModels, Styles)
echo   - Utilities\         (Logging, Cache, Extensions)
echo   - Resources\         (Fonts, Icons, Strings)
echo.

echo [Step 3] Next steps:
echo   1. Rename: Bloxstrap folder to JesterBloxx
echo   2. Update: Use Visual Studio Find & Replace (Ctrl+H)
echo      - Find:    namespace Bloxstrap
echo      - Replace: namespace JesterBloxx
echo   3. Repeat for XAML:
echo      - Find:    clr-namespace:Bloxstrap
echo      - Replace: clr-namespace:JesterBloxx
echo   4. Build and test in Visual Studio
echo.

echo Press any key to open this repository in Explorer...
pause >nul

REM Open current directory in Explorer
explorer .

echo.
echo Transformation guide available at: TRANSFORMATION_GUIDE.md
echo.
pause
