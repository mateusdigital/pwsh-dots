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
##  File      : git-show-ssh-url.sh                                           ##
##  Project   : dots                                                          ##
##  Date      : 2023-11-08                                                    ##
##  License   : See project's COPYING.TXT for full info.                      ##
##  Author    : mateus.digital <hello@mateus.digital>                         ##
##  Copyright : mateus.digital - 2023 - 2024                                  ##
##                                                                            ##
##  Description :                                                             ##
##                                                                            ##
##----------------------------------------------------------------------------##
#!/usr/bin/env bash

readonly url="$(git url)";

host=$(echo "$url" | cut -d "/" -f 3)
user=$(echo "$url" | cut -d "/" -f 4)
repo=$(echo "$url" | cut -d "/" -f 5)

echo "git@${host}:${user}/${repo}.git"
