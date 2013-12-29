# environment stuff
export PS1="%n@%m:%~%# "
export FPATH=~/.zsh:$FPATH
export PATH=~/sbin:/sbin:/usr/sbin:~/bin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/games:/usr/games
export LD_LIBRARY_PATH=~/lib:/usr/local/lib
export MANPATH=:~/man:~/share/man
export PKG_CONFIG_PATH=~/lib/pkgconfig
export EDITOR=vim

# zsh stuff
setopt menucomplete nobeep
zstyle :compinstall filename '/home/ian/.zshrc'
autoload -Uz compinit edit-command-line
compinit -u
zle -N edit-command-line
bindkey -v
bindkey -M vicmd v edit-command-line
bindkey '^[[Z' reverse-menu-complete
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# terminal stuff
stty -ixon -ixoff # disable ^S

# go stuff
export GOPATH=~/devel/go
export PATH=$GOPATH/bin:~/pkg/go/bin:$PATH
export CGO_CFLAGS=-I$HOME/include
export CGO_LDFLAGS=-L$HOME/lib
. ~/pkg/go/misc/zsh/go
. ~/devel/go/crosscompile.bash

# ruby stuff
export GEM_HOME=~/pkg/gems
export PATH=$GEM_HOME/bin:$PATH

# alias stuff
alias ls="ls -F --color=tty"
