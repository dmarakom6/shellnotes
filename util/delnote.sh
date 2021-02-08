:<<'info'
shellnotes - delnote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function delnote() {
	if [ $# -eq 0 ]; then
		echo -n "Enter the name of the note you want to delete: " && read delete
	else
		delete=$1
	fi
		if [[ $1 == "-all" ]]; then
			dir="$(pwd)"
			cd $DEFAULT_PATH
			me="$(whoami)"
			rm -f *
			clear
			cd $dir
			str="All files deleted from Home/$me/Notes" 
			underlines=$(echo "$str" | tr -c '\010' '-')
			echo "$str\n$underlines"
		else
			dir="$(pwd)"
			cd $DEFAULT_PATH
			me="$(whoami)"
			if [ -e $delete ]; then
				rm $delete
				clear
				cd $dir
				str="Note deleted from Home/$me/Notes" 
				underlines=$(echo "$str" | tr -c '\010' '-')
				echo "$str\n$underlines"
			else
				echo "No such file."
				cd $dir
		fi
	fi
}