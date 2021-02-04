:<<'info'
shellnotes - ChUpd.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

if [ -e ~/.shellnotes/ver/.shellnotes_version ]; then
	VER=$(cat ~/.shellnotes/ver/.shellnotes_version)
	NEW_VER=$(curl -s https://raw.githubusercontent.com/dmarakom6/shellnotes/master/.shellnotes_version)
fi

if [ "$VER" = "$NEW_VER" ]; then
	return 0
else
	if [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
		. ~/.shellnotes/bash_update.sh
	else
		. ~/.shellnotes/update.sh
	fi
fi
