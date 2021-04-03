#!usr//bin/env bash
:<<'info'
shellnotes - update.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info
#Update script only for non-bash users. See supported shells for installation: help.txt > lines 88-95.
if [ -e ~/.shellnotes/ver/.shellnotes_version ]; then
	#Get the current version.
	VER=$(cat ~/.shellnotes/ver/.shellnotes_version)
	#Get the newer version of the source code from the github repository.
	NEW_VER=$(curl -s https://raw.githubusercontent.com/dmarakom6/shellnotes/master/ver/.shellnotes_version)
else
	echo "Shellnotes is not installed. Try running 'sh install.sh'."
	cd ~/.shellnotes/util/failed
	g++ ufailed.cpp -o ufailed
	~/.shellnotes/util/failed/ufailed
	rm -f ufailed
	return 0
fi
clear
dir="$(pwd)"
#Compare versions
if [ "$VER" = "$NEW_VER" ]; then
	echo "No new update found."
	echo "Shellnotes is up to date (version $VER)."
	cd ~/.shellnotes/util/failed
	g++ ufailed.cpp -o ufailed
	~/.shellnotes/util/failed/ufailed
	rm -f ufailed
	cd $dir
else
	echo "Good news!"
	echo "A new shellnotes update is available."
	echo -n "Would you like to update?[Y/n] " && read input
	case $input in y|Y|YES|Yes|yes )
		cd ~/.shellnotes/
		wget -q -O master.zip "https://github.com/dmarakom6/shellnotes/archive/master.zip"
		if [ -e master.zip ]; then
			unzip -qqo master.zip
			rm -rf master.zip
			cp shellnotes-master/* shellnotes-master/.* . 2> /dev/null
			mv -f shellnotes.sh .shellnotes.sh
			sleep 0.5
		else
			sleep 0.5
			echo "Update Failed."
			cd ~/.shellnotes/util/failed
			g++ ufailed.cpp -o ufailed
			~/.shellnotes/util/failed/ufailed
			rm -f ufailed
			cd $dir
			return 0
		fi
		echo "Shellnotes has been updated to version $NEW_VER"
		echo "Please restart your terminal."
		echo "Have fun taking notes!" 
	esac
fi
	