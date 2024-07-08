
##~---------------------------------------------------------------------------##
##                               *       +                                    ##
##                         '                  |                               ##
##                     ()    .-.,="``"=.    - o -                             ##
##                           '=/_       \     |                               ##
##                        *   |  '=._    |                                    ##
##                             \     `=./`,        '                          ##
##                          .   '=.__.=' `='      *                           ##
##                 +                         +                                ##
##                      O      *        '       .                             ##
##                                                                            ##
##  File      : $PROFILE                                                      ##
##  Project   : pwsh-dots                                                     ##
##  Date      : 2023-08-11                                                    ##
##  License   : GPLv3                                                         ##
##  Author    : mateus.digital <hello@mateus.digital>                         ##
##  Copyright : mateus.digital - 2023, 2024                                   ##
##                                                                            ##
##  Description :                                                             ##
##    Dot files for windows machines.                                         ##
##---------------------------------------------------------------------------~##


##
## Environment Vars.
##

##------------------------------------------------------------------------------
$env:POWERSHELL_TELEMETRY_OPTOUT = 1; ## Don't track us.
$env:DOTS_IS_VERSBOSE            = 0; ## We dont' want a talkative dots.

##------------------------------------------------------------------------------
$env:EDITOR = "code";
$env:VISUAL = "code";


##
## Important directories
##

##------------------------------------------------------------------------------
$DOTS_BIN_DIR    = "${HOME}/.bin";                  ## The location of our custom binaries - It'll be 1st on PATH.
$DOTS_CONFIG_DIR = "${HOME}/.config";               ## General configuration site.
$DOTS_PS_DIR     = "${DOTS_CONFIG_DIR}/powershell"; ## Powershell scripts site.

$DOTS_TEMP_DIR = if ($IsWindows) {
  $env:TEMP
} else {
  "/tmp"
};


##
## WSL
##

## -----------------------------------------------------------------------------
function IsWSL()
{
  if(-not $IsLinux) {
    return $false;
  }

  return (uname -a | grep microsoft).Length -gt 0;
}

##
## Profiles
##

##------------------------------------------------------------------------------
$DOTS_PROFILE = "$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1";


##------------------------------------------------------------------------------
function make-all-profiles-source-pwsh()
{
  $pwsh    = "$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1";
  $windows = "$HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1";
  $vscode  = "$HOME/Documents/PowerShell/Microsoft.VSCode_profile.ps1";

  $windows_dirname = Split-Path -Parent -Path "$windows";
  $vscode_dirname  = Split-Path -Parent -Path "$vscode";

  New-Item -Type Directory -Path "$windows_dirname" 2>$null;
  New-Item -Type Directory -Path "$vscode_dirname"  2>$null;

  Write-Output "if(Test-Path '$pwsh') { . '$pwsh'; }" | Out-File -FilePath "$windows";
  Write-Output "if(Test-Path '$pwsh') { . '$pwsh'; }" | Out-File -FilePath "$vscode";

  Write-Output "Done...";
}

##------------------------------------------------------------------------------
function edit-profile()
{
  if($args.Count -eq 0) {
    & $env:VISUAL "$PROFILE";
  } else {
    & $env:VISUAL $args;
  }
}

## -----------------------------------------------------------------------------
function edit-master-profile()
{
  & $env:VISUAL "$DOTS_BIN_DIR" "$DOTS_CONFIG_DIR" "$DOTS_PS_DIR" "${HOME}/.gitconfig";
}

##
## Aliases
##

##------------------------------------------------------------------------------
## There's a bunch of aliases that Microsoft adds to the Powershell runtime
## that's quite useful when you don't have the access to the coreutils tool.
## Moreover that aliases are not an 1:1 match to the original coreutils, which makes
## the behaviour acceptable on the command line - due the muscle memory - but
## very troublesome to use in scripts.
## I decided to use all the gnu coreutils tools in our scripts and tools in
## all platforms.
## This means that we need to unset a bunch of aliases here to make the things
## works as intent, since alias seems to have precedence over the $PATH.
##
## WARNING:
##    THIS HAVE THE POSSIBILITY OF BREAK OTHER STUFF THAT *** WRONGLY ***
##    DEPENDS ON THOSE ALIASES!!!!
##
## mmesquita - 22-08-29
##

Get-Alias | Where-Object { $_.Options -NE "Constant" } | Remove-Alias -Force;
Get-Alias | Remove-Alias -Force;


