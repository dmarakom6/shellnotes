:<<'info'
shellnotes - u.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

case $1 in -u|--update )
	if [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
		. ~/.shellnotes/bash_update.sh
	else
		. ~/.shellnotes/update.sh
	fi
esac
