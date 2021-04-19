:<<'info'
shellnotes - .resetshellnotes.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function resetshellnotes() {
	echo "Be aware that this command will erase shellnotes' memory."
	echo "This contains default editors and folder, logfiles and user data and cache."
	echo "Your Notes will not be removed."
	echo -n "Proceed? " && read input
	case $input in y|Yes|Y|YES|yes)
		echo "y\n" | clearlogs >/dev/null
		echo "" > ~/.shellnotes/util/listnotes/output/*
		echo "/usr/bin/gedit" > ~/.shellnotes/util/sd/sd-input1.txt
		echo "/bin/nano"> ~/.shellnotes/util/sd/sd-input2.txt
		echo "~/Notes" > ~/.shellnotes/util/sd/sd-input3.txt
	esac
	cd $DIR
	return 0
}