:<<'info'
shellnotes - .clearlogs.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function clearlogs() {
	dir="$(pwd)"
	echo -n "Are you sure? " && read input
	case $input in Y|Yes|yes|y|YES )
		cd ~/.shellnotes/logs
		g++ .clearlogs.cpp -o clearlogs
		~/.shellnotes/logs/clearlogs
		rm -f clearlogs
		echo "[shellnotes] Logfiles cleared."
	esac
	cd $dir
}