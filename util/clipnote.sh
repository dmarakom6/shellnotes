:<<'info'
shellnotes - .clearlogs.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info


function clipnote() {

	function _write_clipboard() {
		if ! command -v xclip &> /dev/null; then
		    echo "Error: xclip is not installed. Please install it."
		    exit 1
		fi

		clipboard_content=$(xclip -selection clipboard -o)
		echo "$clipboard_content" > $DEFAULT_PATH/$1
	}
	

	if [ $# -eq 0 ]; then
		echo "No note name given."
		echo -n "Enter note name: " && read input
		if [ -z "$input" ]; then
			echo "No input given."
		else
			_write_clipboard $input
		fi

	else
		case $1 in
			-r | --reverse )
				if [ $# -eq 2 ]; then
					file_content=$(quickread "$2")
					echo -n "$file_content" | xclip -selection clipboard
				else
					echo "No note name given."
					echo "Usage: clipnote -r <notename>"
				fi
				;;
			*)
				_write_clipboard $1
				;;
		esac
	fi
}

