:<<'info'
shellnotes - cl.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

if [ -f $DEFAULT_PATH/$notename ]; then

	out="$(grep -c $regex $DEFAULT_PATH/$notename)"

	if [ $out -eq 1 ]; then
		echo "Compressed $out line of grep output."
	elif [ $out -gt 1 ]; then
		echo "Compressed $out lines of grep output."
		echo -n "Show lines?(Y/N): " && read show
		case $show in
			yes | y | Y | YES | Yes )
				grep -n $regex $DEFAULT_PATH/$notename
				;;
		esac
	else
		echo "No matching lines found."
	fi

else
	echo "No such file."
	return 0

fi