export PS1="%n@%m:%~%# "
PATH=$HOME/sbin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin
export PATH=$PATH:/usr/local/games:/usr/games
export LD_LIBRARY_PATH=$HOME/lib:/usr/local/lib
export MANPATH=$HOME/man:$HOME/share/man
export PKG_CONFIG_PATH=$HOME/lib/pkgconfig

export GOROOT=$HOME/pkg/go
export GOPATH=$HOME/devel/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export GEM_HOME=$HOME/pkg/gems
export PATH=$GEM_HOME/bin:$PATH

bindkey '^[[Z' reverse-menu-complete

alias ls="ls -F --color=tty"

HISTFILE=~/.zsh-history
HISTSIZE=1000
SAVEHIST=1000
setopt menucomplete nobeep

# The following lines were added by compinstall
zstyle :compinstall filename '/home/ian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
