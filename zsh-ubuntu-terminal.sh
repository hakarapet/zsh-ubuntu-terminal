#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ $1 = "revert" ]; then
    echo "${GREEN}Revert back to default shell"
    sudo chsh -s /bin/bash
    echo "${RED}Done!${NC}"
else

  echo "${GREEN}Updates the packages";
  sudo apt-get update;
  sudo apt upgrade;

  echo "${GREEN}Installs zsh";
  sudo apt install zsh;

  echo "${GREEN}Installs powerline and fonts-powerline";
  sudo apt-get install powerline fonts-powerline;

  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh;
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc;

  echo "${GREEN}Sets zsh as a default terminal";
  chsh -s /bin/zsh;

  echo "${GREEN}Installs zsh syntax highlighting";
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
  echo "${GREEN}source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

  echo "${RED}Done!${NC}"

fi