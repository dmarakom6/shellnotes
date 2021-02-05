:<<'info'
shellnotes - listnotes.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function listnotes() {
	case $1 in -d|--dynamic )
		. ~/.shellnotes/util/listnotes/d/d.sh
	esac
	case $1 in -n|--number )
		. ~/.shellnotes/util/listnotes/n/n.sh
	esac
	case $1 in -f|--folder )
		. ~/.shellnotes/util/listnotes/f/f.sh
	esac
	if [[ "$1" == "" ]]; then
		if [ -z "$(ls -A $DEFAULT_PATH)" ]; then
			echo "Your Notes folder is empty."
		else
			ls $DEFAULT_PATH -t
		fi
	fi
}
