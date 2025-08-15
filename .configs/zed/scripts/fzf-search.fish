#!/usr/bin/fish

set match (rg --no-heading --line-number --color=always "" \
	| fzf --ansi --delimiter : \
		--preview 'set -l file {1}; \
					set -l line {2}; \
					set -l query {q}; \
					set -l start (math "max(1, $line-10)"); \
					set -l end (math $line+10); \
					bat --color=always --style=plain --line-range "$start":"$end" "$file" | rg --color=always --colors "match:bg:yellow" --colors "match:fg:black" --passthru "$query" || bat --color=always --style=plain --line-range "$start":"$end" "$file"' \
		--preview-window=down:wrap:70%)

if test -n "$match"
	set file (echo $match | cut -d: -f1)
	set line (echo $match | cut -d: -f2)
	zed "$file":"$line"
end
