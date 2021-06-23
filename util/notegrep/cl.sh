:<<'info'
shellnotes - cl.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

out="$(grep $regex $DEFAULT_PATH/$notename | wc -l)"

if [ $out -eq 1 ]; then
	echo "Compressed $out line of grep output."
elif [ $out -gt 1 ]; then
	echo "Compressed $out lines of grep output."
else
	echo "No matching files found."
fi
