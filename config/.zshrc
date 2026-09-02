HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt autocd extendedglob
bindkey -v

zstyle :compinstall filename '/home/qn1/.zshrc'

autoload -Uz compinit
compinit

PS1="λ %n@%m %1~: "
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
