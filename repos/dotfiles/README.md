# Prerequisites
## Fonts installed

Recommended font for powerlevel10k is the  "Meslo Nerd Font patched for Powerlevel10k"
https://github.com/romkatv/powerlevel10k/blob/master/font.md

In addition to the documentation, the whole font is saved in the repos .font directory and can be installed by doubleclick each and press install.

### Font available for zsh
Start zsh shell
Menu Edit > Preferences > <Profilename> > Custom font = MesloLGS NF Regular (12)

### Font available for vscode
Start vscode
Menu File > Preferences > Settings
Search settings = terminal font
Terminal > Integrated: Font Family = MesloLGS NF
Terminal > Integrated: Font Size = 12

## tmux installed
sudo apt install tmux

# dotfiles

* [dotfile-alias] -> dotfiles
* [git-repo-dir] -> $HOME/Repos/dotfiles/
* [dotfile-dir] -> $HOME/
* [shell-file] -> $HOME/.zshrc (Example)

## Initial setup
##### Create & Initialize Repo
* mkdir [git-repo-dir]
* cd [git-repo-dir]
* git init --bare

##### Add gitignore to home dir
touch .gitignore
echo [git-repo-dir] >> ~/.gitignore

##### Set dotfiles alias 
* alias [dotfile-alias]='/usr/bin/git --git-dir=[git-repo-dir] --work-tree=[dotfile-dir] '
  
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

> Shortcut \
> mkdir -p .config-backup && \
> config checkout 2]&1 | egrep "\s+\." | awk {'print $1'} | \
> xargs -I{} mv {} .config-backup/{}


## Usage    
* [dotfile-alias]  status
* [dotfile-alias]  add .zshrc
* [dotfile-alias]  commit -m ".zshrc added"
* [dotfile-alias]  push
* [dotfile-alias]  pull
* ...