##
## Shell
##

##------------------------------------------------------------------------------
function la() { ls -a  $args; }
function ll() { ls -al $args; }
function rd() { Remove-Item -Recurse -Force $args; }

##------------------------------------------------------------------------------
$global:OLDPWD = "";
function cd($target_path = "")
{
  ## cd
  ## @notice(stdmatt): This is pretty cool - It makes the cd to behave like
  ## the bash one that i can cd - and it goes to the OLDPWD.
  ## I mean, this thing is neat, probably PS has some sort of this like that
  ## but honestly, not in the kinda mood to start to look to all the crap
  ## microsoft documentation. But had quite fun time doing this silly thing!
  ## Kinda the first thing that I write in my standing desk here in kyiv.
  ## I mean, this is pretty cool, just could imagine when I get my new keychron!
  ## March 12, 2021!!

  ## @notice(stdmatt): This can be done just by calling sh_pushd and popd...
  ## maybe one day I'll move it - 22-04-08 @ guaruja

  ## @notice(mateusdigital): HAHA so happy to see this above comment :)
  ## Even if pwsh does that already I'll let this here as a piece of history!
  ## Working in a pure windows environment ,4nai, so I'll need to go back to powershell.
  if ($target_path -eq "") {
    $target_path = "${HOME}";
  }

  if ($target_path -eq "-") {
    $target_path = $global:OLDPWD;
  }

  $global:OLDPWD = [string](Get-Location);
  Set-Location $target_path; ## Needs to be the Powershell builtin or infinity recursion
}

##------------------------------------------------------------------------------
function f() { files $arsg; }

function files()
{
  ## Open the Filesystem Manager into a given path.
  ## If no path was given open the current dir.
  $target_path = $args[0];
  if ($target_path.Length -eq 0) {
    $target_path = ".";
  }

  $file_manager = "";
  if ($IsWindows) {
    $file_manager = "explorer.exe";
  }
  elseif ($IsMacOS) {
    $file_manager = "open";
  }

  ## @todo(stdmatt): Add for linux someday... at 2022-03-04, 15:54
  if ($file_manager -eq "") {
    Write-Output "No file manager was found - Aborting...";
    return;
  }

  if (-not(Test-Path "$target_path")) {
    Write-Output "Invalid path ($target_path)- Aborting...";
    return;
  }

  & $file_manager $target_path;
  return;
}

##------------------------------------------------------------------------------
function gcd()
{
  $result = (gosh -l | peco --query $args);
  if($result.Length -ne 0) {
    gosh "$result";
  }
}


##
## Network
##

##------------------------------------------------------------------------------
function show-connected-wifi()
{
  $wifi_info = netsh wlan show interfaces | Select-String -Pattern "^\s*SSID\s*:\s*(.*)$"
  if ($wifi_info -match "^\s*SSID\s*:\s*(.*)$") {
    $wifi_name = $matches[1].Trim();
    return $wifi_name;
  }

  return "";
}

## -----------------------------------------------------------------------------
function show-wifi-password()
{
  if (-not $IsWindows) {
    Write-Output "Not implemented for non-windows";
    return;
  }
  if($args[0].Length -ne 0) {
    $wifi_name = $args[0];
  } else {
    $wifi_name = (show-connected-wifi);
  }
  $pattern   = "^\s*Key Content\s*:\s*(.+)$"
  $wifi_pass = (netsh wlan show profile "${wifi_name}" key = clear | Select-String -Pattern "$pattern");
  if ($wifi_pass -match "$pattern") {
    $wifi_pass = $matches[1].Trim();
    return $wifi_pass;
  }
  return "";
}


##
## PATH
##

##------------------------------------------------------------------------------
function _get_default_PATH()
{
  if (-not($env:PATH_DEFAULT)) {
    $env:PATH_DEFAULT = $env:PATH;
  }

  return $env:PATH_DEFAULT;
}

