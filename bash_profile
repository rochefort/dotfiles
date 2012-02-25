## .bash_profile
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
if [ -f ~/.bash_private ]; then . ~/.bash_private; fi

umask 022

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/opt/april/bin/:/opt/go/bin:$PATH
export PATH=$HOME/bin/vim/bin:$PATH
export PATH=$HOME/lib/android-sdk-mac_x86/tools:$PATH
export PATH=$HOME/pear/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/lib/flex_sdk_3/bin:$PATH
export PATH=/opt/local/bin:$PATH
#export PATH=$PATH:${HOME}/.cpan/build/Module-Starter-1.44/bin

#for textmate bundle
export LC_TYPE=en_US.UTF-8

if [ -s /opt/local/apache2/bin ] ; then export PATH=/opt/local/apache2/bin:$PATH; fi

if [ -s $HOME/.rvm/scripts/rvm ] ; then . $HOME/.rvm/scripts/rvm ; fi

# after rvm sourced
if [ -f ~/.bash_alias ]; then . ~/.bash_alias ; fi

# git-completion.bash
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then . /usr/local/etc/bash_completion.d/git-completion.bash; fi
