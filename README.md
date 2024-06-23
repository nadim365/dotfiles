## Dotfile Repo (General purpose):

# Prerequisites:
    - GNU stow
    - Git

## Installation

First, check out the dotfiles repo in the $HOME directory using git

```
$ git clone https://github.com/nadim365/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create the symlinks to the files from the repo

```
$ stow .
```
