:<<'info'
shellnotes - v.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

echo "Press 'Q' to move from one note to the other."
sleep 3

for file in "$DEFAULT_PATH"/*; do
	if [ -f "$file" ]; then
	    echo "Displaying content of file: $file"
	    less "$file"
	fi
done