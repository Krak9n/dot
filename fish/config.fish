if status is-interactive
    # Commands to run in interactive sessions can go here
end


alias l="ls -lahf"
alias sl="ls"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/qn1/.ghcup/bin $PATH # ghcup-env
