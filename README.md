# Setup dotfiles

## Create symlinks
```sh
# dotfiles
DOTFILES_PATH=`pwd`
DOTFILES=(aliases gitignore_global inputrc irbrc railsrc sqliterc tigrc vimrc zshrc_custom)

for dotfile in ${DOTFILES[@]}; do
  ln -s "${DOTFILES_PATH}/${dotfile}" "${HOME}/.${dotfile}"
done

# config directory
for confDir in `ls config`; do
  ln -s "${DOTFILES_PATH}/config/${confDir}" "${HOME}/.config/${confDir}"
done

# bundle directory
mkdir "${HOME}/.bundle"
ln -s "${DOTFILES_PATH}/bundle/config" "${HOME}/.bundle/config"
```

## Setup Vim
```sh
DOTFILES_PATH=`pwd`
ln -s "${DOTFILES_PATH}/vim/snippets" "${HOME}/.vim/snippets"
ln -s "${DOTFILES_PATH}/vim/templates" "${HOME}/.vim/templates"

cd $HOME
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Setup git
```sh
git config --global core.excludesfile ~/.gitignore_global
```

## Setup zsh
Add .zshrc
```sh
if [[ -s "${HOME}/.zshrc_custom" ]]; then
  source "${HOME}/.zshrc_custom"
fi
```