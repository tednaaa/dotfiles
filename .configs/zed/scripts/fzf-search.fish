#!/usr/bin/fish

set match (rg --no-heading --line-number --color=always "" \
	| fzf --ansi --delimiter : \
		--preview 'set -l line (echo {2}); \
							 set -l start (math "max(1, $line-10)"); \
							 set -l end (math $line+10); \
							 bat --color=always --style=plain --line-range "$start":"$end" --highlight-line "$line" {1}' \
		--preview-window=down:wrap:70%)

if test -n "$match"
	set file (echo $match | cut -d: -f1)
	set line (echo $match | cut -d: -f2)
	zed "$file":"$line"
end
