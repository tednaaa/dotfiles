if status is-interactive
	# Commands to run in interactive sessions can go here
end

starship init fish | source
fzf --fish | source

source ~/.asdf/asdf.fish
source "$HOME/.cargo/env.fish"

set -x XDG_CONFIG_HOME $HOME/.config
