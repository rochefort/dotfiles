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
#color->  \[\033 // m\]
#export PS1="[\u@\h \t \W]\$ "
#export PS1="[\u \t \W]\$ "
#export PS1="\[\033[0;33m\]\h:\W \u\$"

# for perl
export MODULE_STARTER_DIR=${HOME}/.module-starter

# for git
export GIT_EDITOR="vim"
#export GIT_EDITOR="mate -w"

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
#function u() {
#    cd ./$(git rev-parse --show-cdup)
#    if [ $# = 1 ]; then
#        cd $1
#    fi
#}
#--------------------------------------
