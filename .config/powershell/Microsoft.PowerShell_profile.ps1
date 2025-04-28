##--------------------------------------------------------------------------##
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
## Check if Powershell is the pwsh 7+ version.
##

## -----------------------------------------------------------------------------
function IsPowershellTooOld()
{
  return ($PSVersionTable.PSVersion.Major -lt 7);
}


if (IsPowershellTooOld) {
  Write-Host "[OLD POWERSHELL]" -ForegroundColor White -BackgroundColor Red;
  exit;
}

##
## Environment Vars.
##

##------------------------------------------------------------------------------
$env:POWERSHELL_TELEMETRY_OPTOUT = 1; ## Don't track us.
$env:DOTS_IS_VERBOSE             = 0; ## We dont' want a talkative dots.

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

## -----------------------------------------------------------------------------
$DOTS_TEMP_DIR = if ($IsWindows) {
  $env:TEMP
} else {
  "/tmp"
};


##------------------------------------------------------------------------------
if($IsWindows) {
  ## @notice: Needs to have the ending slash, otherwise the path will be wrong.
  ## Aliases depends that those vars are empty in non windows environments.
  $_CORE_UTILS_DIR = "${DOTS_BIN_DIR}/dots/win32/coreutils-5.3.0-bin/bin/";
  $_FIND_UTILS_DIR = "${DOTS_BIN_DIR}/dots/win32/findutils-4.2.20-2-bin/bin/";
  $_DIFF_UTILS_DIR = "${DOTS_BIN_DIR}/dots/win32/diffutils-2.8.7-1-bin/bin/";
}

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

## -----------------------------------------------------------------------------
function edit-profile()
{
  & $env:VISUAL                                     `
    "$DOTS_PS_DIR/Microsoft.PowerShell_profile.ps1" `
    ;
}

## -----------------------------------------------------------------------------
function edit-profile-full()
{
  & $env:VISUAL                                     `
    "$DOTS_PS_DIR/Microsoft.PowerShell_profile.ps1" `
    "$DOTS_BIN_DIR"                                 `
    "${HOME}/.gitconfig"                            `
    "${HOME}/.clang-format"                         `
    "$DOTS_CONFIG_DIR"                              `
    "$DOTS_PS_DIR"                                  `
    ;

}

## -----------------------------------------------------------------------------
function edit-ignore()
{
  & $env:VISUAL "${DOTS_GIT_IGNORE_PATH}";
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
## @notice(md): I decided not clutter the shell with the gnu tools, but instead
## create functions that calls the actual program with the complete path.
## Making this way since i have a lot of troubles with the gnu tools in
## some edge cases that i don't want to deal with right now. - 2025-01-16

## List

## -----------------------------------------------------------------------------
function dir() {
  if($args.Length -eq 0) {
    Get-ChildItem ".";
  } else {
    Get-ChildItem $args;
  }
};

## -----------------------------------------------------------------------------
if($IsWindows) {
  ## This avoids recursion on the ls function.
  function ls() { & "${_CORE_UTILS_DIR}ls" $args; }
}

## -----------------------------------------------------------------------------
function la() { & "${_CORE_UTILS_DIR}ls" -a  $args; }

## -----------------------------------------------------------------------------
function ll() { & "${_CORE_UTILS_DIR}ls" -al $args; }


## Copy

## -----------------------------------------------------------------------------
function cp() { & "${_CORE_UTILS_DIR}cp" $args; }


## Json

## -----------------------------------------------------------------------------
function jd() {
 "$(Get-Clipboard)" | jq
}


## Move

## -----------------------------------------------------------------------------
## -----------------------------------------------------------------------------
if($IsWindows) {
  ## This avoids recursion on the ls function.
  function mv() { & "${_CORE_UTILS_DIR}mv" $args; }
}

## Remove

## -----------------------------------------------------------------------------
function rm() {
  if(($args.Length -gt 0) -and ($args[0] -eq "-rf")) {
    Write-Host "Use rd instead of rm -rf" -ForegroundColor Red;
    return;
  }

  Remove-Item  $args;
}

## -----------------------------------------------------------------------------
function rd() { Remove-Item -Recurse -Force $args; } ## Remove Directory...


##
## File System usage aliases
##

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
function ide()
{
  $result = (ls .sln | peco);
  if($result.Length -ne 0) {
    Invoke-Item $result;
  } else {
    Write-Output "Ignoring...";
  }
}

##------------------------------------------------------------------------------
function f() { files $args; }

## -----------------------------------------------------------------------------
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
function go()
{
  if($args.Length -eq 0) {
    $result = (gosh -l | peco);
  } else {
    $result = (gosh -l | peco --query $args);
  }

  if($result.Length -ne 0) {
    gosh "$result";
  }
}


##------------------------------------------------------------------------------
function open-item()
{
  $value = "";

  if($args.Length -gt 0) {
    $value = $args[0];

    if(Test-Path "$value") {
      Invoke-Item "$value";
      return;
    }
  }

  $result = (ls | peco --query "$value");
  if($result.Length -ne 0) {
    Invoke-Item $result;
  } else {
    Write-Output "Ignoring...";
  }
}


##
## NPM
##

##------------------------------------------------------------------------------
function npm-list-deps() {
  npm list --depth=0 --json | jq -r '.dependencies | keys[]'
}

##------------------------------------------------------------------------------
function ni()
{
  npm install $args;
}

##------------------------------------------------------------------------------
function nrd() {
  npm run dev $args;
}

##
## Network
##

##------------------------------------------------------------------------------
function show-connected-wifi()
{
  if(-not $IsWindows) {
    Write-Error "Not implemented for non-windows";
    return;
  }

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
      ## Programs
      "C:/Program Files/nodejs",
      "${env:AppData}/npm",
      ## Dots
      "${DOTS_BIN_DIR}",
      "${DOTS_BIN_DIR}/dots",
      "${DOTS_BIN_DIR}/dots/win32",
      "${DOTS_BIN_DIR}/dots/win32/ProcessExplorer",
      ## mateusdigital
      "${HOME}/.mateusdigital/bin",
      ## Rest
      "${env:PATH_DEFAULT}"
    )
  }
  elseif($IsLinux) {
    $paths = @(
      "${DOTS_BIN_DIR}",
      "${DOTS_BIN_DIR}/dots",
      "${env:PATH_DEFAULT}"
    );
  }
  elseif ($IsMacOS) {
    $paths = @(
      "${DOTS_BIN_DIR}",
      "${DOTS_BIN_DIR}/dots",
      "${DOTS_BIN_DIR}/dots/macos",
      ## mateusdigital
      "${HOME}/.mateusdigital/bin",
      ## Rest
      "${env:PATH_DEFAULT}"
    );
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
## Git-Functions
##

##------------------------------------------------------------------------------
function g()  { git        $args; }
function gs() { git status $args; }

function galiases() {
  $values = (git config --get-regexp ^alias\.);
  foreach($value in $values) {
    $alias_name = $value.Split(" ")[0].Replace("alias.", "");
    Write-Output "${alias_name}";
  }
}

function galias() { galiases $args; }

function gauthors()
{
  git log --format='%an'          | `
    Group-Object                  | `
    Sort-Object Count -Descending | `
    ForEach-Object { "$($_.Name): $($_.Count)" }
}

