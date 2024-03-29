#!usr//bin/env bash
:<<'info'
shellnotes - install.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

VER_TO_INSTALL=4.0 #This is used when updating, it will be changed in every new update
if [ -e ~/.shellnotes/.shellnotes.sh ]; then
   echo "Shellnotes is already installed."
   echo "If you want to update, please run 'update.sh'."
   cd ~/.shellnotes/util/exec
   ./ifailed

else
   mkdir ~/.shellnotes
   mv docs ~/.shellnotes/
   mv util ~/.shellnotes/
   mv def ~/.shellnotes/
   mv logs ~/.shellnotes/
   mv ver ~/.shellnotes/
   mv sne ~/.shellnotes/
   mv image ~/.shellnotes/
   mv shellnotes.sh ~/.shellnotes/.shellnotes.sh
   mv $0 ~/.shellnotes/
   mv set_defaults.sh ~/.shellnotes/
   mv bash_update.sh ~/.shellnotes/
   mv uninstall.sh ~/.shellnotes/
   mv update.sh ~/.shellnotes/
   if [ -f ./whatsnew.sh ]; then
      mv whatsnew.sh ~/.shellnotes/whatsnew.sh
      mv whatsnew.txt ~/.shellnotes/whatsnew.txt
   fi
   rm -rf .gitignore
   rm -rf ./README.md
   rm -rf ./SECURITY.md
   sudo mkdir /usr/local/man/man1 2>/dev/null
   sudo cp ~/.shellnotes/docs/manpages/* /usr/local/man/man1/
   sudo gzip -f /usr/local/man/man1/*.1
   sudo mandb >/dev/null
   sudo apt-get install xclip

   sudo apt install python3 -y
   sudo apt install python3-pip -y
   pip install pathlib
   
   sudo apt update
   sudo chmod a+x ~/.shellnotes/util/exec/*
   sudo chmod +x ~/.shellnotes/.shellnotes.sh

   clear
   echo "Installing Shellnotes Note Editor (SnE)..."

   echo "DEFAULT_PATH=$HOME" > ~/.shellnotes/sne/.env
   #Install dependencies
   pip install -r ~/.shellnotes/sne/requirements.txt
   sudo apt-get install espeak -y
   


   echo "$VER_TO_INSTALL" > ~/.shellnotes/ver/.shellnotes_version

   if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
      echo "source ~/.shellnotes/.shellnotes.sh" >> ~/.zshrc
      sed -i '1 i\#!/bin/zsh' ~/.shellnotes/.shellnotes.sh
      clear
      echo "Shellnotes was successfully istalled"
      echo "------------------------------------"
      echo "Please do 'source ~/.zshrc' and reopen your terminal to start using shellnotes."
      echo "have fun taking notes!"
   elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
      echo "source ~/.shellnotes/.shellnotes.sh" >> ~/.bashrc
      sed -i '1 i\#!/bin/bash' ~/.shellnotes/.shellnotes.sh
      clear
      echo "Shellnotes was successfully istalled"
      echo "------------------------------------"
      echo "Please do 'source ~/.bashrc' and reopen your terminal to start using shellnotes."
      echo "have fun taking notes!"
   elif [ -n "`$SHELL -c 'echo $CSH_VERSION'`" ]; then
      echo "source ~/.shellnotes/.shellnotes.sh" >> ~/.cshrc
      sed -i '1 i\#!/bin/csh' ~/.shellnotes/.shellnotes.sh
      clear
      echo "Shellnotes was successfully istalled"
      echo "------------------------------------"
      echo "Please do 'source ~/.cshrc' and reopen your terminal to start using shellnotes."
      echo "have fun taking notes!"
   elif [ -n "`$SHELL -c 'echo $KSH_VERSION'`" ]; then
      echo "source ~/.shellnotes/.shellnotes.sh~/.shellnotes.sh" >> ~/.kshrc
      sed -i '1 i\#!/bin/ksh' ~/.shellnotes/.shellnotes.sh
      clear
      echo "Shellnotes was successfully istalled"
      echo "------------------------------------"
      echo "Please do 'source ~/.kshrc' and reopen your terminal to start using shellnotes."
      echo "have fun taking notes!"
   elif [ -n "`$SHELL -c 'echo $FISH_VERSION'`" ]; then
      echo "source ~/.shellnotes/.shellnotes.sh" >> ~/.fishrc
      sed -i '1 i\#!/bin/fish' ~/.shellnotes/.shellnotes.sh
      clear
      echo "Shellnotes was successfully istalled"
      echo "------------------------------------"
      echo "Please do 'source ~/.fishrc' and reopen your terminal to start using shellnotes."
      echo "have fun taking notes!"
   else
   	clear
   	echo "Your shell is not supported by shellnotes."
   	echo "Installation Failed."
      cd ~/.shellnotes/util/exec
      ./ifailed
      cd $DIR
   fi
fi
cd $DIR