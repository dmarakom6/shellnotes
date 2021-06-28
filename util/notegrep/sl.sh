:<<'info'
shellnotes - sl.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

if [ -f $DEFAULT_PATH/$notename ]; then
	out="$(grep -n $regex $DEFAULT_PATH/$notename | wc -l)"
	if [ $out -eq 0 ]; then
		echo "No matching lines found."
	else
		grep -n $regex $DEFAULT_PATH/$notename
	fi

else
	echo "No such file."

fi
