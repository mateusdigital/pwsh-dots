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
##  File      : java-utils.ps1                                                ##
##  Project   : dots                                                          ##
##  Date      : 2025-04-29                                                    ##
##  License   : See project's COPYING.TXT for full info.                      ##
##  Author    : mateus.digital <hello@mateus.digital>                         ##
##  Copyright : mateus.digital - 2025                                         ##
##                                                                            ##
##  Description :                                                             ##
##                                                                            ##
##----------------------------------------------------------------------------##

##
## JAVA JDK UTILS
##

## -----------------------------------------------------------------------------
$DOTS_JDK_BASE_DIR = "D:/Software" ## @todo(md): Change this to a more generic location.
$env:DOTS_JAVA_UTILS_IMPORTED = $true;

## -----------------------------------------------------------------------------
$env:JAVA11_HOME = "${DOTS_JDK_BASE_DIR}/OpenJDK11U-jdk_x64_windows_hotspot_11.0.27_6/jdk-11.0.27+6";
$env:JAVA17_HOME = "${DOTS_JDK_BASE_DIR}/OpenJDK17U-jdk_x64_windows_hotspot_17.0.15_6/jdk-17.0.15+6";
$env:JAVA21_HOME = "${DOTS_JDK_BASE_DIR}/OpenJDK21U-jdk_x64_windows_hotspot_21.0.7_6/jdk-21.0.7+6";
$env:JAVA24_HOME = "${DOTS_JDK_BASE_DIR}/OpenJDK24U-jdk_x64_windows_hotspot_24.0.1_9/jdk-24.0.1+9";


##
## Helper Functions
##

