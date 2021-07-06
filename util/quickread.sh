:<<'info'
shellnotes - quickread.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function quickread() {
	DIR="$(pwd)"
	check_params() {
		case $option in
			-l | --line )
			. ~/.shellnotes/util/quickread/l/l.sh
		;;
			-r | --reverse )
			. ~/.shellnotes/util/quickread/r/r.sh
		;;
			-s | --sort )			
			. ~/.shellnotes/util/quickread/s/s.sh				
		;;
			*)
			echo "Invalid parameter." #"\nUSAGE:\nquickread -r/-s -> FILE\nquickread -l -> LINE, FILE"
		;;
		esac
		return 0
	}
	if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
	elif [ $# -gt 1 ]; then
		if [ $# -gt 2 ]; then
			export option=$1
			export line=$2
			export notename=$3
		else
			export option=$1
			export notename=$2
		fi
		check_params
		return 0
	else
		notename=$1
	fi

	cd $DEFAULT_PATH
	if [ -e $notename ]; then
		# clear
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