:<<'info'
shellnotes - quickread.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function quickread() {
	dir="$(pwd)"
	if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
	else
		notename=$1
	fi
	cd $DEFAULT_PATH
	if [ -e $notename ]; then
		clear
		cat $notename
	
	else
		clear
		echo "No such note."
		cd ~	
fi
cd $dir
}