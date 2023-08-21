:<<'info'
shellnotes - listnotes.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function listnotes() {
	DIR="$(pwd)"
	listnotesFunc () {

		NOTES="`ls $DEFAULT_PATH --color=always `"

		if [ "$NOTES" ]
		then
		    echo "Your notes from ${DEFAULT_PATH}:\n"
		    echo "$NOTES\

		"
		fi
	}

	case $1 in
		-d|--dynamic)
			. ~/.shellnotes/util/listnotes/d/d.sh
			;;
		-n|--number )
			. ~/.shellnotes/util/listnotes/n/n.sh
			;;
		-f|--folder )
			. ~/.shellnotes/util/listnotes/f/f.sh
			;;
		-v|--view )
			. ~/.shellnotes/util/listnotes/v/v.sh
			;;
		*)
			if [ -z $1 ]; then
				if [ -z "$(ls -A $DEFAULT_PATH)" ]; then
					echo "Your Notes folder is empty."
				else
					listnotesFunc
				fi
			else
				echo "Invalid parameter."
			fi
	esac
	return 0
	cd $DIR
}

_listnotes_completion() {
    local cur prev

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    case "$prev" in
        listnotes)
            COMPREPLY=( $(compgen -W "-d -n -f -v" -- "$cur") )
            ;;
        *)
            ;;
    esac
}
complete -F _listnotes_completion listnotes