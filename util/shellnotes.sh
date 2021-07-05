:<<'info'
shellnotes - shellnotes.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function shellnotes() {
	. ~/.shellnotes/util/shellnotes/h/h.sh	
	. ~/.shellnotes/util/shellnotes/v/v.sh
	. ~/.shellnotes/util/shellnotes/r/r.sh
	. ~/.shellnotes/util/shellnotes/u/u.sh
	. ~/.shellnotes/util/shellnotes/l/l.sh
	. ~/.shellnotes/util/shellnotes/au/au.sh
	. ~/.shellnotes/util/shellnotes/sd/sd.sh
	. ~/.shellnotes/util/shellnotes/i/i.sh
	if [[ $# > 1 ]]; then
		echo "Too many arguments."
	elif [[ $# = 0 ]];then
		cd ~
		if [ -e .shellnotes/.shellnotes.sh ]; then
			echo "Shellnotes is successfully installed. For help, type shellnotes --help."
			cd $DIR
		else
			echo "Shellnotes is not installed properly. Please repeat installation steps or try shellnotes --help."
			cd $DIR
		fi
	fi
}
