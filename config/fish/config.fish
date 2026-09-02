if not set -q TMUX
    set -g TMUX tmux new-session -d -s fish
    eval $TMUX
    tmux attach-session -d -t fish
end

abbr -a l ls -lahf
abbr -a sl ls

set -Ux RUST_BACKTRACE 1
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/qn1/.ghcup/bin $PATH # ghcup-env
