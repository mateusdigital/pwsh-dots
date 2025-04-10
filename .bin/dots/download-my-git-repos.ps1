
##
## Vars
##

## -----------------------------------------------------------------------------
$user_name = "mateusdigital";
$api_url   = "https://api.github.com/users/${user_name}/repos?per_page=100"

$projects_dir = "$HOME/Projects/${user_name}";

if($args.Length -gt 0) {
  $projects_dir = $args[0];
  if(-not (Test-Path "$projects_dir")) {
    Write-Output "The directory ($projects_dir) does not exist.";
    exit;
  }
}

##
## Entry Point
##

## -----------------------------------------------------------------------------
$response = Invoke-RestMethod -Uri $api_url;

# Output the repository names
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

  $target_dir = "$projects_dir/$type/$name";
  if(Test-Path "$target_dir") {
    Write-Output "($name) is already clonned...";
    continue;
  }

  $base_dir = "$projects_dir/$type";
  if(-not (Test-Path "$base_dir")) {
    New-Item -ItemType Directory -Path  "$base_dir";
  }

  Write-Output "Downloading: ($name) to ${projects_dir}";
  if($DownloadViaSSH) {
    git clone "git@github.com:${user_name}/${name}" "$target_dir";
  } else {
    git clone "https://github.com/${user_name}/${name}" "$target_dir";
  }
}