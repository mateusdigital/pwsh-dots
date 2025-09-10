##----------------------------------------------------------------------------##
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
## Useful functions
##

## -----------------------------------------------------------------------------
function UnixSlash() {
  return $args[0].ToString().Replace("\", "/");
}

## -----------------------------------------------------------------------------
function WinSlash() {
  return $args[0].ToString().Replace("/", "\");
}

## -----------------------------------------------------------------------------
function PlatformSlash() {
  if($IsWindows) {
    return WinSlash $args[0];
  }
  return UnixSlash $args[0];
}

## -----------------------------------------------------------------------------
function WinPATHSeparator() {
  return ";";
}

## -----------------------------------------------------------------------------
function UnixPATHSeparator() {
  return ":";
}

## -----------------------------------------------------------------------------
function PlatformPATHSeparator() {
  if($IsWindows) {
    return WinPATHSeparator;
  }
  return UnixPATHSeparator;
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

if($IsMacOS) {
  function python() {
    & "python3" @args;
  }
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
function devshell()
{
  if(-not $IsWindows) {
    Write-Error "This function is only available on Windows.";
    return;
  }

  $vs_install_path = (vswhere -latest -property installationPath)
  if (-not $vs_install_path) {
      Write-Error "Visual Studio not found!" -ForegroundColor Red;
      return;
  }

  $vs_dev_cmd = (Join-Path $vs_install_path "Common7\Tools\Launch-VsDevShell.ps1");
  Write-Host "Loading Visual Studio DevShell: $vs_dev_cmd" -ForegroundColor Green;
  if (-not (Test-Path $vs_dev_cmd)) {
      Write-Error "VsDevCmd.bat not found!" -ForegroundColor Red;
      return
  }

  & "$vs_dev_cmd";
}

## -----------------------------------------------------------------------------
function edit-profile()
{
  & $env:VISUAL                                     `
    "$DOTS_PS_DIR/Microsoft.PowerShell_profile.ps1" `
    ;
}

## -----------------------------------------------------------------------------
function edit-git()
{

  & $env:VISUAL                                     `
    "${HOME}/.gitconfig"                            `
    "$DOTS_CONFIG_DIR"                              `
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


## ------------------------------------------------------------------------------
function echo() {
  if($args.Length -eq 0) {
    Write-Host "";
  } else {
    Write-Host $args;
  }
}

## ------------------------------------------------------------------------------
function cat() {
  if($args.Length -eq 0) {
    Write-Host "";
  } else {
    Get-Content $args;
  }
}


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
  function ls() { & "${_CORE_UTILS_DIR}ls" @args; }
}

## -----------------------------------------------------------------------------
function la() { & "${_CORE_UTILS_DIR}ls" -a  @args; }

## -----------------------------------------------------------------------------
function ll() { & "${_CORE_UTILS_DIR}ls" -al @args; }


## Copy

## -----------------------------------------------------------------------------
function cp() { & "${_CORE_UTILS_DIR}cp" @args; }


## Move

## -----------------------------------------------------------------------------
if($IsWindows) {
  ## This avoids recursion on the mv function.
  function mv() { & "${_CORE_UTILS_DIR}mv" @args; }
}


## Remove

## -----------------------------------------------------------------------------
function rm() {
  if(($args.Length -gt 0) -and ($args[0] -eq "-rf")) {
    Write-Host "Use rd instead of rm -rf" -ForegroundColor Red;
    return;
  }

  Remove-Item $args;
}

## -----------------------------------------------------------------------------
## Remove Directory...
function rd() { Remove-Item -Recurse -Force $args; }


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
  if(Test-Path $target_path -PathType Leaf) {
    Write-Host "[INFO] Target path is a file, going to the parent dir." -ForegroundColor Yellow;
    Write-Host "  $target_path" -ForegroundColor Cyan;
    $target_path = Split-Path -Path $target_path -Parent;
  }

  ## Needs to be the Powershell builtin or infinity recursion
  Set-Location $target_path;
}


##------------------------------------------------------------------------------
function ide()
{

  ## !TODO: Implement for mac....
  $gradle_files = (Get-Item "*gradle*");
  if($gradle_files -and $gradle_files.Length -ne 0) {
    & "$env:ANDROID_STUDIO" "./";
    return;
  }

  $vs_solutions = fd -e sln -e vcxproj
  if ($vs_solutions -and $vs_solutions.Count -gt 0) {
      $selected_solution = $vs_solutions | peco

      if (-not $selected_solution -or $selected_solution.Trim().Length -eq 0) {
          Write-Host "No solution selected - Aborting..." -ForegroundColor Red
          return
      }

      Invoke-Item $selected_solution
  }

}

##------------------------------------------------------------------------------
function f() { files @args; }

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
}

##------------------------------------------------------------------------------
function go()
{
  if($args.Length -eq 0) {
    $result = (gosh -L | peco);
  } else {
    $result = (gosh -L | peco --query $args);
  }

  if($result.Length -ne 0) {
    $path = $result.split(":")[0].Trim();
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
## Free Functions -- These functions are not meant to have the impression
## that they are commands, but functions that are useful in the shell.
## That's why they are written with PascalCase instead of shell-program-like
##   -- @mateusdigital - 2025-06-04

## -----------------------------------------------------------------------------
function ChangeExtension()
{
  param(
    [string]$SrcGlob,
    [string]$NewExt,
    [switch]$Recursive = $false
  )

  if($SrcGlob.Length -eq 0) {
    Write-Error "No SrcGlob was given - Aborting...";
    return;
  }
  if($NewExt.Length -eq 0) {
    Write-Error "No NewExt was given - Aborting...";
    return;
  }

  if ($Recursive) {
    $files = Get-ChildItem -Path $SrcGlob -Recurse;
  } else {
    $files = Get-ChildItem -Path $SrcGlob;
  }

  foreach ($file in $files) {
    $new_filename = [System.IO.Path]::ChangeExtension($file.FullName, $NewExt);

    Write-Output "Renaming $($file.FullName) to $new_filename";
    Rename-Item -Verbose      `
      -Path    $file.FullName `
      -NewName $new_filename
  }
}

## -----------------------------------------------------------------------------
function EnsurePath()
{
  param(
    [string]$Path
  )

  if (-not (Test-Path -Path $Path)) {
    Write-Output "Creating path: $Path";
    New-Item -ItemType Directory -Path $Path -Force;
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
## Android
##

## -----------------------------------------------------------------------------
## !TODO: Make this works on mac as well...
$sep = PlatformPATHSeparator
if($IsWindows)
{
  $env:ANDROID_ROOT        = "D:/_Installed/Android";
  $env:ANDROID_STUDIO_PATH = "${env:ANDROID_ROOT}/AndroidStudio/bin";
  $env:ANDROID_STUDIO      = "${env:ANDROID_STUDIO_PATH}/studio64.exe";
}

elseif($IsMacOS)
{
  $env:ANDROID_ROOT        = "${HOME}/Library/Android";
  $env:ANDROID_STUDIO_PATH = "/Applications/Android Studio.app/Contents/MacOS";
  $env:ANDROID_STUDIO      = "${env:ANDROID_STUDIO_PATH}/studio";
}

$env:ANDROID_SDK_ROOT    = "$env:ANDROID_ROOT/Sdk";
$env:ANDROID_SDK_HOME    = "$env:ANDROID_ROOT/Avd";
$env:ANDROID_HOME        = "$env:ANDROID_SDK_ROOT";

$env:ANDROID_PATH = "${env:ANDROID_HOME}/cmdline-tools/latest/bin$sep" `
                  + "${env:ANDROID_HOME}/emulator$sep"                 `
                  + "${env:ANDROID_HOME}/platform-tools$sep"           `
                  + "${env:ANDROID_STUDIO_PATH}$sep"                   `
                  ;


## -----------------------------------------------------------------------------
function android-list-paths() {
  Write-Host "ANDROID_HOME     " $env:ANDROID_HOME;
  Write-Host "ANDROID_SDK_ROOT " $env:ANDROID_SDK_ROOT;
  Write-Host "ANDROID_PATH     " (PlatformSlash $env:ANDROID_PATH).Replace(";","`n");
}

##
## Java
##

## -----------------------------------------------------------------------------
$JAVA_UTILS = "$DOTS_BIN_DIR/dots/java-utils.ps1";
function set-java() {
  . $JAVA_UTILS;
  java-set-version 21;
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
  $env:PNG_EDITOR = "";
  $env:PSD_EDITOR = "";
  $env:WAV_EDITOR = "audacity";
  $env:MP3_EDITOR = "audacity";


  ##
  if($IsWindows) {
    ## Programs
    $paths = @(
      "C:/Program Files/nodejs",
      "${env:AppData}/npm",
      ## Ghostscript
      "D:/_Installed/GraphicsMagick-1.3.45-Q16/",
      "D:/_Installed/gs9.52/bin"

    );
    ## mateusdigital
    $paths += @(
      "${HOME}/.mateusdigital/bin",
      "${HOME}/.mateusdigital/bin/file-locksmith"
    );

    ## Dots
    $paths += @(
      "${DOTS_BIN_DIR}",
      "${DOTS_BIN_DIR}/dots",
      "${DOTS_BIN_DIR}/dots/win32",
      "${DOTS_BIN_DIR}/dots/win32/ProcessExplorer"
      "${DOTS_BIN_DIR}/dots/win32/gvim_9.1.0_x64_signed/vim/vim91"
    );

    ## Java / Android
    if($env:JAVA_HOME) {
      $paths += @(
        "${env:JAVA_HOME}",
        "${env:JAVA_HOME}/bin"
      );

      $paths += "${env:ANDROID_PATH}";
    }

    ## Coreutils
    $paths += @(
      "$_FIND_UTILS_DIR",
      "$_DIFF_UTILS_DIR"
    )
  }

  ##
  ## Linux
  ##

  elseif($IsLinux) {
    $paths = @(
      "${DOTS_BIN_DIR}",
      "${DOTS_BIN_DIR}/dots",
      "${env:PATH_DEFAULT}"
    );
  }

  ##
  ## Mac
  ##

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

    $paths += "${env:ANDROID_PATH}";
  }

  ##
  $path_separator_char = ":";
  if($isWindows) {
    $path_separator_char = ";";
  }

  $paths += "${env:PATH_DEFAULT}";
  return $paths -join $path_separator_char
}

##------------------------------------------------------------------------------
function path-list()
{
  Write-Output "Current PATH: ";

  $path_separator_char = ":";
  if($isWindows) {
    $path_separator_char = ";";
  }

  foreach ($item in ${env:PATH}.Split($path_separator_char)) {
    Write-Output "  $item";
  }
}

##------------------------------------------------------------------------------
function path-check-valid-directories()
{
  $path_separator_char = ":";
  if($isWindows) {
    $path_separator_char = ";";
  }

  $invalid_paths = @();
  foreach ($item in ${env:PATH}.Split($path_separator_char)) {
    if (-not (Test-Path -Path $item -PathType Container)) {
      $invalid_paths += $item;
    }
  }

  if ($invalid_paths.Count -gt 0) {
    Write-Host "Invalid paths found in PATH:" -ForegroundColor Red;
    foreach ($invalid_path in $invalid_paths) {
      Write-Host "  $invalid_path" -ForegroundColor Yellow;
    }
  } else {
    Write-Host "All paths in PATH are valid." -ForegroundColor Green;
  }
}

##------------------------------------------------------------------------------
$env:PATH_DEFAULT = (_get_default_PATH);
$env:PATH         = (_configure_PATH);




##
## Git-Functions
##

## --- Git ---------------------------------------------------------------------
function g()  { git        $args; }
function gs() { git status $args; }


## --- Aliases -----------------------------------------------------------------
function galiases() {
  $values = (git config --get-regexp ^alias\.);
  foreach($value in $values) {
    $alias_name = $value.Split(" ")[0].Replace("alias.", "");
    Write-Output "${alias_name}";
  }
}

function galias() { galiases $args; }

## --- Authors ------------------------------------------------------------------
function gauthors()
{
  git log --format='%an'          | `
    Group-Object                  | `
    Sort-Object Count -Descending | `
    ForEach-Object { "$($_.Name): $($_.Count)" }
}

## --- Size --------------------------------------------------------------------
function gsize() { git count-objects -vH; }


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
  Write-Host "DEBUG: args='$args' Length=$($args.Length)" -ForegroundColor Yellow

  if($args.Length -lt 1) {
    Write-Host "[FATAL] No branch name was given." -ForegroundColor Red;
    return;
  }

  $clean_name = ($args -join "-");
  Write-Output "Creating branch: ($clean_name)";

  git checkout -b "$clean_name";
}

function git-new-branch() { git-branch-new @args; }
function gn() { git-branch-new @args; }

## --- CHECKOUT ----------------------------------------------------------------
function git-branch-checkout() {
  $branch_name = "";
  if($args.Length -gt 0) {
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
function default-clang-format()
{
  Copy-Item "${HOME}/.clang-format" "${PWD}/.clang-format" -Verbose;
}

## -----------------------------------------------------------------------------
function default-git-ignore()
{
  Copy-Item "${HOME}/.gitignore" "${PWD}/.gitignore" -Verbose;
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
      $count = $is_dirty.Count;
      $git_branch += "* ($count)";
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
  $user_home = $HOME;
  if ($user_home -eq $null) {
    $user_home = [System.Environment]::GetFolderPath("UserProfile");
  }
  if ($location.Path -like "$user_home*") {
    $subpath = $location.Path.Substring($user_home.Length);
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
