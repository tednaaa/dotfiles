if status is-interactive
	# Commands to run in interactive sessions can go here
end

source ~/.cargo/env.fish
source ~/.asdf/asdf.fish
source ~/.asdf/plugins/golang/set-env.fish

set -x ASDF_GOLANG_MOD_VERSION_ENABLED true

starship init fish | source
fzf --fish | source

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

