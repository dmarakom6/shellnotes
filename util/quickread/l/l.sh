:<<'info'
shellnotes - l.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info



if [ -f $DEFAULT_PATH/$notename ]; then

	lines="$(cat $DEFAULT_PATH/$notename | wc -l)"

	if [ $line -gt $lines ]; then
		echo "There's no such line in this file."
		echo "The maximum line number you can use for the specific file is $lines."
	elif [ $line -le 0 ]; then
		echo "There's no such line in this file."
		echo "The minimum line number you can use for a file is 1."
	else
		sed "${line}q;d" $DEFAULT_PATH/$notename	
	fi	
	
else
	echo "No such note."
fi
