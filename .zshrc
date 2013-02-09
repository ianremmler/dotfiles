insert_prompt="%n@%m:%~%# "
command_prompt="%n@%m:%~: "
export PS1=$insert_prompt
export PATH=$HOME/sbin:/sbin:/usr/sbin:$HOME/bin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/games:/usr/games
export LD_LIBRARY_PATH=$HOME/lib:/usr/local/lib
export MANPATH=$HOME/man:$HOME/share/man:
export PKG_CONFIG_PATH=$HOME/lib/pkgconfig

export GOROOT=$HOME/pkg/go
export GOPATH=$HOME/devel/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export CGO_CFLAGS="-I$HOME/include"
export CGO_LDFLAGS="-L$HOME/lib"

export GEM_HOME=$HOME/pkg/gems
export PATH=$GEM_HOME/bin:$PATH

bindkey '^[[Z' reverse-menu-complete

alias ls="ls -F --color=tty"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/ian/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# End of lines added by compinstall
#
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt menucomplete nobeep
# End of lines configured by zsh-newuser-install

# vi mode stuff
bindkey -v
function zle-line-init zle-keymap-select {
	PS1="${${KEYMAP/vicmd/$command_prompt}/(main|viins)/$insert_prompt}"
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
