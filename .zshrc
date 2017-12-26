#emacs key binding
bindkey -e

#FPATH
# this path is used for autoload 
export FPATH=${HOME}/local/share/zsh/5.0.7/functions:$FPATH

##standard compl
autoload -Uz compinit
compinit -u

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#Lang Setting
#export LANG=C
export LANG=ja_JP.UTF-8

# xterm 256 color
export TERM=xterm-256color

#cd -[tab]
setopt auto_pushd
setopt pushd_ignore_dups
#display detail if bad command is inputed.
setopt correct
#pack compli
setopt list_packed
setopt hist_ignore_all_dups
# ==== alias ====
case "${OSTYPE}" in 
darwin*)
    alias ls='ls -GF'
    alias ll='ls -GF'
    alias la='ls -GF'
    alias qview='qlmanage -p'
#    alias pip='pip install --install-option="--prefix=$HOME/local"'
    ;;
Linux*)
    alias ls='ls --color=auto'
    alias ll='ls -l --color=auto'
    alias la='ls -a --color=auto'
    ;;
esac


alias runsub="python ~/src/prog/support_jobs/runsub/runsub.py"
alias runmath="math -script"

# -- emacsclient --
alias f='emacsclient -nw'
alias kill-emacs="emacsclient -e '(kill-emacs)'"
#alias o='emacsclient $1 &'
export EDITOR='emacsclient -nw'
export VISUAL='emacsclient -nw'

# -- peco --
function ls_emacs() {
    emacsclient -nw "$(ls -F | grep -v / | peco)"
}
alias ff="ls_emacs"

function peco-history-selection() {
    local tac
    if which tac > /dev/null; then
	tac="tac"
    else
	tac="tail -r"
    fi
    BUFFER=`history -n 1 | eval $tac | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-note-dir-selection() {
    local tac
    if which tac > /dev/null; then
	tac="tac"
    else
	tac="tail -r"
    fi
    BUFFER=`find ~/note/daily -type d -depth 4 | eval $tac | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-note-dir-selection
bindkey '^R' peco-note-dir-selection
bindkey '^T' peco-note-dir-selection
alias nd=peco-note-dir-selection

# ==== any frame ====
# to install anyframe, type below command
##  mkdir ~/.zsh
##  cd ~/.zsh
##　git clone git@github.com:mollifier/anyframe.git
##

fpath=(~/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init
alias cdd=anyframe-widget-cdr

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs


# ===== PROMPT setting =====
#autoload -U promptinit
#promptinit
autoload colors
colors
local p_cdir="[%B%F{magenta}%~%f%b]"$'\n'
local p_info="%F{yellow}<%n@%m>%f"
local p_arrow="%(?,%F{green},%F{red})>%f"
PROMPT=" $p_cdir$p_arrow "
RPROMPT="$p_info"
PROMPT2="%B%{[31m%}%_#%{[m%}%b %% "
SPROMPT="%r is correct? [n,y,a,e]"

# ==== History ====
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history

# ==== prediction of command ====
#autoload predict-on
#predict-on


