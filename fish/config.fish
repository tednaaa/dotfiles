if status is-interactive
	# Commands to run in interactive sessions can go here
end

source ~/.cargo/env.fish
source ~/.asdf/asdf.fish

starship init fish | source

set -gx EDITOR "zed --wait"

# pnpm
set -gx PNPM_HOME "/home/tedna/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
