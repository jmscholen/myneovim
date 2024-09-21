#!/bin/bash

CONFIG_DIR=$(dirname "$MYVIMRC")

USER_LSP="$CONFIG_DIR/lua/user/lsp.lua"
if test -f "$USER_LSP"; then
  rm "$USER_LSP"
  echo "$USER_LSP removed successfully..."
fi

TMUX=~/.tmux.conf
if test -f "$TMUX"; then
  rm $TMUX
  echo "$TMUX Removed successfully..."
fi

ALACRITTY=~/.config/alacritty/alacritty.yml
if test -f "$ALACRITTY"; then
  rm $ALACRITTY
  echo "$ALACRITTY Removed successfully..."
fi
