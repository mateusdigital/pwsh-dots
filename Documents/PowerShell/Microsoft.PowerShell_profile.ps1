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
##  Copyright : mateus.digital - 2023                                         ##
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
$DOTS_BIN_DIR    = "${HOME}/.bin"; ## The location of our custom binaries - It'll be 1st on PATH.
$DOTS_CONFIG_DIR = "${HOME}/.config"; ## General configuration site.
$DOTS_PS_DIR     = "${HOME}/.powershell"; ## Powershell scripts site.

$DOTS_TEMP_DIR = if ($IsWindows) {
    $env:TEMP
} else {
    "/tmp"
};



##
## Profiles
##

##------------------------------------------------------------------------------
$DOTS_PROFILE = "$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1";


##------------------------------------------------------------------------------
function make-all-profiles-source-pwsh() {
    $pwsh    = "$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1";
    $windows = "$HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1";
    $vscode  = "$HOME/Documents/PowerShell/Microsoft.VSCode_profile.ps1";

    $windows_dirname = Split-Path -Parent -Path "$windows";
    $vscode_dirname = Split-Path -Parent -Path "$vscode";

    New-Item -Type Directory -Path "$windows_dirname" 2>$null;
    New-Item -Type Directory -Path "$vscode_dirname"  2>$null;

    echo "if(Test-Path '$pwsh') { . '$pwsh'; }" | Out-File -FilePath "$windows";
    echo "if(Test-Path '$pwsh') { . '$pwsh'; }" | Out-File -FilePath "$vscode";

    echo "Done...";
}

##------------------------------------------------------------------------------
function edit-profile() {
    if($args.Count -eq 0) {
        code "$PROFILE";
    } else {
        code $args;
    }
}

