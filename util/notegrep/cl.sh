:<<'info'
shellnotes - cl.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

out="$(grep $regex $DEFAULT_PATH/$notename | wc -l)"
echo "Compressed $out lines of grep output."