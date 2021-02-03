:<<'info'
shellnotes - ChMkDir.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

cd ~
if [[ -d "$DEFAULT_PATH" ]]; then
	exists=true
else
	mkdir Notes >/dev/null
fi