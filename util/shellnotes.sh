:<<'info'
shellnotes - shellnotes.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function shellnotes() {
	dir="$(pwd)"
	. ~/.shellnotes/util/h/h.sh	
	. ~/.shellnotes/util/v/v.sh
	. ~/.shellnotes/util/r/r.sh
	. ~/.shellnotes/util/u/u.sh
	. ~/.shellnotes/util/l/l.sh
	. ~/.shellnotes/util/au/au.sh
	. ~/.shellnotes/util/sd/sd.sh
	if [[ $# > 1 ]]; then
		echo "Too many arguments."
	elif [[ $# = 0 ]];then
		cd ~
		if [ -e .shellnotes/.shellnotes.sh ]; then
			echo "Shellnotes is successfully installed. For help, type shellnotes --help."
			cd $dir
		else
			echo "Shellnotes is not installed properly. Please repeat installation steps or try shellnotes --help."
			cd $dir
		fi
	fi
}
