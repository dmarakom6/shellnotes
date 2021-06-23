:<<'info'
shellnotes - cf.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

files="$(grep -rwl $regex $DEFAULT_PATH/* | wc -l)"

if [ $files -eq 1 ]; then
	echo "Found $files matching file in $DEFAULT_PATH."
elif [ $files -gt 1 ]; then
	echo "Found $files matching files in $DEFAULT_PATH."
	echo -n "Show files? " && read show
	case $show in
		yes | y | Y | YES | Yes )
			grep -rwl $regex $DEFAULT_PATH/*
			;;
	esac
else
	echo "No matching files found."
fi

