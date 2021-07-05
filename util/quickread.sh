:<<'info'
shellnotes - quickread.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function quickread() {
	DIR="$(pwd)"
	check_params() {
		case $1 in
			-parameter | --parameter )

				;;
		esac
		return 0
	}
	if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
	elif [ $# -gt 1 ]; then
		check_params
	else
		notename=$1
	fi

	cd $DEFAULT_PATH
	if [ -e $notename ]; then
		clear
		if [ "$(cat $notename | wc -l)" -ge 25 ]; then
			cat $notename | less
		else
			cat $notename
		fi
	
	else
		echo "No such note."	
fi

cd $DIR
}