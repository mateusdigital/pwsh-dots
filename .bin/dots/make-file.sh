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
##  File      : make-file.sh                                                  ##
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
set -e;

##------------------------------------------------------------------------------
function show_usage() {
    echo -e "Usage:\n   make-file.sh <-e | --exec> <path/to/the/file.ext>";
    exit 1;

}

##------------------------------------------------------------------------------
is_exec="";
filepath="";

## Parse the command line.
for arg in "$@"; do
    if [ "$arg" == "-e" ] || [ "$arg" == "--exec" ]; then
        is_exec="true";
    else
        filepath="$arg";
    fi;
done;


test -z "${filepath}" && show_usage;

filename="$(basename  "$filepath")";
foldername="$(dirname "$filepath")";

## Craete the file and the folder if needed.
mkdir -p "${foldername}";
touch "${foldername}/${filename}";

## MArk this as executable.
if [ "$is_exec" ]; then
    chmod 744 "${foldername}/${filename}";
fi;

echo "---> File touch(1)ed at: ${foldername}/${filename}";
