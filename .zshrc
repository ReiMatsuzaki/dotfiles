#emacs key binding
bindkey -e

#FPATH
# this path is used for autoload 
export FPATH=${HOME}/local/share/zsh/5.0.7/functions:$FPATH

#PATH
# this path is used for autoload 
export PATH=${HOME}/local/bin:$PATH
export PATH=${HOME}/bin:$PATH

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
#prevent error for []
setopt nonomatch
# ==== alias ====
alias ls='ls --color=auto'
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

# -- for fortran code --
alias ag-fsub='(){ ag "SUBROUTINE $1"}'
alias ag-ffunc='(){ ag "FUNCTION $1"}'

# -- emacsclient --
alias ff='emacsclient'
alias f='emacsclient -nw'
alias kill-emacs="emacsclient -e '(kill-emacs)'"
#alias o='emacsclient $1 &'
export EDITOR='emacsclient -nw'
export VISUAL='emacsclient -nw'

# -- peco --
function ls_emacs() {
    emacsclient -nw "$(ls -F | grep -v / | peco)"
}
#alias ff="ls_emacs"
function git_ls_emacs() {
    emacsclient -nw "$(git ls-files | peco)$"
}
alias fg="git_ls_emacs"

function peco-history-selection() {
    local tac
    if which tac > /dev/null; then
	tac="tac"
    else
	tac="tail -r"
    fi
    BUFFER=`\history -n 1 | eval $tac | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ===== PROMPT setting =====
#autoload -U promptinit
#promptinit
autoload colors
colors
if [[ -n "${SSH_CONNECTION}" ]]; then
    p_info="%B%F{magenta}%n@%m%f%b:"
else
    p_info="%B%F{cyan}%n@%m%f%b:"
fi
local p_cdir="[%B%F{yellow}%~%f%b]"$'\n'
local p_arrow="%B%(?,%F{green},%F{red})>%f%b"

PROMPT="$p_info$p_cdir$p_arrow "
#RPROMPT="$p_info"
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


