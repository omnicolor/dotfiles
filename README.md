# Dotfiles

My dotfiles and useful (at least to me) environment stuff. Tested to mostly-work
right out of the box on both a Mac and a Ubuntu machine. Running setup.sh will
link from your home directory to the files in the current directory, backing up
the original files when they already exist.

Bash_profile adds a few generic aliases for things like mv and cp to not
overwrite files without asking, and will run your .bashrc file (if you have
one). I use my .bash_profile to hold things that I need on any system I'm on.
It also loads git-completion for Bash and soups up my Bash prompt. Then things
for a system gets put in .bashrc.

My Bash prompt is meant for developers that use git. The prompt shows the name
of the current git repo followed by three numbers and the branch name (if not
master). The numbers are the number of changed but unstaged files, the number
of commits the current branch is ahead of where ever it branched from, and the
number of commits it is behind where ever it branched from. It will also
include the current hostname if you're SSHed in from another system. It won't
show the hostname if you're local.

My gitconfig sets things up with some git aliases I like such as signing commits
and merges by default and adding shorter commands for common actions. It also
adds some pretty log aliases.

Finally, it sets up my Vim with my .vimrc file and the plugins I like.
