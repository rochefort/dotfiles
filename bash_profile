## .bash_profile

umask 022
export PATH=$HOME/lib/android-sdk-mac_x86/tools:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/opt/april/bin/:/opt/go/bin:$PATH
export PATH=$HOME/bin/vim/bin:$PATH
export PATH=$HOME/pear/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/lib/flex_sdk_3/bin:$PATH
export PATH=/opt/local/bin:$PATH
#export PATH=$PATH:${HOME}/.cpan/build/Module-Starter-1.44/bin

#for textmate bundle
export LC_TYPE=en_US.UTF-8

# load environment files
load(){
  [[ -f $1 ]] && source $1
}
load ~/.bashrc
load ~/.bash_private
load /opt/local/apache2/bin
load $HOME/.rvm/scripts/rvm
load /usr/local/etc/bash_completion.d/git-completion.bash # git-completion.bash
load $HOME/.rvm/script/rvm
load ~/.bash_alias          # if you use pushd/popd, you should load after rvm sourced

