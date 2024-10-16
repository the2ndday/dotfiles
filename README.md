# Jung's dotfiles

```
$ git clone https://github.com/the2ndday/dotfiles.git dotfiles
```

## .vimrc
```
$ ln -s ~/dotfiles/vimrc ~/.vimrc
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
in vim run `:PlugInstall`


## .alacritty.toml
```
$ git clone https://github.com/alacritty/alacritty-theme ~/dofiles/alacritty_themes
$ ln -s ~/dotfiles/alacritty.toml ~/.alacritty.toml
```

## .tmux.conf
```
$ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
```

## .inputrc
```
$ ln -s ~/dotfiles/inputrc ~/.inputrc
```

### Gitignore
```
$ ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
$ git config --global core.excludesfile '~/.gitignore_global'
```
