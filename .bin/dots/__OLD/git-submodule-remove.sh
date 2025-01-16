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
##  File      : git-submodule-remove.sh                                       ##
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

readonly submodule_name="$1";

echo "---> Removing submodule ${submodule_name}";

git submodule deinit -f "${submodule_name}";
git rm -f "${submodule_name}"
rm -rf ".git/modules/${submodule_name}"

git commit -m "---> Deleted submodule ${submodule_name}";