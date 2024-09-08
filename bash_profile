# .bash_profile

# Warn before overwriting files.
alias mv='mv -i'
alias cp='cp -i'

# Pull remote git changes, clean up.
alias clean='git p && git prune && git gc && git remote prune origin'

# Use vim whenever possible.
export EDITOR=vim

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

test -e "${HOME}/.git-completion.bash" && source "${HOME}/.git-completion.bash"
