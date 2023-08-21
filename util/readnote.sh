:<<'info'
shellnotes - readnote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function readnote() { 
	DIR="$(pwd)"
	if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
	else
		notename="$1"
	fi

	if [ -z "$notename" ]; then
		echo "Invalid input."
		return 0

	else

		cd $DEFAULT_PATH
		if [ -e "$notename" ]; then
			cd "$HOME"
			# chmod 0444 $notename
			NOTES_EDITOR "$notename"
			# chmod +rw $notename
			
		else
			clear
			echo "No such note."
			echo -n "Do you want to create one?[Y/N]: " && read create;

			case $create in y|Y|YES|Yes|yes )
				newnote
			esac
		fi
			
		
			
		# clear
		cd "$DIR"
	fi
}


_readnote_completion() {
    local cur prev

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Generate the list of files in the directory
    files=("$DEFAULT_PATH"/*)
    files_list="${files[@]##*/}"  # Extract file names

    case "$prev" in
        readnote)
            COMPREPLY=( $(compgen -W "${files_list}" -- "$cur") )
            ;;
        *)
            ;;
    esac
}
complete -F _readnote_completion readnote