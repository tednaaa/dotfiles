if status is-interactive
	# Commands to run in interactive sessions can go here
end

source ~/.cargo/env.fish
source ~/.asdf/asdf.fish

starship init fish | source
fzf --fish | source

