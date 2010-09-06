## .bashrc
#ulimit -c 0
date
#export LANG=ja_JP.UTF-8
PAGER=less 
export LESSCHARSET=utf-8

export CLICOLOR=1

export LSCOLORS=exFhCxDxbxegedabagacad
#export LSCOLORS=cxFhCxDxbxegedabagacad
#export LSCOLORS=exFhCxDxbxegedabagacad
#export LSCOLORS=fxFhCxDxbxegedabagacad
#export LSCOLORS=fxFxCxDxbxegedabagacad
#export LSCOLORS=ExFxCxDxBxegedabagacad

# for postgres
#export POSTGRES_HOME=/usr/local/pgsql
#export PGLIB=$POSTGRES_HOME/lib
#export PGDATA=$POSTGRES_HOME/data
#export MANPATH=$POSTGRES_HOME/man:$MANPATH

# for cvs
#export CVSROOT=${HOME}/cvsroot

#default(\h:\w \u\$)
#export PS1="[\u@\h \t \W]\$ "
#export PS1="[\u \t \W]\$ "

# for perl
export MODULE_STARTER_DIR=${HOME}/.module-starter

# for git
export GIT_EDITOR="mate -w"

#--------------------------------------
function showexit {
  local s=$?
  if [[ $s -eq 0 ]]; then return; fi
  echo "exit $s"
}
PROMPT_COMMAND=showexit

function refe_utf8() {
  refe $@ | nkf -Ew | more
}
function wman() {
 url="man -w ${1} | sed 's#.*\(${1}.\)\([[:digit:]]\).*\$#http://developer.apple.com/documentation/Darwin/Reference/ManPages/man\2/\1\2.html#'"
 open `eval $url`
}
function mountAndroid {
  hdiutil attach ~/lib/android.dmg  -mountpoint /Volumes/android; 
}
#--------------------------------------
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -vF'
alias ll='ls -al'
alias l='ls'
alias h='history'
alias fcd='cd `fcd.sh`'
alias memo='more ~/memo.txt'
alias rhelp='open ~/Dropbox/doc/ruby_help/ruby-refm-1.8.7-20100729.chm'
#alias plagger='plagger -c /usr/local/plagger/config.yaml'
#alias refe='refe_utf8'
alias refe='refe_utf8'
alias hatenabk='ruby ~/work/ruby/hatena/diary_backup/backup.rb'
alias vi='vim'
alias sgi32="sudo env ARCHFLAGS='-Os -arch i386 -fno-common' gem install --no-ri --no-rdoc"
alias sgi64="sudo env ARCHFLAGS='-Os -arch x86_64 -fno-common' gem install --no-ri --no-rdoc"
alias sgi="sgi64"
#--------------------------------------
