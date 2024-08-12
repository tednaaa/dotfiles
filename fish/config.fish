if status is-interactive
	# Commands to run in interactive sessions can go here
end
set -x XDG_CONFIG_HOME $HOME/.config

source ~/.asdf/asdf.fish
source "$HOME/.cargo/env.fish"
source ~/.asdf/plugins/golang/set-env.fish

set -x ASDF_GOLANG_MOD_VERSION_ENABLED true

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

starship init fish | source
fzf --fish | source

