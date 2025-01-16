
## Bootstrap:

```pwsh
    ## Bootstrap dots
    git clone --bare https://github.com/mateusdigital/pwsh-dots "${HOME}/.pwsh-dots"
    git --git-dir="${HOME}/.pwsh-dots/" --work-tree=$HOME checkout --force
```