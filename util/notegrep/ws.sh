:<<'info'
shellnotes - ws.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

grepv() {grep -v $regex $DEFAULT_PATH/$notename} #the command run when input is valid

nomatch() {
	echo -n "There are no matches.\nView note anyway?(Y/N): " && read view 
	case $view in
		y | Y | yes | YES | Yes )
			cat $DEFAULT_PATH/$notename
			return 0
			;;
		*)
			echo "Cancelled."
			return 0
			;;
	esac
}

if [ -f $DEFAULT_PATH/$notename ]; then
	
	if grep -vq $regex $DEFAULT_PATH/$notename ; then
		
	test "$(cat $DEFAULT_PATH/$notename)" = "$(grep -v $regex $DEFAULT_PATH/$notename)" && nomatch || grepv && return 0 
	
	else
		echo "Pattern matches the whole file."
		return 0

	fi

else
	echo "This note doesn't exist."
	return 0
fi
