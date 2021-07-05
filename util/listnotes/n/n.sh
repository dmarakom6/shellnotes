:<<'info'
shellnotes - n.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

folder="$(cat ~/.shellnotes/util/shellnotes/sd/sd-input3.txt)"
files="$(eval echo $(cat ~/.shellnotes/util/shellnotes/sd/sd-input3.txt) | xargs ls | wc -l)"

echo "Found $files files in $folder."