## .bash_profile
if [ -f ~/.bashrc ]; then 
. ~/.bashrc 
fi 

umask 022

export PATH=/opt/april/bin/:/opt/go/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/apache2/bin:$PATH
#export PATH=$PATH:/Developer/SDKs/flex_sdk_3/bin
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/lib/flex_sdk_3/bin:$PATH
#export PATH=$PATH:${HOME}/.cpan/build/Module-Starter-1.44/bin
export MANPATH=$MANPATH:/opt/local/man
#export MANPATH=/usr/local/man:$MANPATH

#for textmate bundle
export LC_TYPE=en_US.UTF-8
