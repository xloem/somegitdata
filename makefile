default: github.com/xfce-mirror/xfce4-terminal.rwkv.json

extra: default

%.rwkv.json: %.git/
	{ git2jsonl/git2jsonl "$^"; git2jsonl/git2jsonl_base64 "$^"; } | sort --random-sort --random-source=/dev/zero > "$@" || { rm "$@"; false; }
	rm -rf "$<"

%.git/:
	mkdir -p "$$(dirname "$*")"
	git clone --mirror https://"$*" "$@"
