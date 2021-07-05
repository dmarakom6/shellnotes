:<<'info'
shellnotes - set_defaults.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

. ./~/.shellnotes/def/defaults.sh


clear
echo "Shellnotes configuration tool"
echo "-----------------------------"
echo "1. Select default editor for regular notes (newnote)"
echo "2. Select default editor for quick notes (quicknote)"
echo "3. Select default path for saving your notes (Notes folder)"
echo "4. View defaults (editors, folder, source)"
echo
echo -n "[1,2,3,4]: " && read input
input1="$(cat ~/.shellnotes/util/shellnotes/sd/sd-input1.txt)"
input2="$(cat ~/.shellnotes/util/shellnotes/sd/sd-input2.txt)"
input3="$(cat ~/.shellnotes/util/shellnotes/sd/sd-input3.txt)"



if [[ "$input" == "1" ]]; then
	echo -n "Editor name without full path: " && read name
	if [ -e "$(which $name)" ]; then
		if [[ "$(which $name)" == "$input1" ]]; then
			echo "This is already the default notes editor."
		else
			echo "$(which $name)" > ~/.shellnotes/util/shellnotes/shellnotes/sd/sd-input1.txt
			echo "Default notes editor updated."
			echo "Please restart your terminal."
		fi
	
	else
		echo "This program name is invalid or not a text editor."
		cd ~/.shellnotes/util/exec
   		./sdfailed
	fi




elif [[ "$input" == "2" ]]; then
	if [ -e "$(which $name)" ]; then
		if [[ "$(which $name)" == "$input2" ]]; then
			echo "This is already the default quick notes editor."
		else
			echo "$(which $name)" > ~/.shellnotes/util/shellnotes/sd/sd-input2.txt
			echo "Default quick notes editor updated."
			echo "Please restart your terminal."
		fi
		echo "This program name is invalid or not a text editor."
		cd ~/.shellnotes/util/exec
   		./sdfailed
	fi




elif [[ "$input" == "3" ]]; then
	echo -n "Select new note path with absolute path: " && read name
	name=$(eval echo $name)
	if [ -d $name ]; then
		if [[ "$name" == "$input3" ]]; then
			echo "This is already the default notes folder."
			cd ~/.shellnotes/util/exec
   			./sdfailed
		else
			mv $DEFAULT_PATH/* $name
			echo "$name" > ~/.shellnotes/util/shellnotes/sd/sd-input3.txt
			echo "Default notes folder updated."
			echo "Please restart your terminal."
		fi
	
	else
		echo "This directory does not exist."
		cd ~/.shellnotes/util/exec
   		./sdfailed
	fi



elif [[ "$input" == "4" ]]; then
	echo "Default notes editor: $input1"
	echo "Default quick notes editor: $input2"
	echo "Default notes folder: $input3"
	echo "Default shellnotes source files: ~/.shellnotes"
else
	echo "Invalid input."
fi

cd $DIR
