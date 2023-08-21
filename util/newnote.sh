:<<'info'
shellnotes - newnote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function newnote() {
	DIR="$(pwd)"
	cd $HOME
	# echo $1
	NOTES_EDITOR
	# clear
	# str="Note created in $DEFAULT_PATH" 
	# underlines=$(echo "$str" | tr -c '\010' '-')
	# echo "$str\n$underlines"
	cd $DIR
}