default: github/xfce-mirror/xfce4-terminal.rwkv.json

github/%.rwkv.json: github/%.git/
	{ git2jsonl/git2jsonl "$^"; git2jsonl/git2jsonl_base64 "$^"; } | sort --random-sort --random-source=/dev/zero > "$@" || { rm "$@"; false; }

github/%.git/:
	mkdir -p "$$(dirname "$*")"
	git clone --mirror https://github.com/"$*" "$@"
