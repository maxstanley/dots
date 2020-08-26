#!/bin/bash
update_dots() {
  git fetch $HOME/.dots/
  git pull $HOME/.dots/
}