function edit-master-profile() {
    code "$DOTS_PROFILE";
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


##
## Explorarion???
##

##------------------------------------------------------------------------------
$global:OLDPWD = "";
function cd($target_path = "") {
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
function f() {
    files $arsg;
}

function files() {
    ## Open the Filesystem Manager into a given path.
    ## If no path was given open the current dir.
    $target_path = $args[0];
    if ($target_path -eq "") {
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
        sh_log_fatal("No file manager was found - Aborting...");
        return;
    }

    if (-not(Test-Path "$target_path")) {
        sh_log_fatal("Invalid path - Aborting...");
        return;
    }

    & $file_manager $target_path;
    return;
}



##
## Network
##

##------------------------------------------------------------------------------
function show-wifi-password() {
    if (-not$IsWindows) {
        sh_log "Not implemented for non-windows";
        return;
    }

    $wifi_name = $args[0];
    netsh wlan show profile "${wifi_name}" key = clear;
}

##
## PATH
##

##------------------------------------------------------------------------------
function _get_default_PATH() {
    if (-not($env:PATH_DEFAULT)) {
        $env:PATH_DEFAULT = $env:PATH;
    }

    return $env:PATH_DEFAULT;
}

##------------------------------------------------------------------------------
function _configure_PATH() {
    $paths = @(
        "${DOTS_BIN_DIR}",
        "${DOTS_BIN_DIR}/dots",
        "${DOTS_BIN_DIR}/dots/win32",
        "${DOTS_BIN_DIR}/dots/win32/coreutils-5.3.0-bin/bin",
        "${DOTS_BIN_DIR}/dots/win32/findutils-4.2.20-2-bin/bin",
        "${DOTS_BIN_DIR}/dots/win32/ProcessExplorer",
        "$HOME/.stdmatt/bin",
        "${env:PATH_DEFAULT}"
    )

    return $paths -join ';'
}

##------------------------------------------------------------------------------
function path-list() {
    echo "Current PATH: "
    foreach ($item in ${env:PATH}.Split(";")) {
        echo "  $item";
    }
}


##------------------------------------------------------------------------------
$env:PATH_DEFAULT = (_get_default_PATH);
$env:PATH         = (_configure_PATH);


##
## Version
##

##------------------------------------------------------------------------------
function dots-version() {
    $PROGRAM_NAME = "dots";
    $PROGRAM_VERSION = "4.0.0";
    $PROGRAM_AUTHOR = "mateus.digital - <hello@mateus.digital>";
    $PROGRAM_COPYRIGHT_OWNER = "mateus.digital";
    $PROGRAM_COPYRIGHT_YEARS = "2021 - 2023";
    $PROGRAM_DATE = "30 Nov, 2021";
    $PROGRAM_LICENSE = "GPLv3";

    sh_join_string "`n" `
        "${PROGRAM_NAME} - ${PROGRAM_VERSION} - ${PROGRAM_AUTHOR}",
    "Copyright (c) ${PROGRAM_COPYRIGHT_YEARS} - ${PROGRAM_COPYRIGHT_OWNER}",
    "This is a free software (${PROGRAM_LICENSE}) - Share/Hack it",
    "Check https://mateus.digital for more :)";
}


###-----------------------------------------------------------------------
#$env:Path += ";C:/MinGW/msys/1.0/bin"; ## posix tools...


## Call git bash easily!
function git-bash() {
    & "C:/Program Files/Git/bin/bash.exe" -i -l
}


##
## Git Configuration
##

##------------------------------------------------------------------------------
function g()  { git        $args; }
function gp() { git push   $args; }
function gs() { git status $args; }
function gl() { git log    $args; }

function gg() { & gitui.exe $args; }

##------------------------------------------------------------------------------
function dots() {
    $dots_dir       = "$HOME/pwsh-dots.git";
    $gitignore_path = "$HOME/.config/dots-gitignore";

    git -c core.excludesFile="$gitignore_path" `
        --git-dir="$dots_dir"                  `
        --work-tree="$HOME"                    `
         $args;

}


function d()  { dots s $args };
function ds() { dots s $args };
function dp() { dots p $args };

function dg() {
    $dots_dir = "$HOME/pwsh-dots.git";
    gitui --directory="$dots_dir" --workdir="$HOME";
}

##
## Prompt
##

##------------------------------------------------------------------------------
function __update_ps1_ip_address {
    $ip = (Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" -and $_.AddressState -eq "Preferred" } | Select-Object -First 1).IPAddress
    return "$ip";
}

function __update_ps1_icon {
    return "";
}

function __update_ps1_ssh {
    if($env:SSH_CONNECTION) {
        return "-ssh";
    }

    return "";
}

function __update_ps1_git {
    $git_branch = git rev-parse --abbrev-ref HEAD 2> $null
    if ($git_branch) {
        $is_dirty = (git status --porcelain)

        if ($is_dirty) {
            $git_branch += "*"
        }

        $branch = (git rev-parse --abbrev-ref HEAD)
        $num_unpulled_commits = (git rev-list "HEAD..origin/$branch" --count)
        $num_unpushed_commits = (git rev-list "origin/$branch..HEAD" --count)

        $status_info = ""

        if ($num_unpushed_commits -gt 0) {
            $status_info += "Ahead: $num_unpushed_commits "
        }

        if ($num_unpulled_commits -gt 0) {
            $status_info += "Behind: $num_unpulled_commits "
        }

        return "$git_branch $status_info".Trim();
    }

    return "";
}



##------------------------------------------------------------------------------
$_PS1_IP_ADDRESS = $(__update_ps1_ip_address);
$_PS1_OS_ICON = $(__update_ps1_icon);
$_PS1_IS_USING_SSH = $(__update_ps1_ssh);

##------------------------------------------------------------------------------
function _update_prompt() {
    $last_cmd_sucessfull = $?
    $location = Get-Location
    $user = $env:USERNAME
    $hostname = hostname
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

function prompt() {
    Write-Host "$(_update_prompt)" -NoNewline;
    return " ";
}


##
##
##
## -----------------------------------------------------------------------------
function yt()
{
    yt-dlp.exe $args;
}