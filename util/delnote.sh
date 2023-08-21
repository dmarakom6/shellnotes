:<<'info'
shellnotes - delnote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function delnote() {
	DIR="$(pwd)"
	if [ $# -eq 0 ]; then
		echo -n "Enter the name of the note you want to delete: " && read delete
	else
		delete=$1
	fi

	if [ -z $delete ]; then
		echo "Invalid input."
		return 0

	else
		if [[ $1 == "-all" ]]; then
				cd $DEFAULT_PATH
				rm -f *
				clear
				cd $DIR
				str="All files deleted from $DEFAULT_PATH" 
				underlines=$(echo "$str" | tr -c '\010' '-')
				echo "$str\n$underlines"
			
		else
			cd $DEFAULT_PATH

			if [ -e $delete ]; then
				rm $delete
				clear
				cd $DIR
				str="Note deleted from $DEFAULT_PATH" 
				underlines=$(echo "$str" | tr -c '\010' '-')
				echo "$str\n$underlines"
			else
				echo "Invalid argument or parameter given."
				cd $DIR
		fi
	fi
fi
cd $DIR
}

_delnote_completion() {
    local cur prev

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Generate the list of files in the directory
    files=("$DEFAULT_PATH"/*)
    files_list="${files[@]##*/}"  # Extract file names

    case "$prev" in
        delnote)
            COMPREPLY=( $(compgen -W "${files_list}" -- "$cur") )
            ;;
        *)
            ;;
    esac
}
complete -F _delnote_completion delnote