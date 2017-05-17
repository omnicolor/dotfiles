# .bash_profile

# Warn before overwriting files.
alias mv='mv -i'
alias cp='cp -i'

# Use vim whenever possible.
export EDITOR=vim
set -i vim

# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=1000
export HISTFILESIZE=2000

# Append to the history file, don't overwrite it.
shopt -s histappend

# Get the aliases and functions.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Soup up the prompt.
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi
