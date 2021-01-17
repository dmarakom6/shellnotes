# shellnotes
A simple and easy way to keep notes via your linux terminal.

# Basic Commands:
 ## newnote:
  Write a new note using your text-editor.
## quicknote: 
  Write a note directly from terminal.
## readnote: 
  Read a note from your text-editor.
## quickread: 
  Read a note directly from terminal.
## listnotes: 
  View a full list of notes from your default notes folder.
## delnote: 
  Delete a note from your default notes folder.
## shellnotes(-v or --version, -r,-h or --help): 
  Information about shellnotes.
## findnote:
Find a specific note in your Notes folder.
## findmisplacednote:
Find a misplaced note in your system.
## renamenote:
Rename a note.


# How to download

-You can either download or clone this repository.

# How to install
## step 1:

-Place the file "shellnotes.sh" and "help" into your home folder.

## step 2:

-Rename the file and add a dot before its name. It should look like this: ".shellnotes.sh" and ".help" in the home folder.

## step 3:

-Open the terminal and type:
`chmod +x ~/.shellnotes.sh`

## step 4:

-Open any text editor you want. Select "Open file" from its menu (Usually top left) and navigate to your home folder. Then, press `Ctrl + H` in order to show all the hidden files and folders
in the home directory. Find a file called `.bashrc` and open it.

## step 5:

-Go to the last line of the file you opened at step 4, and write: `source ~/.shellnotes.sh` in order to be able to use shellnotes every time you launch your terminal.

# Warnings!

*THIS SYSTEM IS MADE FOR BASH SHELL* (Change your shell if necessary.)

*DEFAULT EDITORS AND FOLDER MUST BE VALID*

*DON'T CHANGE THE SCRIPT* (Only in case you don't have the default editors who are gedit and nano. In that case, you can either change them, or install the default ones.)
