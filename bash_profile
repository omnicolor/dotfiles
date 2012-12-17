# .bash_profile

# Automated committing to git.
alias pushit='git pull --rebase && phing test && git push'

# Make ls pretty.
alias ls='ls -FG --color'

# Use vi whenever possible.
export EDITOR=vi
set -i vi

# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=1000
export HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

export PATH=$PATH:$HOME/bin

# Get the aliases and functions.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Soup up the prompt.
if [ -f ~/.bash_prompt ]; then
    source .bash_prompt
fi
