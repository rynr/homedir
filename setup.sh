#!/bin/bash

PACKAGES="openssh-server git gitk vim"
VIMPLUGINS="https://github.com/tpope/vim-fugitive                        \
            https://github.com/tpope/vim-rails"

echo "Checking for sudo permission"
if sudo -l; then
  echo -e "Sudo access is \e[32mavailable\033[0m"
else
  echo -e "Sudo access is \e[31mnot available\033[0m"
  echo "Please make sure sudo access is available .. exiting"
  exit 1
fi

echo "Checking (and installing) some packages"
for package in $PACKAGES; do
  echo -n "Checking for $package .."
  if dpkg -V $package >>/dev/null 2>&1; then
    echo -e " \e[32mOK\033[0m"
  else
    echo -n " installing .."
    if sudo -n apt-get -q -y install $package; then
      echo -e " \e[32mOK\033[0m"
    else
      echo -e " \e[31mfail\033[0m"
    fi
  fi
done

# Configure vim
echo "Checking (and installing) vim packages"
if [ ! -d $HOME/.vim/bundle   ]; then mkdir -p $HOME/.vim/bundle; fi
if [ ! -d $HOME/.vim/autoload ]; then mkdir -p $HOME/.vim/autoload; fi
echo -e -n "Checking for pathogen .."
if [ -f $HOME/.vim/autoload/pathogen.vim ]; then
  echo -e " \e[32mOK\033[0m"
else
  echo -n " installing .."
  if curl -s https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > $HOME/.vim/autoload/pathogen.vim; then
    echo -e " \e[32mOK\033[0m"
  else
    echo -e " \e[31mfail\033[0m"
  fi
fi
for source in $VIMPLUGINS; do
  package=`basename $source`
  echo -e -n "Checking for $package .."
  if [ -d $HOME/.vim/bundle/$package ]; then
    echo -e " \e[32mOK\033[0m"
  else
    echo -n " installing .."
    if git clone -q $source $HOME/.vim/bundle/$package; then
      echo -e " \e[32mOK\033[0m"
    else
      echo -e " \e[31mfail\033[0m"
    fi
  fi
done

