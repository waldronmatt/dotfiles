# dotfiles

My personal dot files.

# Usage

See **[Create a New Repo](https://github.com/waldronmatt/dotfiles#create-a-new-repo)** to create your own dotfiles repository for the first time.

See **[Copy Dotfiles to Another Machine](https://github.com/waldronmatt/dotfiles#copy-dotfiles-to-another-machine)** to migrate your dotfiles to a new machine.

See **[Set Up Permanent Aliases](https://github.com/waldronmatt/dotfiles#set-up-permanent-aliases)** to set up custom short-cut commands.

See **[MISC](https://github.com/waldronmatt/dotfiles#misc)** for additional instructions.

## Create a New Repo

Create your own dotfiles repo and sync with your machine.

### Step 0

Create an empty repo on GitHub.

### Step 1

Create a new bare Git repo to store the history for your dotfiles.

```bash
git init --bare $HOME/dotfiles
```

### Step 2

Tell Git that it should use your home directory as the snapshot for this bare Git repo.

#### Linux/MacOS

**Note**: See **Set Up Permanent Aliases** to set this command permanently.

```bash
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

#### Windows (PowerShell)

First, create a function.

```powershell
function dtf { git --git-dir=$HOME/dotfiles/ --work-tree=$HOME @args }
```

Then assign that function to an alias.

**Note**: See **Set Up Permanent Aliases** to set this command permanently.

```powershell
Set-Alias -Name dotgit -Value dtf
```

### Step 3

Tell Git that this repo should not display all untracked files.

```bash
dotgit config status.showUntrackedFiles no
```

### Step 4

Add files and commit.

**Note**: Whenever you want to add a new dotfile to your Git repo, use your aliased Git command.

```bash
dotgit status
```

Add individual files (**recommended**).

```bash
dotgit add dotfile1 dotfile2
```

**Note**: It is **not** recommended to run `dotgit add .` as this will add all files under your home directory.

```bash
dotgit commit -m "add git dotfiles"
```

```bash
dotgit remote add origin https://github.com/waldronmatt/dotfiles.git
```

```bash
dotgit push --set-upstream origin main
```

## Copy Dotfiles to Another Machine

This section provides instructions for migrating your dotfiles repo on Github to your local machine.

### Step 1

Clone your repo onto the new machine as a non-bare repository.

```bash
git clone --separate-git-dir=$HOME/dotfiles https://github.com/waldronmatt/dotfiles.git dotfiles-tmp
```

### Step 2

Copy the snapshot from your temporary directory to the correct locations on your new machine.

#### Linux/MacOS
```bash
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
```

#### Windows (PowerShell)
```powershell
Copy-Item -Path "$HOME\dotfiles-tmp\*" -Destination "$HOME/" -Recurse -Exclude ".git"
```

### Step 3

Remove the temporary directory.

#### Linux/MacOS
```bash
rm -rf dotfiles-tmp
```

#### Windows (PowerShell)
```powershell
Remove-Item -Force -Recurse -Path "$HOME\dotfiles-tmp\"
```

### Step 4

Repeat steps 2 - 4 above in the section **Create a New Repo**.

## Set Up Permanent Aliases

Instructions for setting up permanaent aliases to more easily maintain dotfiles.

#### Linux/MacOS

Create a new file to store your alias configurations.

```bash
touch ~/.bash_aliases
```

Inside `.bash_aliases`, save your aliases:

```bash
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

Have your linux system's `~/.bashrc` file load your custom `~/.bash_aliases` file.

```bash
if [ -e $HOME/.bash_aliases ]; then
  source $HOME/.bash_aliases
fi
```

Now you can run your `dotgit` from anywhere. Aliases will remain even with terminal/machine restarts.

#### Windows (PowerShell)

Enter the following command to allow scripts to run and set the execution scope to the current user.

**Note**: Read more about the security policy [here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2#remotesigned).

```powershell
set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Create a new file called `profile.ps1` and save the file in the following directory.

```powershell
$Home\My Documents\WindowsPowerShell\profile.ps1
```

Inside `profile.ps1`, save your aliases.

First, create a function
```powershell
function dtf { git --git-dir=$HOME/dotfiles/ --work-tree=$HOME @args }
```

Then assign that function to an alias.

```powershell
Set-Alias -Name dotgit -Value dtf
```

Save `profile.ps1`, and restart your PowerShell terminal.

Now you can run your `dotgit` from anywhere. Aliases will remain even with terminal/machine restarts.

## MISC

### Set up the global gitignore file

#### Linux/MacOS

```bash
git config --global core.excludesfile ~/.gitignore_global
```

#### Windows (PowerShell)

```powershell
git config --global core.excludesfile "$Env:USERPROFILE\.gitignore_global"
```

## References

[https://stegosaurusdormant.com/bare-git-repo/](https://stegosaurusdormant.com/bare-git-repo/)

[https://dev.to/bowmanjd/store-home-directory-config-files-dotfiles-in-git-using-bash-zsh-or-powershell-the-bare-repo-approach-35l3](https://dev.to/bowmanjd/store-home-directory-config-files-dotfiles-in-git-using-bash-zsh-or-powershell-the-bare-repo-approach-35l3)

[https://www.atlassian.com/git/tutorials/dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

[https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained](https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained)

[https://opensource.com/article/19/7/bash-aliases](https://opensource.com/article/19/7/bash-aliases)

[https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

[https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)
