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
##  File      : scoop-install-packages.ps1                                    ##
##  Project   : powershell                                                    ##
##  Date      : 2024-05-31                                                    ##
##  License   : See project's COPYING.TXT for full info.                      ##
##  Author    : mateus.digital <hello@mateus.digital>                         ##
##  Copyright : mateus.digital - 2024                                         ##
##                                                                            ##
##  Description :                                                             ##
##                                                                            ##
##----------------------------------------------------------------------------##

## -----------------------------------------------------------------------------
$SCOOP_PATH = "${HOME}/scoop"

if(-not $IsWindows) {
  Write-Error "Scoop is just for windows - Ignoring...";
  return;
}

## -----------------------------------------------------------------------------
if(-not (Test-Path "$SCOOP_PATH")) {
  Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression;
}

## -----------------------------------------------------------------------------
Write-Output "Installing Packages...";
scoop install `
  curl        `
  sudo        `
  jq          `
  neovim      `
  gcc         `
  fzf         `
;
