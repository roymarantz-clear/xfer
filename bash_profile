# stuff done only once in top level shell

. ~/.bashrc

[[ -r "$HOME/.bash_path" ]] && source "$HOME/.bash_path"

# must do before interactive shell test
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# if not an interactive shell, we are done
[ -z "$PS1" ] && return

## [[ -x /usr/bin/emacs ]] && export EDITOR="/usr/bin/emacs"
## [[ -x "$HOME/bin/emacs" ]] && export EDITOR="$HOME/bin/emacs"
EDITOR=`which emacs`
if [[ -x $EDITOR ]]; then
    export EDITOR
else
    unset EDITOR
fi

if [[ -x /usr/bin/less ]]; then
   export PAGER=/usr/bin/less
   export LESS='eiMqRwX'
fi
[[ -x $HOME/go ]] && export GOPATH="$HOME/go"

[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env