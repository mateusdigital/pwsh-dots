
$pwsh    = "$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1";
$windows = "$HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1";
$vscode  = "$HOME/Documents/PowerShell/Microsoft.VSCode_profile.ps1";

$windows_dirname = Split-Path -Parent -Path "$windows";
$vscode_dirname  = Split-Path -Parent -Path "$vscode";

New-Item -Type Directory -Path "$windows_dirname" 2>$null;
New-Item -Type Directory -Path "$vscode_dirname"  2>$null;

Write-Output "if(Test-Path '$pwsh') { . '$pwsh'; }" | Out-File -FilePath "$windows";
Write-Output "if(Test-Path '$pwsh') { . '$pwsh'; }" | Out-File -FilePath "$vscode";

Write-Output "Done...";