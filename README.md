# Jung's dotfiles

---

## Install

### Vim Config
```
$ git clone https://github.com/the2ndday/dotfiles.git dotfiles
$ ln -s ~/dotfiles/vimrc ~/.vimrc
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
in vim run `:PlugInstall`

### Tmux Config
`$ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf`

### Terminal Input Config
`$ ln -s ~/dotfiles/inputrc ~/.inputrc`

---

## Extra
Too ignore untracked files in submodules
```
git config --global core.excludesfile '~/.cvsignore'
echo tags >> ~/.cvsignore
echo .netrwhist >> ~/.cvsignore
```
