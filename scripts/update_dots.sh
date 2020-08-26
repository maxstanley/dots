#!/bin/bash
update_dots() {
  git fetch $HOME/.dots/
  git pull $HOME/.dots/

  $HOME/.dots/link_files.sh
}
