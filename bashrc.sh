
## ==== Path setting ====
export PATH=/usr/local/bin/:$PATH
#export CPLUS_INCLUDE_PATH=~/local/include/:/usr/local/Cellar/python3/3.5.2_2/Frameworks/Python.framework/Versions/3.5/include/python3.5m/
export LIBRARY_PATH=~/local/lib:/usr/local/lib/:$LIBRARY_PATH
#export CPLUS_INCLUDE_PATH=~/local/include/:/usr/local/Cellar/python/2.7.12_2/Frameworks/Python.framework/Versions/2.7/include/python2.7/
export CPLUS_INCLUDE_PATH=/usr/local/include/:~/local/include/:$CPLUS_INCLUDE_PATH

## ==== alias ====
alias ls='ls --color=auto'
alias f='emacsclient -nw'
alias kill-emacs='emacsclient -e "(kill-emacs)"'

## ==== Prompt ====
#PS1='\[\e[36m\]\t \[\e[33m\]\w \[\e[37m\]\n'
PS1='\[\e[36m\]\t \[\e[33m\]\w \n \[\e[36m\]>>> \[\e[0m\]'


