## .bash_profile
if [ -f ~/.bashrc ]; then 
. ~/.bashrc 
fi 

umask 022

export PATH=$HOME/.gem/ruby/1.8/bin:$PATH
export PATH=/opt/april/bin/:/opt/go/bin:$PATH
#export PATH=/opt/local/bin:$PATH
#export PATH=/opt/local/apache2/bin:$PATH
#export PATH=$PATH:/Developer/SDKs/flex_sdk_3/bin
export PATH=/usr/local/bin:$PATH
#export PATH=$PATH:/usr/local/php5/bin
#export PATH=$PATH:/usr/local/mysql/bin
#export PATH=$PATH:/usr/local/pgsql/bin
#export PATH=$PATH:/usr/local/plagger/bin
export PATH=$HOME/bin:$PATH
export PATH=$HOME/lib/flex_sdk_3/bin:$PATH
#export PATH=$PATH:${HOME}/.cpan/build/Module-Starter-1.44/bin

#for textmate bundle
export LC_TYPE=en_US.UTF-8

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
