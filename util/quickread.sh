:<<'info'
shellnotes - quickread.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function quickread() {
	if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
	else
		notename=$1
	fi
	cd $DEFAULT_PATH
	if [ -e $notename ]; then
		clear

		if [ "$(cat $notename | wc -l)" -ge 25 ];then
			cat $notename | less
		else
			cat $notename
		fi
	
	else
		clear
		echo "No such note."	
fi

cd $DIR
}