all: dots config urxvt power

dots:
	for dotfile in ".alias" ".bash_logout" ".bash_profile" ".bashrc" ".env" ".scripts" ".tmux.conf" ".vimrc" ".xinitrc" ".Xresources" ".xscreensaver"; do \
		ln -sfn ${CURDIR}/$$dotfile ~/$$dotfile ; \
	done

config:
	for folder in "i3" "gtk-3.0" "mpv" "pcmanfm" "obmenu-generator" "openbox" "tint2" "alacritty" ; do \
		ln -sfn ${CURDIR}/.config/$$folder ~/.config/$$folder ; \
	done

urxvt:
	ln -sfn ${CURDIR}/xkr-clipboard /usr/lib64/urxvt/perl/
	
power:
	sudo ln -sfn ${CURDIR}/99-lowbat.rules /etc/udev/rules.d/99-lowbat.rules
