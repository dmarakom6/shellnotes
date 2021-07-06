:<<'info'
shellnotes - r.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

if [ -f $DEFAULT_PATH/$notename ]; then
	tac $DEFAULT_PATH/$notename
else
	echo "No such note."
fi
