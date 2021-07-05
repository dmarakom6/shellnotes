:<<'info'
shellnotes - findnote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function findnote() {
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
			echo "File was found in your Notes folder."
		else
			echo "File was not found in your Notes folder, must be misplaced or renamed."
			echo "Try 'findmisplacednote' to find the original file."

		fi
	fi

	cd $DIR		
}