## -----------------------------------------------------------------------------
function CleanPath()
{
  $v = if($args.Length -gt 0) { $args[0] } else { $env:PATH };
  if(-not $v) {
    return "";
  }

  return $v.replace("\","/");
}

## -----------------------------------------------------------------------------
function SystemPath()
{
  $v = if($args.Length -gt 0) { $args[0] } else { $env:PATH };
  if(-not $v) {
    return "";
  }
  if($isWindows) {
    return $v.replace("/","\");
  }
  return $v;
}


##
## Public Functions
##

## -----------------------------------------------------------------------------
function java-discover-from-environment()
{
  $_func = $MyInvocation.MyCommand.Name;
  Write-Host "[$_func]";

  $java_home     = (CleanPath "$env:JAVA_HOME");
  $java_home_bin = (CleanPath "$env:JAVA_HOME/bin");

  if ($null -eq $java_home) {
    Write-Host "JAVA_HOME is not set" -Foreground Red;
    return;
  }

  Write-Host "JAVA_HOME:     $java_home"     -Foreground Green;
  Write-Host "JAVA_HOME_BIN: $java_home_bin" -Foreground Green;

  $clean_path             = (CleanPath "${env:PATH}");
  $index_of_java_home_bin = $clean_path.IndexOf($java_home_bin);
  if($index_of_java_home_bin -eq -1) {
    Write-Host "JAVA_HOME_BIN is not in PATH" -Foreground Red;
    return;
  }

  Write-Host "JAVA_HOME_BIN is in PATH" -Foreground Green;
  Write-Host -NoNewline "$($clean_path.Substring(0, $index_of_java_home_bin))";
  Write-Host -NoNewline "${java_home_Bin}" -ForegroundColor Green;
  Write-Host -NoNewline "$($clean_path.Substring($index_of_java_home_bin + $java_home_bin.Length))";
  Write-Host "";

  java-current-version;
}

## -----------------------------------------------------------------------------
function java-current-version()
{
  $_func = $MyInvocation.MyCommand.Name;
  Write-Host "[$_func]";

  $version = $env:JAVA_HOME -replace ".*jdk-([0-9]+)\..*", '$1';

  if(-not $version) {
    Write-Host "JAVA_HOME is not set" -Foreground Red;
    return;
  }
  Write-Host "Current version: $version from JAVA_HOME";

  $java_version_major = $(java --version).Split("`n")[0].Split(" ")[1].Split(".")[0];
  if($version -ne $java_version_major) {
    Write-Host "JAVA_HOME: $env:JAVA_HOME";
    java --version;
    Write-Host "Version mismatch: $version != $java_version_major" -Foreground Red;
  } else {
    Write-Host "Version match: $version == $java_version_major" -Foreground Green;
  }
}


## -----------------------------------------------------------------------------
function java-set-version()
{
  param (
    [Parameter(Mandatory = $true)]
    [string]$version
  )

  $_func = $MyInvocation.MyCommand.Name;
  Write-Host "[$_func]";

  switch ($version) {
    "0"  { $new_java_home = ""; }
    "11" { $new_java_home = $env:JAVA11_HOME; }
    "17" { $new_java_home = $env:JAVA17_HOME; }
    "21" { $new_java_home = $env:JAVA21_HOME; }
    "24" { $new_java_home = $env:JAVA24_HOME; }
    default {
      Write-Host "Unknown version: $version" -Foreground Red;
      return;
    }
  }

  $old_java_home     = (CleanPath ${env:JAVA_HOME});
  $new_java_home     = (CleanPath $new_java_home);
  $old_java_home_bin = if($old_java_home.Length -gt 0 ) { "$old_java_home/bin" } else { "" };
  $new_java_home_bin = if($new_java_home.Length -gt 0 ) { "$new_java_home/bin" } else { "" };

  Write-Host "Old JAVA_HOME:     $old_java_home";
  Write-Host "Old JAVA_HOME_BIN: $old_java_home_bin";

  Write-Host "New JAVA_HOME:     $new_java_home";
  Write-Host "New JAVA_HOME_BIN: $new_java_home_bin";

  $path_separator_char = if($isWindows) { ";" } else { ":"} ;

  $clean_path = (CleanPath ${env:PATH});
  $new_path   = "";

  if($old_java_home.Length -gt 0) {
    $new_path = $clean_path.Replace($old_java_home_bin, $new_java_home_bin);
    $new_path = $new_path.Replace($old_java_home, $new_java_home);
  } else {
    $new_path  = $new_java_home_bin + $path_separator_char;
    $new_path += $new_java_home     + $path_separator_char;
    $new_path += $clean_path;
  }

  $path_items = $new_path.Split($path_separator_char);
  foreach ($item in $path_items) {
    Write-Host "  --> $item" -Foreground Yellow;
  }

  $env:PATH      = (SystemPath $new_path);
  $env:JAVA_HOME = (SystemPath $new_java_home);
  Write-Host "Set `$env:PATH...";

  # [Environment]::SetEnvironmentVariable("JAVA_HOME", $new_java_home, "User");
  # [Environment]::SetEnvironmentVariable("PATH",      $new_path,      "User");
  Set-ItemProperty -Path "HKCU:\Environment" -Name "JAVA_HOME" -Value $new_java_home
  Set-ItemProperty -Path "HKCU:\Environment" -Name "PATH"      -Value $new_path
  Write-Host "Set Environment Variables";


  Write-Host "New PATH: $env:PATH" -Foreground Green;
  Write-Host "Set JAVA_HOME to $env:JAVA_HOME";

  java-discover-from-environment;
}


## -----------------------------------------------------------------------------
function java-list-available-versions()
{
  $_func = $MyInvocation.MyCommand.Name;
  Write-Host "[$_func]";

  Write-Host 11;
  Write-Host 17;
  Write-Host 21;
  Write-Host 24;
}


## -----------------------------------------------------------------------------
function java-list-paths()
{
  $_func = $MyInvocation.MyCommand.Name;
  Write-Host "[$_func]";

  Write-Host "JAVA11_HOME $env:JAVA11_HOME";
  Write-Host "JAVA17_HOME $env:JAVA17_HOME";
  Write-Host "JAVA21_HOME $env:JAVA21_HOME";
  Write-Host "JAVA24_HOME $env:JAVA24_HOME";
  Write-Host "";
  Write-Host "JAVA_HOME   $env:JAVA_HOME";
}