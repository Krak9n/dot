# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt autocd extendedglob
bindkey -v

session="seks"
tmux has-session -t $session 2>/dev/null
if [[ $? -ne 0 ]]; then
	TMUX=''
	tmux new-session -d -s $session
fi	

if [[ -z "$TMUX" ]]; then
	tmux attach -t $session
else
	tmux switch-client -t $session
fi

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/qn1/.zshrc'

autoload -Uz vcs_info compinit
precmd() {
	vcs_info
}
zstyle ':vcs_info:*' formats '(%b)'
compinit

PS1=" λ $vcs_info_msg_0_ %F{green}%n%f@%m %~> "
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias -- ls="ls --color"
alias -- l="ls -lahf"
alias sl="ls"
alias zeal='QTWEBENGINE_CHROMIUM_FLAGS="--disable-gpu" zeal'
