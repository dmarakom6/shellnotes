#!usr//bin/env bash
#Change the first line if you don't use bash, in order for the code to work properly.
#Warning! If you don't have gedit(text editor) or nano installed, you may have to change the default text editor (lines 10, 25, 40).

#Change this path if you use another editor.
NOTES_EDITOR="$(which gedit)" #Change 'gedit' with your editor.
QUICK_NOTES_EDITOR="$(which nano)" #Or this one. (Suggested editors can be found in the Help Page)
#Change this path if you use another folder to save your notes.
DEFAULT_PATH=~/Notes #Change ~/Notes with your folder.


#Make a Notes folder for the user
cd ~
if [[ -d "Notes" ]]; then
	exists=True
else
	mkdir Notes
fi

#opening a note (It will create a new note if $notename is blank)
function readnote() { 
dir="$(pwd)"
me="$(whoami)"
echo -n "Enter note name: " && read notename
cd $DEFAULT_PATH
if [ -e $notename ]; then
	$NOTES_EDITOR $notename
	
else
	clear
	echo "No such note."
	echo -n "Do you want to create one?[Y/N]: " && read create;
	
fi
	case $create in Y|Yes|YES|Yes|y )
		newnote
	esac
	
clear
cd $dir

}

#Read notes instantly via terminal
function quickread() {
	dir="$(pwd)"
	echo -n "Enter note name: " && read quicknotename
	cd $DEFAULT_PATH
	if [ -e $quicknotename ]; then
		clear
		cat $quicknotename
	
	else
		clear
		echo "No such note."
		cd $dir
fi
cd $dir
}

#A quick solution to users who want keeping notes instantly via terminal.
function quicknote() {
dir="$(pwd)"
me="$(whoami)"
cd $DEFAULT_PATH
echo -n "Enter note name: " && read notename
if [ -e $notename ]; then
	clear
	echo "This note already exists."
	cd ..
	echo -n "Do you want to read it?[Y/N]: " && read readquicknote
	
else
	touch $notename
	$QUICK_NOTES_EDITOR $notename
	cd $dir
	clear
	echo "Note created in Home/$me/Notes"
	echo "-----------------------------------"
		
fi

case $readquicknote in y|Y|YES|Yes|yes )
	clear
	cd $DEFAULT_PATH
	if [[ -s $notename ]]; then
		echo "This note is blank."
	else
		cat $notename
	fi
esac
	cd $dir
}


#writes notes using ubuntu's text-editor (gedit).
function newnote() { 
dir="$(pwd)"; 
me="$(whoami)"
cd $DEFAULT_PATH
$NOTES_EDITOR 
clear
cd $dir
echo "Note created in Home/$me/Notes"; 
echo "-----------------------------------"; 
}

#Delete notes from terminal
function delnote() {
	if [[ $1 == "-all" ]]; then
		dir="$(pwd)"
		cd $DEFAULT_PATH
		me="$(whoami)"
		rm *
		clear
		cd $dir
		echo "All files deleted from Home/$me/Notes"; 
		echo "-------------------------------------";
	else
		dir="$(pwd)"
		cd $DEFAULT_PATH
		me="$(whoami)"
		echo -n "Enter the name of the note you want to delete: " && read delete
		if [ -e $delete ]; then
			rm $delete
			clear
			cd $dir
			echo "Note deleted from Home/$me/Notes"; 
			echo "-----------------------------------";
		else
			echo "No such file."
			cd $dir
	fi
fi
}

#list your notes via terminal. 
function listnotes() {
	if [ -z "$(ls -A ~/Notes)" ]; then
		echo "Your Notes folder is empty."
	else
		ls $DEFAULT_PATH -t
	fi
}

#Help for new users
function shellnotes() {
	dir="$(pwd)"
 	if [[ $1 == "-v" ]]; then
		echo "Shellnotes version: 2.5"

	elif [[ $1 == "-r" ]]; then
		echo "Github repository: https://github.com/dmarakom6/shellnotes/blob/master/"

	elif [[ $1 == "-h" ]]; then
		less ~/.help
		cd $dir
	elif [[ $1 == "--help" ]]; then
		less ~/.help
		cd $dir
	else
		cd ~
		if [ -e .shellnotes.sh ]; then
			echo "Shellnotes is successfully installed. For help, type shellnotes --help."
			cd $dir
		else
			echo "Shellnotes is not installed properly. Please repeat installation steps or try shellnotes --help."
			cd $dir
		fi
	fi
}
#Take info about a note
function noteinfo() {
	dir="$(pwd)"
	cd $DEFAULT_PATH
	echo -n "Enter note name: " && read notename
	if [ -e $notename ]; then
		wc $notename
		echo "(lines/words/chars/name)"
else
	echo "That note doesn't exist."
fi
cd $dir
}

#Help the  user find a specific Note in his note folder. If it's not there, he must have misplaced it.
function findnote() {
	dir="$(pwd)"
	me="$(whoami)"
	echo -n "Enter note name: " && read notename
	cd $DEFAULT_PATH
	if [ -e $notename ]; then
		echo "File was found in your Notes folder."
	else
		echo "File was not found in your Notes folder, must be misplaced or renamed."
		echo "Try 'findmisplacednote' to find the original file."

	fi
	cd $dir		

}

#Find a misplaced note, not in the Notes folder.
function findmisplacednote() {
	echo -n "Enter note name: " && read notename
	echo "Possible locations: "
	find ~/ -iname $notename -print 2>/dev/null
}

#Rename a note.
function renamenote() {
	dir="$(pwd)"
	me="$(whoami)"
	cd $DEFAULT_PATH
	echo -n "Enter note name: " && read notename
	if [ -e $notename ]; then
		echo -n "Enter new name: " && read newnotename
		if [ -e $newnotename ]; then
			echo "There is another note named '$newnotename' in your Notes folder."
		else
			mv $notename $newnotename
			clear;
			echo "Note renamed from $notename to $newnotename in Home/$me/Notes"
			echo "-------------------------------------------------------------"
		fi

	else
		echo "This note does not exist."
	fi
	
	cd $dir
}

