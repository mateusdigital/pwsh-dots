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
##  File      : clean-win32-home.sh                                           ##
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

set -e; ## Stop on errors.


if [ -z "$(uname -a | grep WSL)" ]; then
    echo "$0 not running in WSL - Exiting...";
    exit 1;
fi;

## Clean all the links to folders that we don"t care on the ## C:/Users/USERNAME.
## For now just works on the Brazilian Portuguese version of Windows 11.
## mateus - 22-09-14

USERNAME=$(whoami); ## @XXX: Make sure that Windows username is the same as the WSL one.

cd "/mnt/c/Users/$USERNAME/";

rm -rf                       \
    "Ambiente de Impressão"  \
    "Ambiente de Rede"       \
    "Configurações Locais"   \
    "Contacts"               \
    "Cookies"                \
    "Dados de Aplicativos"   \
    "Favorites"	             \
    "Links"                  \
    "Menu Iniciar"           \
    "Meus Documentos"        \
    "Modelos"                \
    "OneDrive"               \
    "Recent"                 \
    "Saved Games"            \
    "Searches"               \
    "SendTo"                 \
    ;
