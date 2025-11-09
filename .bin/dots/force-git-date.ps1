# Set-GitCommitsDate.ps1
param(
    [string]$TargetDate = "2022-01-01T12:00:00"
)

# Ensure we're in a Git repo
if (-not (Test-Path ".git")) {
    Write-Error "Not in a git repository directory!"
    exit 1
}

# Backup .git directory just in case
$backupDir = ".git_backup_$(Get-Date -Format 'yyyyMMddHHmmss')"
Copy-Item .git $backupDir -Recurse
Write-Host "Backup of .git created at $backupDir"

# Apply the new date to all commits using git filter-branch
Write-Host "Rewriting all commits to have date $TargetDate..."

$envFilter = "export GIT_AUTHOR_DATE='$TargetDate'; export GIT_COMMITTER_DATE='$TargetDate';"

git filter-branch --env-filter $envFilter -- --all

Write-Host "All commits now have the new date. If you push to a remote, you'll need to force-push:"
Write-Host "  git push --force"
