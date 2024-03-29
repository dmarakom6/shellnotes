:<<'info'
shellnotes - .resetshellnotes.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function resetshellnotes() {
	DIR="$(pwd)"
	proceed() {
		echo "y\n" | clearlogs >/dev/null
		echo "" > ~/.shellnotes/util/listnotes/output/*
		echo ".shellnotes/sne/sne.py" > ~/.shellnotes/util/shellnotes/sd/sd-input1.txt
		echo "/bin/nano"> ~/.shellnotes/util/shellnotes/sd/sd-input2.txt
		echo "~/Notes" > ~/.shellnotes/util/shellnotes/sd/sd-input3.txt
      	reset="

#The first line is the user's default shell found during installation process.

#The lines below must NOT be changed.
export DIR="$(pwd)"

.~/.shellnotes/whatsnew.sh

. ~/.shellnotes/util/getv.sh
. ~/.shellnotes/def/defaults.sh
. ~/.shellnotes/util/ChMkDir.sh
. ~/.shellnotes/util/readnote.sh
. ~/.shellnotes/util/quickread.sh
. ~/.shellnotes/util/quicknote.sh
. ~/.shellnotes/util/newnote.sh
. ~/.shellnotes/util/delnote.sh
. ~/.shellnotes/util/listnotes.sh
. ~/.shellnotes/util/findnote.sh
. ~/.shellnotes/util/findmisplacednote.sh
. ~/.shellnotes/util/renamenote.sh
. ~/.shellnotes/util/notewc.sh
. ~/.shellnotes/util/notegrep.sh
. ~/.shellnotes/util/clipnote.sh
. ~/.shellnotes/util/rmdups.sh



. ~/.shellnotes/util/shellnotes.sh
. ~/.shellnotes/util/.hidden/.clearlogs.sh
. ~/.shellnotes/util/.hidden/.resetshellnotes.sh

      	"

      	echo $reset > ~/.shellnotes/.shellnotes.sh
      	# mv ~/.shellnotes/.shellnotes.sh ~/.shellnotes/shellnotes.sh
      	rm -rf ~/.shellnotes/**/__pycache__
      	echo "" > ~/.shellnotes/**/.env
	}

	case $1 in -f | --force )
		proceed
		cd $DIR
		return 0
	esac

	echo "Be aware that this command will erase shellnotes' memory."
	echo "This contains default editors and folder, logfiles, user data and cache."
	echo "Your Notes will not be removed."
	echo -n "Proceed? " && read input
	case $input in y|Yes|Y|YES|yes)
		proceed
		echo "Done."
	esac

	cd $DIR
	return 0
}