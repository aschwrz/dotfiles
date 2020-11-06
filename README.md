# dotfiles

## Initial setup
### Create & Initialize Repo
* mkdir $HOME/Repos/dotfiles
* cd $HOME/Repos/dotfiles
* git init --bare

### Add Repo place to the current gitignore
touch .gitignore
echo $HOME/Repos/dotfiles >> . gitignore

### Set dotfiles alias 
* alias dotfiles='/usr/bin/git --git-dir=$HOME/Repos/dotfiles --work-tree=$HOME'

### Hide not explicitly tracked files in git status
* dotfiles config --local status.showUntrackedFiles no
  
### Set alias permanently by adding it to the standard shell
* echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/Repos/dotfiles --work-tree=$HOME'" >> $HOME/.zshrc

## Download and Setup on a new System
### Set alias permanently by adding it to the standard shell
* echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/Repos/dotfiles --work-tree=$HOME'" >> $HOME/.zshrc
* Restart/Resource shell

### Make sure the Repo is part of the .gitignore
* cat $HOME/Repos/dotfiles/.gitignore
* git clone --bare <git-repo-url> <git-repo-dir>
    
### Checkout the actual content from the bare repo
* dotfiles checkout
* if the above command fails (file clash) delete or rename the offending files and checkout again

> Shortcut
> mkdir -p .config-backup && \
> config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
> xargs -I{} mv {} .config-backup/{}

### Hide not explicitly tracked files in git status
* dotfiles config --local status.showUntrackedFiles no


## Usage    
* dotfiles status
* dotilfes add .zshrc
* dotfiles commit -m ".zshrc" added
* dotfiles push
* dotfiles pull
* ...
