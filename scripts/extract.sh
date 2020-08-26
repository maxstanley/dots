#!/bin/bash
# Source: https://wiki.archlinux.org/index.php/Bash/Functions
extract() {
	local e=0 i c
	for i; do
		if [[ -f $i && -r $i ]]; then
			c=
			case $i in
				*.tar.bz2) c='tar xjf'    ;;
				*.tar.gz)  c='tar xzf'    ;;
				*.tar.xz)  c='tar xf'     ;;
				*.bz2)     c='bunzip2'    ;;
				*.gz)      c='gunzip'     ;;
				*.tar)     c='tar xf'     ;;
				*.tbz2)    c='tar xjf'    ;;
				*.tgz)     c='tar xzf'    ;;
				*.7z)      c='7z x'       ;;
				*.Z)       c='uncompress' ;;
				*.exe)     c='cabextract' ;;
				*.rar)     c='unrar x'    ;;
				*.xz)      c='unxz'       ;;
				*.zip)     c='unzip'      ;;
				*)     echo "$0: cannot extract \`$i': Unrecognized file extension" >&2; e=1 ;;
			esac
				[ $c ] && command $c "$i"
		else
			echo "$0: cannot extract \`$i': File is unreadable" >&2; e=2
		fi	
	done
	return $e
}
