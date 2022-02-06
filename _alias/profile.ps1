function dotgitsetup { git --git-dir=$HOME/dotfiles/ --work-tree=$HOME @args }

# dotfile alias
Set-Alias -Name dotgit -Value dotgitsetup

function copyFiles { Copy-Item -Path "$HOME\_files\*" -Destination "$pwd" -Recurse }

# copy dotfiles
Set-Alias -Name dotcopy -Value copyFiles
