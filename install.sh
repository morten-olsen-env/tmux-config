if [ -f ~/.tmux.conf ] || [ -d ~/.tmux ]; then
  read -p "a tmux config is already installed, do you wish to override it? [y/N]" yn
  case $yn in
    [Yy]* );;
    * ) echo "exiting"; exit 1;;
  esac
fi

echo 'installing'
rm -f ~/.tmux.conf
rm -f -R ~/.tmux
if [ ! -f ~/.tmux.conf ] && [ ! -d ~/.tmux ]; then
  ln -s $(pwd)/tmux.conf ~/.tmux.conf
  ln -s $(pwd)/ ~/.tmux
  if [ -f ~/.tmux.conf ] && [ -d ~/.tmux ]; then
    echo "tmux config installed"
    echo "setting up modules"
    git submodule init
    git submodule update
    git submodule update --init --recursive
    exit 0
  else
    echo "could not install the new config"
    exit 2
  fi
else
  echo 'could not remove previous tmux configuration'
  exit 2
fi
