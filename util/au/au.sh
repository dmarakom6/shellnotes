:<<'info'
shellnotes - au.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

case $1 in -au|--auto-update )
	if grep -q 'ChUpd.sh' ~/.shellnotes/.shellnotes.sh; then
		echo "auto-update feature is enabled."
		echo -n "Disable it? [Y/N]: " && read input
		case $input in Yes|y|Y|yes|YES )
			sed -i '/ChUpd.sh/d' ~/.shellnotes/.shellnotes.sh
			echo "auto-update feature is now disabled."
			echo "To enable, run 'shellnotes -au' again."
		esac
	else
		echo "auto-update feature is disabled."
		echo -n "Enable it? [Y/N]: " && read input
		case $input in Yes|y|Y|yes|YES )
			long=$(grep -n "#The lines below must NOT be changed." ~/.shellnotes/.shellnotes.sh)
			short=$(echo "${long}" | head -c1)
			short=$((short+1))
			file=$(eval echo "~/.shellnotes/util/ChUpd.sh")
	      	sed -i "$short i\. $file" ~/.shellnotes/.shellnotes.sh
	      	echo "auto-update feature is now enabled."
			echo "To disable, run 'shellnotes -au' again."
		esac	
	fi
esac