## --- LOG ---------------------------------------------------------------------
function gl() { git log    $args; }
function glog() { git log --decorate --oneline --graph --all   $args; }

## --- PUSH --------------------------------------------------------------------
function gp()    { git push $args; }
function gpush() { git push $args; }
function gpull() { git pull $args; }

## --- RESET -------------------------------------------------------------------
function greset() { git reset --hard; }

## --- GUI ---------------------------------------------------------------------
function gg()  { git gui $args; }
function gui()  { gitui $args; }
function gtk() { gitk --all; }

## --- NEW BRANCH---------------------------------------------------------------
function git-branch-new() {
  if($args.Length -eq 0) {
    Write-Host "[FATAL] No branch name was given." -ForegroundColor Red;
    return;
  }

  $clean_name = ($args -join "-");
  Write-Output "Creating branch: ($clean_name)";

  git checkout -b "$clean_name";
}

## -----------------------------------------------------------------------------
function gn() { git-branch-new $args; }

## --- CHECKOUT ----------------------------------------------------------------
function git-branch-checkout() {
  $branch_name = "";
  if($args.Length -eq 0) {
    $branch_name = $args[0];
  }

  $all_branches = (git branch --all --list);
  $success = $?;
  if(-not $success) {
    Write-Host "Failed to get branches from git." -ForegroundColor Red;
    return;
  }

  $clean_branches = "";
  for($i = 0; $i -lt $all_branches.Length; $i++) {
    $clean_name = $all_branches[$i];
    $clean_name = $clean_name.Replace("*", "").Trim().Replace("remotes/origin/", "");

    if($clean_name.Contains("HEAD")) {
      continue;
    }

    $clean_branches += "$clean_name ";
  }

  $picked = $clean_branches.Split(" ") `
    | Sort-Object `
    | Select-Object -Unique `
    | peco --query "$branch_name";

  if($picked.Length -eq 0) {
    Write-Host "[FATAL] No branch name was given." -ForegroundColor Red;
    return;
  }

  Write-Host "Checking out to branch: ($picked)." -ForegroundColor Blue;
  git checkout $picked;
}

## -----------------------------------------------------------------------------
function gc() { git-branch-checkout $args; }


## --- DELETE BRANCH -----------------------------------------------------------
function git-delete-branch() {
  $result = $(git --no-pager branch --all);
  $result = $result | peco;

  if($result.Length -ne 0) {
    $branch_name = $result.Replace("*", "").Trim();
    Write-Output "Deleting branch: ($branch_name)";
    git branch -D $branch_name;
  }
}

## -----------------------------------------------------------------------------
function git-delete-remote-branch() {
  $result = $(git --no-pager branch --all);
  $result = $result | peco;
  if($result.Length -eq 0) {
    return;
  }


  $branch_name = $result.Replace("remotes/origin/", "").Trim();
  Write-Output "Deleting branch: ($branch_name)";
  git push origin --delete  "$branch_name";
}



## --- SUBMODULE ---------------------------------------------------------------
function git-submodule-update-init-recursive()
{
  git submodule update --init --recursive;
}

## -----------------------------------------------------------------------------
function gsuir() { git-submodule-update-init-recursive; }

## --- IGNORE ------------------------------------------------------------------
function git-ignore()
{
  $response = Invoke-RestMethod -Uri "https://www.toptal.com/developers/gitignore/api/list";
  $picked   = $response.Split(",") | peco;
  if(-not $picked -or $picked.Length -eq 0) {
    return;
  }

  $response = Invoke-RestMethod -Uri "https://www.toptal.com/developers/gitignore/api/${picked}";
  Write-Output $response | Out-File -Append .gitignore;
}



##
## clang-format
##

##------------------------------------------------------------------------------
function copy-clang-format()
{
  Copy-Item "${HOME}/.clang-format" "${PWD}/.clang-format";
}

##
## Dots
##

##------------------------------------------------------------------------------
$DOTS_GIT_IGNORE_PATH = "$HOME/.config/dots-gitignore";


##------------------------------------------------------------------------------
function dots()
{
  $dots_dir = "$HOME/.pwsh-dots";

  git -c core.excludesFile="$DOTS_GIT_IGNORE_PATH" `
    --git-dir="$dots_dir"                          `
    --work-tree="$HOME"                            `
      $args;
}


