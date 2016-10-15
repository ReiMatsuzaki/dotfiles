#emacs key binding
bindkey -e

#FPATH
# this path is used for autoload 
export FPATH=${HOME}/local/share/zsh/5.0.7/functions:$FPATH

##standard compl
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#Lang Setting
export LANG=C

# xterm 256 color
export TERM=xterm-256color

#cd -[tab]
setopt auto_pushd
#display detail if bad command is inputed.
setopt correct
#pack compli
setopt list_packed

# ==== alias ====
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

alias runsub="python ~/src/prog/support_jobs/runsub/runsub.py"
alias runmath="math -script"

# -- emacsclient --
alias f='emacsclient -nw'
#alias o='emacsclient $1 &'
export EDITOR='emacsclient -nw'
export VISUAL='emacsclient -nw'

# -- peco --
function ls_emacs() {
    emacsclient -nw "$(ls -F | grep -v / | peco)"
}
alias ff="ls_emacs"


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
setopt hist_ignore_dups
setopt share_history

# ==== prediction of command ====
#autoload predict-on
#predict-on


