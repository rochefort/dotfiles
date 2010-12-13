## .bash_profile
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
if [ -f ~/.bash_private ]; then . ~/.bash_private; fi

umask 022

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.gem/ruby/1.8/bin:$PATH
export PATH=/opt/april/bin/:/opt/go/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/lib/flex_sdk_3/bin:$PATH
#export PATH=$PATH:${HOME}/.cpan/build/Module-Starter-1.44/bin

#for textmate bundle
export LC_TYPE=en_US.UTF-8

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then . $HOME/.rvm/scripts/rvm ; fi

# after rvm sourced
if [ -f ~/.bash_alias ]; then . ~/.bash_alias ; fi
