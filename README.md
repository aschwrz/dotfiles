# dotfiles

* [dotfile-alias] --> dotfiles
* [git-repo-dir] --> $HOME/Repos/dotfiles/
* [dotfile-dir] --> %HOME/
* [shell-file] --> $HOME/.zshrc

## Initial setup
##### Create & Initialize Repo
* mkdir [git-repo-dir]
* cd [git-repo-dir]
* git init --bare

##### Add Repo place to the current gitignore
touch .gitignore
echo [git-repo-dir] >> .gitignore

##### Set dotfiles alias 
* alias [dotfile-alias]='/usr/bin/git --git-dir=[git-repo-dir] --work-tree=[dotfile-dir] '

##### Hide not explicitly tracked files in git status
* [dotfile-alias] config --local status.showUntrackedFiles no
  
##### Set alias permanently by adding it to the standard shell
* echo "alias [dotfile-alias]='/usr/bin/git --git-dir=[git-repo-dir] --work-tree=[dotfile-dir]'" >> [shell-file] 

## Download and Setup on a new System
##### Set alias permanently by adding it to the standard shell
* echo "alias [dotfile-alias]='/usr/bin/git --git-dir=[git-repo-dir] --work-tree=[dotfile-dir]'" >> [shell-file] 
* Restart/Resource shell

##### Make sure the Repo is part of the .gitignore
* cat [git-repo-dir]/gitignore
* git clone --bare [git-repo-url] [git-repo-dir]
    
##### Checkout the actual content from the bare repo
* [dotfile-alias]  checkout
* if the above command fails (file clash) delete or rename the offending files and checkout again

> Shortcut
> mkdir -p .config-backup && \
> config checkout 2]&1 | egrep "\s+\." | awk {'print $1'} | \
> xargs -I{} mv {} .config-backup/{}

##### Hide not explicitly tracked files in git status
* [dotfile-alias]  config --local status.showUntrackedFiles no


## Usage    
* [dotfile-alias]  status
* [dotfile-alias]  add .zshrc
* [dotfile-alias]  commit -m ".zshrc added"
* [dotfile-alias]  push
* [dotfile-alias]  pull
* ...
