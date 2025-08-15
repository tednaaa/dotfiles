#!/usr/bin/fish

set -l ignores \
	'.git/' \
	'node_modules/' \
	'pnpm-lock.yaml' \
	'package-lock.json' \
	'dist/' \
	'build/'

set -l ignore_flags
for p in $ignores
	set -a ignore_flags --glob "!$p"
end
set -l ignore_str (string join ' ' $ignore_flags)

set -l reload_cmd '
	set -l q {q}
	if test -n "$q"
		rg -i --hidden --no-heading --line-number --color=always '"$ignore_str"' "$q"
	else
		printf ""
	end
'

set -l preview_cmd '
	set -l file {1}
	set -l line {2}
	set -l q {q}
	set -l start (math "max(1, $line-10)")
	set -l end (math $line+10)
	if test -n "$q"
		bat --color=always --style=plain --line-range "$start":"$end" "$file" \
		| rg -i --color=always --colors "match:bg:yellow" --colors "match:fg:black" --passthru -- "$q"
	else
		bat --color=always --style=plain --line-range "$start":"$end" "$file"
	end
'

set -l match (
	printf "" | fzf --ansi --disabled --prompt 'rg> ' \
		--delimiter : --nth=3.. \
		--bind "change:reload:$reload_cmd" \
		--preview "$preview_cmd" \
		--preview-window=down:wrap:70%
)

if test -n "$match"
	set -l file (echo $match | cut -d: -f1)
	set -l line (echo $match | cut -d: -f2)
	zed "$file":"$line"
end
