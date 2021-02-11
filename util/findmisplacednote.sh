:<<'info'
shellnotes - findmisplacednote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function findmisplacednote() {
	if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
	else
		notename=$1
	fi
	echo "Possible locations: "
	find ~/ -iname $notename -print 2>/dev/null
}