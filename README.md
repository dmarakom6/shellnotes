# shellnotes
A simple and easy way to keep notes via your linux terminal.

# How to download

-You can either download or clone this repository.

# How to install
## step 1:

-Place the file "shellnotes.sh" into your home folder.

## step 2:

-Rename the file and add a dot before its name. It should look like this: ".shellnotes.sh" in the home folder.

## step 3:

-Open the terminal and type:
`chmod +x ~/.shellnotes.sh`

## step 4:

-Open any text editor you want. Select "Open file" from its menu (Usually top left) and navigate to your home folder. Then, press `Ctrl + H` in order to show all the hidden files and folders
in the home directory. Find a file called `.bashrc` and open it.

## step 5:

-Go to the last line of the file you opened at step 4, and write: `source ~/.shellnotes.sh` in order to be able to use shellnotes every time you launch your terminal.

# Warnings!
*THIS FILE IS ONLY FOR LINUX USERS* (prefered distro: Ubuntu 17.10 or higher)

*THIS NOTE SYSTEM WILL ONLY WORK ON BASH SHELL* (default shell for ubuntu, you may find bugs in other shells like zsh, ksh)

*DON'T CHANGE THE SCRIPT* (Only in case you don't have the default editors who are gedit and nano. In that case, you can either change them, or install the default ones.)

*DON'T USE newnote() TO READ NOTES* (Same goes for readnote() for writing new ones.)

*DON'T JUDGE ME* (This is my first shell script.)
*HAVE FUN WITH SHELLNOTES!!!*