##------------------------------------------------------------------------------
function _configure_PATH()
{
  ##
  if($IsWindows) {
    $paths = @(
      "C:/Program Files/nodejs",
      "${env:AppData}/Python/Python311/Scripts",
      "${env:AppData}/npm",
      "${DOTS_BIN_DIR}",
      "${DOTS_BIN_DIR}/dots",
      "${DOTS_BIN_DIR}/dots/win32",
      "${DOTS_BIN_DIR}/dots/win32/coreutils-5.3.0-bin/bin",
      "${DOTS_BIN_DIR}/dots/win32/findutils-4.2.20-2-bin/bin",
      "${DOTS_BIN_DIR}/dots/win32/ProcessExplorer",
      ## "${DOTS_BIN_DIR}/dots/win32/ffmpeg/bin", ## Use the winget version...
      "${DOTS_BIN_DIR}/dots/win32/vifm-w64-se-0.13-binary", ## VIFM
      "${HOME}/.stdmatt/bin",
      "${HOME}/.mateusdigital/bin",
      "${HOME}/scoop/shims",
      "${env:PATH_DEFAULT}"
    )
  }
  elseif($IsLinux) {
    $paths = @(
      "${DOTS_BIN_DIR}",
      "${DOTS_BIN_DIR}/dots",
      "${HOME}/.stdmatt/bin",
      "${env:PATH_DEFAULT}"
    )
  }

  ##
  $path_separator_char = ":";
  if($isWindows) {
    $path_separator_char = ";";
  }

  return $paths -join $path_separator_char
}

##------------------------------------------------------------------------------
function path-list()
{
  Write-Output "Current PATH: "

  $path_separator_char = ":";
  if($isWindows) {
    $path_separator_char = ";";
  }

  foreach ($item in ${env:PATH}.Split($path_separator_char)) {
    Write-Output "  $item";
  }
}


##------------------------------------------------------------------------------
$env:PATH_DEFAULT = (_get_default_PATH);
$env:PATH         = (_configure_PATH);


##
## Version
##

##------------------------------------------------------------------------------
function dots-version()
{
  $PROGRAM_NAME            = "dots";
  $PROGRAM_VERSION         = "4.0.0";
  $PROGRAM_AUTHOR          = "mateus.digital - <hello@mateus.digital>";
  $PROGRAM_COPYRIGHT_OWNER = "mateus.digital";
  $PROGRAM_COPYRIGHT_YEARS = "2021 - 2024";
  $PROGRAM_DATE            = "30 Nov, 2021";
  $PROGRAM_LICENSE         = "GPLv3";

  $output = @(
      "${PROGRAM_NAME} - ${PROGRAM_VERSION} - ${PROGRAM_AUTHOR}"
      "Copyright (c) ${PROGRAM_COPYRIGHT_YEARS} - ${PROGRAM_COPYRIGHT_OWNER}"
      "This is a free software (${PROGRAM_LICENSE}) - Share/Hack it"
      "Check https://mateus.digital for more :)"
  ) -join "`n";

  Write-Output "$output";
}


##
## Git
##

## -----------------------------------------------------------------------------
## Call git bash easily!
function git-bash()
{
    & "C:/Program Files/Git/bin/bash.exe" -i -l
}

##------------------------------------------------------------------------------
function g()  { git        $args; }
function gs() { git status $args; }
function gl() { git log    $args; }

## -----------------------------------------------------------------------------
function gc() { git commit -m $args;  }

## -----------------------------------------------------------------------------
function gb() { git branch $args; }
function gmb() { git merge-branch; }
function gcb() { git create-branch $args; }

## -----------------------------------------------------------------------------
function gp()    { git push   $args; }
function gpull() { git pull $args; }

## -----------------------------------------------------------------------------
function gg() { git gui $args; }
function ggg() { & gitui.exe $args; }
function gtk() { gitk --all; }

## -----------------------------------------------------------------------------
function add-gitignore()
{
  $response = Invoke-RestMethod -Uri "https://www.toptal.com/developers/gitignore/api/list";
  $picked   = $response.Split(",") | peco;
  if(-not $picked -or $picked.Length -eq 0) {
    return;
  }

  $response = Invoke-RestMethod -Uri "https://www.toptal.com/developers/gitignore/api/${picked}";
  Write-Output $response | Out-File -Append .gitignore;
}


