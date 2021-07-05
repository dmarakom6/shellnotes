:<<'info'
shellnotes - sf.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

files="$(grep -rwl $regex $DEFAULT_PATH/* | wc -l)"

if [ $files -ge 1 ]; then
	grep -rwl $regex $DEFAULT_PATH/*
else
	echo "No matching files found."
fi
