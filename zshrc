# color
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ''
autoload colors
colors

# completion
autoload -U compinit
compinit

# auto completion
#autoload predict-on
#predict-on

export EDITOR=mate

setopt auto_list
setopt auto_menu
setopt auto_param_keys

# git completion
# /usr/local/etc/bash_completion.d/git-completion.bash
source ~/.git-completion.sh

# prompt
#autoload -Uz vcs_info
#zstyle ':vcs_info:git:*' stagedstr "+"
#zstyle ':vcs_info:git:*' unstagedstr "-" 
#zstyle ':vcs_info:git:*' formats ' %b%c%u'
precmd(){
    # display path to title bar
    echo -n "\e]2;$(pwd)\a"
    #psvar=()
    #LANG=en_US.UTF-8 vcs_info
    #psvar[1]=${vcs_info_msg_0_}
}

# http://d.hatena.ne.jp/uasi/20091025/1256458798
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then return; fi
  name=`git branch 2> /dev/null | grep '^\*' | cut -b 3-`
  if [[ -z $name ]]; then return; fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=%B%F{red}
  else
    color=%F{red}
  fi
  echo "$color($name$action)%f%b"
}
function current_dirname {
  echo `basename $(pwd)`
}
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

#PROMPT="%{${fg[blue]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
#PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
#SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
#RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
#RPROMPT="%{$fg[cyan]%}%1v%~%{${reset_color}%}"

#RPROMPT='[`rprompt-git-current-branch`%~]'
PROMPT='%b%F{cyan}[%T `current_dirname`]%f%b`rprompt-git-current-branch`%b%F{cyan}%f%b$ '
#PROMPT="%{${fg[cyan]}%}[%T`rprompt-git-current-branch`]%{${reset_color}%}%(!.#.$)%{${reset_color}%} "
#PROMPT="%{${fg[cyan]}%}[%T %~%1v]%{${reset_color}%}%(!.#.$)%{${reset_color}%} "
#PROMPT=$'%2F%n@%m%f %3F%~%f %1v\n%(!.#.$) '
#PROMPT=$'%2F%n@%m%f %3F%~%f%1v %# '
#PROMPT="%/%% "
#PROMPT2="%_%% "
#SPROMPT="%r is correct? [n,y,a,e]: "

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt extended_history
setopt append_history
setopt share_history
setopt hist_no_store
setopt hist_reduce_blanks

# core size
limit coredumpsize 0

# other configuration
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep
setopt nobeep

#bindkey -v
bindkey -e
bindkey "^F" forward-word
bindkey "^B" backward-word


# cpanm
export PERL_CPANM_OPT="--local-lib=~/lib/perl5"


# function
d() { open dict:///"$@" ;say "$@" }
git() { hub "$@" }

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

