:<<'info'
shellnotes - rmdups.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function rmdups() {

	_rmdups() {
		result="$(awk '!seen[$0]++' $1)"
		echo "$result"
		echo -n "Replace $notename with the above text?[Y\N]: " && read proceed
		case "$proceed" in
			Y|y|yes|YES|Yes )
				echo "$result" > $notename
		esac
		return 0
	}	


	DIR="$(pwd)"
	if [ $# -eq 0 ]; then
		echo -n "Enter the name of the note whose duplicates you wish to delete: " && read notename
	else
		notename=$1
	fi

	if [ -z $notename ]; then
		echo "Invalid input."
		return 0

	else
		cd $DEFAULT_PATH

		if [ -e $notename ]; then
			_rmdups "$notename"
		else
			echo "Invalid argument or parameter given."
			cd $DIR
		fi
	fi

	cd $DIR

}

_rmdups_completion() {
    local cur prev

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Generate the list of files in the directory
    files=("$DEFAULT_PATH"/*)
    files_list="${files[@]##*/}"  # Extract file names

    case "$prev" in
        rmdups)
            COMPREPLY=( $(compgen -W "${files_list}" -- "$cur") )
            ;;
        *)
            ;;
    esac
}
complete -F _rmdups_completion rmdups