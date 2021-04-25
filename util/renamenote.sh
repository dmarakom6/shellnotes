:<<'info'
shellnotes - renamenote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function renamenote() {
	cd $DEFAULT_PATH
	if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
		echo -n "Enter new name: " && read newnotename
	else
		notename=$1
		newnotename=$2
	fi


	if [ -z $notename ]; then
		echo "Invalid input."
		cd $DIR
		return 0

	elif [ -z $newnotename ]; then
		echo "Invalid input."
		cd $DIR
		return 0

	else

		if [ -e $notename ]; then
			if [ -e $newnotename ]; then
				echo "There is another note named '$newnotename' in your Notes folder."
			else
				mv $notename $newnotename
				clear
				str="Note renamed from $notename to $newnotename in $DEFAULT_PATH"
				underlines=$(echo "$str" | tr -c '\010' '-')
				echo "$str\n$underlines"
			fi

		else
			echo "This note does not exist."
		fi
		
	cd $DIR

	fi
}