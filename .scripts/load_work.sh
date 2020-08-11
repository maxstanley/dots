#!/bin/bash
load_work() {
  /bin/bash /home/max/.screenlayout/work.sh

  # https://wiki.archlinux.org/index.php/i3#Save_and_restore_the_window_layout
  i3-msg "workspace 1; append_layout ~/.config/i3/workspace_work.json"

  (firefox-esr > /dev/null 2>&1  &)
  (whatsapp-nativefier-dark > /dev/null 2>&1 &)
  (teams > /dev/null 2>&1  &)
  (spotify > /dev/null 2>&1 &)
  (slack > /dev/null 2>&1 &)
}
