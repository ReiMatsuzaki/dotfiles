alias f='emacsclient -nw -a ""'
#alias f='emacsclient -nw --socket-name /tmp/emacs501/server'
#alias f='emacs -nw'
alias kill-emacs='emacsclient -e "(kill-emacs)"'

set PY_PATH /usr/local/Cellar/python3/3.5.2_2/Frameworks/Python.framework/Versions/3.5/include/python3.5m/

set -x LIBRARY_PATH ~/local/lib 
set -x CPLUS_INCLUDE_PATH ~/local/include/ /usr/local/ {$PY_PATH}
#set -x CPLUS_INCLUDE_PATH ~/local/include/ 
