#!/bin/bash
#Warning! If you don't have gedit(text editor) or nano installed, you may have to change the default text editor (lines 10, 25, 40).
#I don't usually code in shell, I just made this to keep notes i want faster. So please don't judge me!
#My tool for making quick notes via terminal, including only 3 simple functions:


#opening a note (newnote will work as well, but this is a simpler one, and will create a new note if $notename doesn't exist)
function readnote() { 
	cd Notes; 
	read -p "Enter note name: " opennote; 
	nano $opennote; 
	clear; }






#A quick solution to users who want keeping notes instantly via terminal.
	function quicknote() { 
	pwd; 
	ls -l; 
	mkdir Notes
	cd Notes; 
	read -p "Enter note name: " notename; 
	touch $notename; 
	nano $notename; 
	cd ..; 
	clear; 
	echo "Note created in Home/dimitris/Notes"; 
	echo "-----------------------------------"; 
}





#like quicknote(), but it openg ubuntu's text-editor.
function newnote() { 
	pwd; 
	ls; 
	mkdir Notes
	cd Notes; 
	gedit; 
	clear; 
	cd ..; 
	clear; 
	echo "Note created in Home/dimitris/Notes"; 
	echo "-----------------------------------"; 
}


