## .bashrc
date

PAGER=less 
export LESSCHARSET=utf-8
export CLICOLOR=1
export LSCOLORS=exFhCxDxbxegedabagacad


# for perl
export MODULE_STARTER_DIR=${HOME}/.module-starter

# for git
export GIT_EDITOR="mate -w"

#--------------------------------------
function showexit {
  local s=$?
  dispstatus "${PWD/\/home\/yusuke/~}"
  if [[ $s -eq 0 ]]; then return; fi
  echo "exit $s"
}
PROMPT_COMMAND=showexit

function dispstatus { 
  if [[ "$STY" ]]; then echo -en "¥033k$1¥033¥134"; fi 
}

function refe_utf8() {
  refe $@ | nkf -Ew | more
}

function wman() {
 url="man -w ${1} | sed 's#.*\(${1}.\)\([[:digit:]]\).*\$#http://developer.apple.com/documentation/Darwin/Reference/ManPages/man\2/\1\2.html#'"
 open `eval $url`
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
alias mysql=/opt/local/bin/mysql5
#alias plagger='plagger -c /usr/local/plagger/config.yaml'
alias refe='refe_utf8'
alias hatenabk='ruby ~/work/ruby/hatena/diary_backup/backup.rb'
alias vi='vim'
#--------------------------------------
