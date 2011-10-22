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

setopt auto_list
setopt auto_menu
setopt auto_param_keys

# git completion
# /usr/local/etc/bash_completion.d/git-completion.bash
source ~/.git-completion.sh

# prompt
autoload -Uz vcs_info
precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}
#PROMPT="%{${fg[blue]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
#PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
#SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
#RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
RPROMPT="%{$fg[cyan]%}%1v%~%{${reset_color}%}"

PROMPT="%{${fg[cyan]}%}[%T %n@%m]%{${reset_color}%}%(!.#.$)%{${reset_color}%} "
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


# path
export PATH=$HOME/bin/vim/bin:$PATH
export PATH=$HOME/lib/android-sdk-mac_x86/tools:$PATH

# cpanm
export PERL_CPANM_OPT="--local-lib=~/lib/perl5"
