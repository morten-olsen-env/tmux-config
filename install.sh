#!/bin/bash
if [ -f ~/.tmux.conf ]; then
  read -p "a tmix config is already installed, do you wish to override it? [y/N]" yn
  case $yn in
    [Yy]* );;
    * ) echo "exiting"; exit 1;;
  esac
fi

echo 'installing'
rm -f ~/.tmux.conf
if [ ! -f ~/.tmux.conf ]; then
  ln -s $(pwd)/tmux.conf ~/.tmux.conf
  if [ -f ~/.tmux.conf ]; then
    echo "tmux config installed"
    exit 0
  else
    echo "could not install the new config"
    exit 2
  fi
else
  echo 'could not remove previous vim configuration'
  exit 2
fi
