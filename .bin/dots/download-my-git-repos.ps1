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
##  File      : download-my-git-repos.ps1                                     ##
##  Project   : dots                                                          ##
##  Date      : 2025-04-23                                                    ##
##  License   : See project's COPYING.TXT for full info.                      ##
##  Author    : mateus.digital <hello@mateus.digital>                         ##
##  Copyright : mateus.digital - 2025                                         ##
##                                                                            ##
##  Description :                                                             ##
##                                                                            ##
##----------------------------------------------------------------------------##

##
## Vars
##

## -----------------------------------------------------------------------------
$USER_NAME = "mateusdigital";
$API_URL   = "https://api.github.com/users/${USER_NAME}/repos?per_page=100"

$ProjectsDir    = "${HOME}/Projects/${USER_NAME}";
$DownloadViaSSH = $false;

##
## Read command line args
##

## -----------------------------------------------------------------------------
for($i = 0 ; $i -lt $args.Count; $i++) {
  $arg = $args[$i];
  if($arg -eq "--help") {
    Write-Output "Usage: download-my-git-repos.ps1 [--ssh] [--dir <dir>]";
    exit;
  }

  if($arg -eq "--ssh") {
    $DownloadViaSSH = $true;
    continue;
  }

  if($arg -eq "--dir") {
    $ProjectsDir = $args[$i + 1];
    continue;
  }
}

Write-Host "Projects directory: $ProjectsDir";
Write-Host "Downloading via ssh: $DownloadViaSSH";


##
## Entry Point
##

## -----------------------------------------------------------------------------
$response = Invoke-RestMethod -Uri $API_URL;

## Output the repository names
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

  $target_dir = "$ProjectsDir/$type/$name";
  if(Test-Path "$target_dir") {
    Write-Output "($name) is already cloned...";
    continue;
  }

  $base_dir = "$ProjectsDir/$type";
  if(-not (Test-Path "$base_dir")) {
    New-Item -ItemType Directory -Path  "$base_dir";
  }

  Write-Output "Downloading: ($name) to ${ProjectsDir}";
  if($DownloadViaSSH) {
    git clone "git@github.com:${USER_NAME}/${name}" "$target_dir";
  } else {
    git clone "https://github.com/${USER_NAME}/${name}" "$target_dir";
  }
}