:<<'info'
shellnotes - readnote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function readnote() { 
	DIR="$(pwd)"
	if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
	else
		notename=$1
	fi

	if [ -z $notename ]; then
		echo "Invalid input."
		return 0

	else

		cd $DEFAULT_PATH
		if [ -e $notename ]; then
			chmod 0444 $notename
			$NOTES_EDITOR $notename
			chmod +rw $notename
			
		else
			clear
			echo "No such note."
			echo -n "Do you want to create one?[Y/N]: " && read create;
		fi
			
		case $create in y|Y|YES|Yes|yes )
			$NOTES_EDITOR
		esac
			
		clear
		cd $DIR
	fi
}