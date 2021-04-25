:<<'info'
shellnotes - noteinfo.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function noteinfo() {
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
			wc $notename
			echo "(lines/words/chars/name)"
		else
			echo "That note doesn't exist."
		fi
	fi

cd $DIR

}