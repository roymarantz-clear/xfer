# .bashrc
# -*- shell-script -*-

[ -f /etc/bashrc ] && source /etc/bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#Bind commands
## bind 'set completion-ignore-case on'
## bind 'set show-all-if-ambiguous on'

#Exports and things
## export HISTIGNORE="&:ls:exit:lo:ll:history"
export HISTIGNORE="exit::history"
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

shopt -s checkwinsize
# complete on a single <tab>
set show-all-if-ambiguous on
#set show-all-if-unmodified on

function maybe_source {
    [ -r "$1" ] && source "$1"
}

maybe_source /usr/local/etc/bash_completion

[[ -x $HOME/bin/sssh ]] && type -t _ssh >/dev/null && complete -F _ssh sssh

maybe_source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash

#Display a PDF of a given man page
if type -t pstopdf >/dev/null; then
    pdfman () {
        man -t "$@" | pstopdf -i -o /tmp/"$1".pdf && open /tmp/"$1".pdf
    }
fi

#Aliases that do things
## alias ip='ipconfig getifaddr en0'
## alias ipext='curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*''
## alias ll='ls -AlhG'
alias ls='ls -F'
alias ll='ls -l'
## alias h='history'
alias hg='history | grep'
## alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias psgrep='ps -ef | grep -v grep | grep'
alias null='cat >/dev/null'
alias Z=suspend
alias uncolor='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias whatismyip='curl http://neuropunks.org/~cryptographrix/ 2>/dev/null && echo'

[[ -r ~/aws_aliases ]] && source ~/aws_aliases

if [[ $SHLVL == 1 ]]; then
   PS1='\h \w \$ '
else
   PS1='$SHLVL \h \w \$ '
fi

complete -C /usr/local/bin/vault vault

# on Mac OS x we brew install bash to get version 4.1+ so we need this
# as per https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-macos
#export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
##[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if type -t brew >/dev/null; then
    [[ -f $(brew --prefix)/etc/bash_completion ]] && . "$(brew --prefix)"/etc/bash_completion
fi

maybe_source "$HOME/k8s_aliases"

complete -C /usr/local/bin/packer packer

### what is this???  serverless
### what installed it???
# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

maybe_source  ~/.fzf.bash
maybe_source "$HOME/teleport_aliases"
maybe_source "$HOME/clear-k8s.sh"

[ -f "/Users/roy.marantz/.ghcup/env" ] && source "/Users/roy.marantz/.ghcup/env" # ghcup-env
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
