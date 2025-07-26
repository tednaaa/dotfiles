if uwsm check may-start
	exec uwsm start hyprland-uwsm.desktop
end


if status is-interactive
	# Commands to run in interactive sessions can go here
end

alias ls="eza --all --icons -l --no-user -o"

set -gx EDITOR "zed --wait"

set -gx PNPM_HOME "/home/tedna/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

source ~/.cargo/env.fish
~/.local/bin/mise activate fish | source
starship init fish | source
zoxide init fish | source
