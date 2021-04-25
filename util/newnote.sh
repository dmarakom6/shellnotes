:<<'info'
shellnotes - newnote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function newnote() {

	cd $DEFAULT_PATH
	$NOTES_EDITOR 
	clear
	cd $DIR
	str="Note created in $DEFAULT_PATH" 
	underlines=$(echo "$str" | tr -c '\010' '-')
	echo "$str\n$underlines"

}