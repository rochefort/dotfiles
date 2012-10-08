load(){
  [[ -f $1 ]] && source $1
}
load $HOME/.bash_private
load $HOME/.bash_alias
#load $HOME/.rvm/scripts/rvm
load $HOME/.nvm/nvm.sh
load /usr/local/share/zsh/site-functions
echo `date`