## -----------------------------------------------------------------------------
function repochecker-all()
{
  repochecker --remote --submodules --show-all $args;
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

  return $text;

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
  else {
    ## @todo(md): Add support for non windows...
    $ip = "[unknown]";
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
  elseif ($IsMacOS) {
    return "-macOS";
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
  if(-not $IsWindows) {
    ## @todo(md): Add support for non windows.
    Write-Host "Not implemented for non-windows" -ForegroundColor Red;
    return;
  }

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
function yt()     { yt-dlp $args; }
function yt-mp3() { yt-dlp --extract-audio $args }



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
## Powerline
##

## -----------------------------------------------------------------------------
if (-not (Get-Module -Name PSReadLine)) {
  Write-Host "[INFO] Loading PSReadLine" -ForegroundColor Yellow;
  Import-Module PSReadLine;
}


## -----------------------------------------------------------------------------
function _OnViModeChange
{
  if ($args[0] -eq 'Command') {
    Write-Host -NoNewLine "`e[1 q";# Set the cursor to a blinking block.
  } else {
    Write-Host -NoNewLine "`e[5 q"; # Set the cursor to a blinking line.
  }
}


## -----------------------------------------------------------------------------
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView;

Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:_OnViModeChange;
Set-PSReadlineOption -EditMode Vi

Set-PSReadlineOption -HistorySavePath "${HOME}/.pwsh-history.txt";
Set-PSReadlineOption -HistorySaveStyle SaveIncrementally;
Set-PSReadLineOption -MaximumHistoryCount 1000000

Set-PSReadLineOption -PredictionSource HistoryAndPlugin;

## -----------------------------------------------------------------------------
Set-PSReadLineKeyHandler -Chord Ctrl+Alt+F3 -ScriptBlock {
    Write-Host "edit-profile" -ForegroundColor Green
    edit-profile
}
## -----------------------------------------------------------------------------
Set-PSReadLineKeyHandler -Chord Ctrl+Alt+r -ScriptBlock {
    Write-Host ". $profile" -ForegroundColor Green
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('. $profile')
}

##
## Visual Studio Compiler
##

## -----------------------------------------------------------------------------
# Import-VisualStudioEnvironment

Write-Host "[Profile Reloaded]" -ForegroundColor Magenta;
