:<<'info'
shellnotes - ws.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

if [ -f $DEFAULT_PATH/$notename ]; then
	
	if grep -vq $regex $DEFAULT_PATH/$notename ; then
		
	grep -v $regex $DEFAULT_PATH/$notename

	else
		echo "Pattern matches the whole file."
		return 0

	fi

else
	echo "This note doesn't exist."
	return 0
fi
