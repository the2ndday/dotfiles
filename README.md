# Jung's dotfiles

```
$ git clone https://github.com/the2ndday/dotfiles.git dotfiles
```

## .vimrc
```
$ ln -s ~/dotfiles/vimrc ~/.vimrc
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
in vim run `:PlugInstall`

## .tmux.conf
`$ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf`

## .inputrc
`$ ln -s ~/dotfiles/inputrc ~/.inputrc`

## .gitignore
```
$ ln -s ~/dotfiles/gitignore ~/.gitignore`
$ git config --global core.excludesfile '~/.gitignore'
```
