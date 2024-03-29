:<<'info'
shellnotes - notewc.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function notewc() {
	DIR="$(pwd)"
	if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
	else
		notename=$1
	fi

	if [ -z $notename ]; then
		echo "Invalid input."
		return 0
	else
		cd $DEFAULT_PATH
		if [ -e $notename ]; then
			echo -n "wc output: " && wc $notename
			echo "(lines/words/chars/name)"
		else
			echo "That note doesn't exist."
		fi
	fi

cd $DIR

}

_notewc_completion() {
    local cur prev

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Generate the list of files in the directory
    files=("$DEFAULT_PATH"/*)
    files_list="${files[@]##*/}"  # Extract file names

    case "$prev" in
        notewc)
            COMPREPLY=( $(compgen -W "${files_list}" -- "$cur") )
            ;;
        *)
            ;;
    esac
}
complete -F _notewc_completion notewc