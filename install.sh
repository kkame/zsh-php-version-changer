#!/bin/zsh

if [ -f ~/.zsh-php-version-changer/pvc.zsh ]; then
  echo "already install";
else
  git clone https://github.com/kkame/zsh-php-version-changer.git ~/.zsh-php-version-changer
  echo "[ -f ~/.zsh-php-version-changer/pvc.zsh ] && source ~/.zsh-php-version-changer/pvc.zsh" >> ~/.zshrc
fi
