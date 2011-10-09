# zshrc
[[ -s "$HOME/.zshrc" ]] && . "$HOME/.zshrc"

# private
[[ -s "$HOME/.bash_private" ]] && . "$HOME/.bash_private"

# alias
[[ -s "$HOME/.bash_profile" ]] && . "$HOME/.bash_profile"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

echo `date`
