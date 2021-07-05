:<<'info'
shellnotes - findmisplacednote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function findmisplacednote() {
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
		echo "Possible locations: "
		find ~/ -iname $notename -print 2>/dev/null
	fi
	cd $DIR
}