##------------------------------------------------------------------------------
function dots()
{
  $dots_dir       = "$HOME/pwsh-dots.git";
  $gitignore_path = "$HOME/.config/dots-gitignore";

  git -c core.excludesFile="$gitignore_path" `
    --git-dir="$dots_dir"                    `
    --work-tree="$HOME"                      `
      $args;
}


## -----------------------------------------------------------------------------
function download-my-git-repos()
{
  $user_name = "mateusdigital";
  $api_url   = "https://api.github.com/users/${user_name}/repos?per_page=100"

  $projects_dir = "$HOME/Projects/${user_name}";

  $response = Invoke-RestMethod -Uri $api_url;

  # Output the repository names
  foreach($item in $response) {
    $name   = $item.name
    $topics = $item.topics;
    $type   = "other";

    if(($topics -contains "demo")) {
      $type = "demo";
    }
    if(($topics -contains "game")) {
      $type = "game";
    }
    if(($topics -contains "library")) {
      $type = "library";
    }
    if(($topics -contains "tool")) {
      $type = "tool";
    }
    if(($topics -contains "personal")) {
      $type = "personal";
    }
    if(($topics -contains "website")) {
      $type = "website";
    }

    $target_dir = "$projects_dir/$type/$name";
    if(Test-Path "$target_dir") {
      Write-Output "($name) is already clonned...";
      continue;
    }

    $base_dir = "$projects_dir/$type";
    if(-not (Test-Path "$base_dir")) {
      New-Item -ItemType Directory -Path  "$base_dir";
    }

    Write-Output "Downloading: ($name) to ${projects_dir}";
    git clone "git@github.com:${user_name}/${name}" "$target_dir";
  }
}

## -----------------------------------------------------------------------------
function repochecker-all()
{
  repochecker.ps1 --remote --submodules --show-all --short;
}

## -----------------------------------------------------------------------------
function clean-temp-repos()
{
  $temp_dir = "${HOME}/Projects/_temp";
  Remove-Item -Force -Recurse "$temp_dir";
  New-Item -ItemType Directory -Path "$temp_dir";
}


##
## Prompt
##

##------------------------------------------------------------------------------
$__sha256  = [System.Security.Cryptography.SHA256]::Create();

function __rgb_from_text()
{
  param(
    [string]$text
  )

  $bytes_to_hash = [System.Text.Encoding]::UTF8.GetBytes($text)
  $hash_bytes    = $__sha256.ComputeHash($bytes_to_hash);

  $r =  $hash_bytes[0];
  $g =  $hash_bytes[1];
  $b =  $hash_bytes[2];


  if($r -lt 80) { $r += (100 - $r) * 2; }
  if($g -lt 80) { $g += (100 - $g) * 2; }
  if($b -lt 80) { $b += (100 - $b) * 2; }

  # return "`e[38;2;${r};${g};${b}m${r};${g};${b}-${e}- ${text}`e[0m";
  return "`e[38;2;${r};${g};${b}m${text}`e[0m";
}

function __update_ps1_ip_address
{
  if($IsWindows) {
    $ip = (Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" -and $_.AddressState -eq "Preferred" } | Select-Object -First 1).IPAddress
  } elseif($IsLinux) {
    $ip = (ip addr show | grep -E 'inet [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | grep -v '127.0.0.1' | awk '{print $2}' | cut -f1 -d'/');
  }
  return "$ip";
}

function __update_ps1_icon
{
  if($IsWindows) {
    return "-win32";
  }
  elseif(& IsWSL) {
    return "-WSL";
  }
  elseif($IsLinux) {
    return "-linux";
  }
  return "-other";
}

function __update_ps1_ssh
{
  if($env:SSH_CONNECTION) {
      return "ssh";
  }

  return "";
}

function __update_ps1_git
{
  $git_branch = git rev-parse --abbrev-ref HEAD 2> $null
  if ($git_branch) {
    $is_dirty = (git status --porcelain);

    if ($is_dirty) {
      $git_branch += "*";
    }

    $branch = (git rev-parse --abbrev-ref HEAD)
    $num_unpulled_commits = (git rev-list "HEAD..origin/$branch" --count);
    $num_unpushed_commits = (git rev-list "origin/$branch..HEAD" --count);

    $status_info = "";

    if ($num_unpushed_commits -gt 0) {
      $status_info += "Ahead: $num_unpushed_commits ";
    }

    if ($num_unpulled_commits -gt 0) {
      $status_info += "Behind: $num_unpulled_commits ";
    }

    return "$git_branch $status_info".Trim();
  }

  return "";
}



##------------------------------------------------------------------------------
$_PS1_IP_ADDRESS   = $(__update_ps1_ip_address);
$_PS1_OS_ICON      = $(__update_ps1_icon);
$_PS1_IS_USING_SSH = $(__update_ps1_ssh);

##------------------------------------------------------------------------------
function _update_prompt()
{
  $last_cmd_sucessfull = $?

  $location = Get-Location;
  $user     = "$env:USERNAME";
  $hostname = hostname;

  $git_info = $(__update_ps1_git);

  $smile_face = if ($last_cmd_sucessfull) { ":)" }else { ":(" }

  ## Make the $HOME be just "~".
  if ($location.Path -like "$env:USERPROFILE*") {
    $subpath = $location.Path.Substring($env:USERPROFILE.Length);
    $location = "~${subpath}";
  }

  if ($git_info.Length -gt 0) {
    $git_info = " - (${git_info}) - ";
  } else {
    $git_info = " - ";
  }

  return "(${location})${git_info}(${user}@${hostname}${_PS1_OS_ICON}) - (${_PS1_IP_ADDRESS}${_PS1_IS_USING_SSH})`n${smile_face}";
}

function prompt()
{
  $_colored = (__rgb_from_text $(_update_prompt));
  Write-Host "${_colored}" -NoNewline;
  return " ";
}



##
## Audio / Video Utils
##

## -----------------------------------------------------------------------------
function select-audio()
{
  $ignore_list  = @("DELL S3422DWG");
  $devices_list = (Get-AudioDevice -List);

  $selected_device_name = $devices_list | ForEach-Object {
    if($_.Type -eq "Playback") {
      $device_name = $_.Name;
      foreach($ignore_item in $ignore_list) {
        if ($device_name -like "*$ignore_item*") {
          return;
        }
      }
      Write-Output $device_name;
    }
  } | peco;

  if($selected_device_name.Length -ne 0) {
    $device_id = $null;
    $null = $devices_list | ForEach-Object {
      $device_name = $_.Name;
      if($device_name -eq $selected_device_name) {
        $device_id = $_.ID
        return;
      }
    }

    $null = Set-AudioDevice -ID "$device_id";
    Write-Output "Setting device: $selected_device_name";
  }
}

## -----------------------------------------------------------------------------
function yt()     { yt-dlp.exe $args; }
function yt-mp3() { yt-dlp.exe --extract-audio $args }

## -----------------------------------------------------------------------------
function scale-video()
{
  $input_filename = $args[0];
  Write-Output "${input_filename}";

  $output_filename = "$input_filename" -replace '\.mp4$', '-scaled.mp4';
  ffmpeg -i "${input_filename}" -vf "scale=trunc(iw/4)*2:trunc(ih/4)*2" "${output_filename}";
}

## -----------------------------------------------------------------------------
function scale-video-a-lot()
{
  $input_filename = $args[0];
  Write-Output "${input_filename}";

  $output_filename = "$input_filename" -replace '\.mp4$', '-scaled.mp4';
  ffmpeg -i "${input_filename}" -vf "scale=trunc(iw/8)*2:trunc(ih/8)*2" "${output_filename}";
}


##
## Other things
##

## -----------------------------------------------------------------------------
function touch_all_files()
{
  $folder_path     = $PWD.Path;
  $files           = Get-ChildItem -Path $folder_path  -Recurse -File;
  $currentDateTime = Get-Date;

  foreach ($file in $files) {
    Write-Output "Updating $file";

    $file.CreationTime   = $currentDateTime;
    $file.LastWriteTime  = $currentDateTime;
    $file.LastAccessTime = $currentDateTime;
  }

  Write-Host "All files' dates have been updated to the current time."
}


##
## Vim
##

function v()
{
  if($args.Count -eq 0) {
    nvim.exe $PWD;
    return;
  }

  nvim.exe $args;
}

function vf()
{
  if($args.Count -eq 0) {
      vifm.exe $PWD;
      return;
  }

  vifm.exe $args;
}

## -----------------------------------------------------------------------------
function OnViModeChange
{
  if ($args[0] -eq 'Command') {
    Write-Host -NoNewLine "`e[1 q";# Set the cursor to a blinking block.
  } else {
    Write-Host -NoNewLine "`e[5 q"; # Set the cursor to a blinking line.
  }
}


## -----------------------------------------------------------------------------
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange;
Set-PSReadlineOption -EditMode Vi


##
## Visual Studio Compiler
##

## -----------------------------------------------------------------------------
# Import-VisualStudioEnvironment
