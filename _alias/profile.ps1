function dtf { git --git-dir=$HOME/dotfiles/ --work-tree=$HOME @args }

# dotfile alias
Set-Alias -Name dotgit -Value dtf

function cpcore {
  Copy-Item "$HOME\_files\.editorconfig" -Destination "$pwd"
  Copy-Item "$HOME\_files\.gitignore" -Destination "$pwd"
}

function cpall {
  Copy-Item "$HOME\_files\.browserslistrc" -Destination "$pwd"
  Copy-Item "$HOME\_files\.editorconfig" -Destination "$pwd"
  Copy-Item "$HOME\_files\.gitignore" -Destination "$pwd"
}

# copy core dotfiles
Set-Alias -Name dotcpcore -Value cpcore

# copy all dotfiles
Set-Alias -Name dotcpall -Value cpall
