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
##  File      : to-png.sh                                                     ##
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

function show_usage() {
    echo "to-png <filename>";
    exit 1;
}

readonly name="$1";
test -z "$name" && show_usage;

convert "${name}" "${name%.*}.png";
rm "${name}";