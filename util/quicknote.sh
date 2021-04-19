:<<'info'
shellnotes - quicknote.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

function quicknote() {
if [ $# -eq 0 ]; then
	echo -n "Enter note name: " && read notename
else
	notename=$1
fi
cd $DEFAULT_PATH
if [ -e $notename ]; then
	clear
	echo "This note already exists."
	cd ..
	echo -n "Do you want to read it?[Y/N]: " && read readquicknote
	
else
	touch $notename
	$QUICK_NOTES_EDITOR $notename
	cd $DIR
	clear
	str="Note created in $DEFAULT_PATH" 
	underlines=$(echo "$str" | tr -c '\010' '-')
	echo "$str\n$underlines"
		
fi

case $readquicknote in y|Y|YES|Yes|yes )
	clear
	cd $DEFAULT_PATH
	if [[ -e $notename ]]; then
		cat $notename
	else
		echo "This note is blank."
	fi
esac
	cd $DIR
}