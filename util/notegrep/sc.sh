:<<'info'
shellnotes - sc.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

out="$(cat $DEFAULT_PATH/$notename | sed s/$regex/\\n/g | wc -l)"

if [ $out -gt 20 ]; then
	cat $DEFAULT_PATH/$notename | sed s/$regex/\\n/g | less
elif [ $out -le 20 ]; then
	cat $DEFAULT_PATH/$notename | sed s/$regex/\\n/g
fi
