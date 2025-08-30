@echo off
REM =============================================================================
REM Batch script to install required software and set up LazyVim on Windows
REM =============================================================================

echo Installing required software...

REM Install Chocolatey using winget
winget install --accept-source-agreements chocolatey.chocolatey

REM Use choco to install tools
choco install -y neovim git ripgrep wget fd unzip gzip mingw make

echo.
echo Cloning LazyVim starter template...

REM Backup any existing Neovim configuration
if exist "%LOCALAPPDATA%\nvim" (
  echo Backing up existing nvim to nvim.bak...
  powershell -Command "Move-Item '%LOCALAPPDATA%\\nvim' '%LOCALAPPDATA%\\nvim.bak' -Force"
)
if exist "%LOCALAPPDATA%\nvim-data" (
  echo Backing up existing nvim-data to nvim-data.bak...
  powershell -Command "Move-Item '%LOCALAPPDATA%\\nvim-data' '%LOCALAPPDATA%\\nvim-data.bak' -Force"
)

REM Clone the starter repository
git clone https://github.com/jlangemeijer/lazyvim_config "%LOCALAPPDATA%\nvim"

echo LazyVim starter template cloned successfully.
echo Please customize the configuration as needed in your own GitHub repo.

echo.
echo To finish setup:
echo 1. Launch Neovim: nvim
echo 2. Inside Neovim, run: :LazyHealth
echo    This will load plugins and verify everything is working properly.

echo Done.
pause
