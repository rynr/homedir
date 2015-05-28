#!/bin/bash

echo "Checking for sudo permission"
if sudo -l; then
  echo -e "Sudo access is \e[32mavailable\033[0m"
else
  echo -e "Sudo access is \e[31mnot available\033[0m"
  echo "Please make sure sudo access is available .. exiting"
  exit 1
fi

echo "Checking (and installing) some packages"
for package in openssh-server; do
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

