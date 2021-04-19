# Shellnotes
![shellnotes](https://raw.githubusercontent.com/dmarakom6/shellnotes/master/image/shellnotes.jpg)  
A easy, simple and fast way to keep notes via your linux terminal.

# What is shellnotes?
Shellnotes  is  a note system for advanced linux and terminal users. It is made out of a lot of other commands and scripts, and has tons of abilities, like a logging system, an auto-update feature, and much more!
Shellnotes uses your favourite text editor to save notes on the go. If you are the type of guy that has his terminal open 24/7, you can also save notes __directly__ via terminal!
With shellnotes, you can make, find, list, edit or delete your notes from wherever you are, whenever you want. 

# Why use shellnotes?
#### Here's why:
* Shellnotes is the fastest and the safest way to take notes.  
* It can suit both dynamic and regular users, as it brings a classic TUI experience as well as some more modern abilities.  
* It runs __exclusively__ in your terminal, its source files are stored in your home folder.  
* It's lightweight  
* It's [more than just a program for taking notes.](#learn-everything-shellnotes-can-do). It has a ton of other interesting abilities.
* It's portable and compatible with most shells.
* It matches all the users' experience, by creating the appropriate environment for both beginners and advanced users linux users.
* Even if you delete shellnotes, your notes will stay where they are.
* It has a simple file organization system and [TUI](https://en.wikipedia.org/wiki/Text-based_user_interface).
* It's easy to install, delete, update or use.
* It's mostly written in [shell](https://en.wikipedia.org/wiki/Shell_script), which is the language for Unix/Linux [CLI](https://en.wikipedia.org/wiki/Command-line_interface) applications.

# How to install
After downloading the source code, navigate to the folder where it's stored, and execute the install script (`install.sh`), using the `sh` command.
```sh
user@device:~$ cd Downloads
user@device:~/Downloads$ ls
shellnotes-master
user@device:~/Downloads$ cd shellnotes-master
user@device:~/Downloads/shellnotes-master$ ls
bash_update.sh  docs   install.sh  set_defaults.sh  uninstall.sh  util
def             image  logs        shellnotes.sh    update.sh     ver
```
```
user@device:~/Downloads$ sh install.sh
[sudo] password for user: ******
#installation starts
```
for more information, make sure to check out the [installation documentation](https://github.com/dmarakom6/shellnotes/blob/master/docs/installing.txt).


# How to set the defaults
Shellnotes lets you use your favourite text-editor to take your notes, and your prefered directory to save your notes, from where shellnotes will delete them, read them, or list them.
## How shellnotes works with text-editors
There are to ways to write a note with shellnotes:
1. Using a [GUI](https://en.wikipedia.org/wiki/Graphical_user_interface) editor or [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment), such as [Sublime Text](https://www.sublimetext.com/), or [Visual Studio Code](https://code.visualstudio.com/).  
2. Using an in-terminal editor. 
## The Default Note Editors
Shellnotes comes with two default editors, which you can download or [change](#change-default-editors). These are:
1. [gedit](https://wiki.gnome.org/Apps/Gedit), the default [GNOME](https://www.gnome.org/) text editor.
2. [nano](https://www.nano-editor.org/), for in-terminal notes.
 

## Change default editors  
Shellnotes __does not__ require the user to have the above editors. You can always check the current editors or change them.
After installing shellnotes, open your terminal, and type `shellnotes --set-defaults`. This will trigger the [shellnotes configuration tool](https://github.com/dmarakom6/shellnotes/blob/master/set_defaults.sh). Choose an option:
1. Select default [GUI](https://en.wikipedia.org/wiki/Graphical_user_interface) editor for regular notes.
2. Select in-terminal editor for instant notes.
3. Check default editors.

After selecting an option, write ___the name of the program___ you want to set as a new default GUI/terminal editor. It must be valid. (i.e. `code` for VSCode, `subl` for Sublime Text) Shellnotes will automatically locate the program's location and apply the changes. If the name is invalid, the operation will stop.

## How shellnotes works with directories
Shellnotes will create a new directory in your home folder named "Notes", where it will store all your notes. Every time you open your terminal, it will check whether this folder exists, and create one if not.

## Change default Note folder
To change the default note path, type `shellnotes --set-defaults` in the terminal, or run the file `set_defaults.sh` from ~/.shellnotes/ [manually](https://github.com/dmarakom6/shellnotes/blob/master/docs/run.txt).
Select option 3 to change the default Notes folder, or option 4 to check the current one.
If you choose option 3, type a valid __relative__ path to the new directory with permissions given. Shellnotes will automatically change the default folder to the new one. Your notes will be transfered there as well!
> Note: You can check the current Notes folder either via "shellnotes -sd, option 4", or "listnotes --folder".  

# Taking your first note
You can either use `newnote` for regular notes, or `quicknote` for an in-terminal experience.
## Using `newnote`
Open a terminal window after installing shellnotes. Type `newnote` and the name of the new note's name. If you don't set a name after the command as a parameter, shellnotes will ask you for it with a dynamic input.
It should look like this:
```
user@device:folder$ newnote helloWorld => no extension needed!
```
or:
```
user@device:folder$ newnote
Enter note name: helloWorld
```
Then, the [default regular notes editor](#the-default-note-editors) window will pop-up. Take your notes, save the file, done!
## Using `quicknote`
Open the terminal. Type `quicknote` and the name of the new note's name. If you don't set a name after the command as a parameter, shellnotes will ask you for it again.
It's similar to `newnote`:
```
user@device:folder$ quicknote helloWorld => no extension needed!
```
or:
```
user@device:folder$ quicknote
Enter note name: helloWorld
```
`quicknote` will then open the [default quick notes editor](#the-default-note-editors). Now you can start saving your notes via terminal.
### Reading notes
You can also read your notes in a similar way, using `readnote` and `quickread`. See more in the [commands file](https://github.com/dmarakom6/shellnotes/blob/master/docs/commands.txt).

# Learn everything shellnotes can do
shellnotes is more than just that. Here's some documentation you might be interested in:  
* [how to delete shellnotes](https://github.com/dmarakom6/shellnotes/blob/master/docs/uninstalling.txt)  
* [how to disable or enable shellnotes](https://github.com/dmarakom6/shellnotes/blob/master/docs/disabling.txt)  
* [how to update shellnotes](https://github.com/dmarakom6/shellnotes/blob/master/docs/updating.txt)  
* [how to set the default note editors and Note folder for shellnotes](https://github.com/dmarakom6/shellnotes/blob/master/docs/setdefaults.txt)  
* [learn how to use shellnotes' auto-update feature](https://github.com/dmarakom6/shellnotes/blob/master/docs/auto-update.txt)  
* [learn shellnotes' commands](https://github.com/dmarakom6/shellnotes/blob/master/docs/commands.txt)  
* [learn which files to run manually if needed](https://github.com/dmarakom6/shellnotes/blob/master/docs/run.txt)  
* [contact the author](https://github.com/dmarakom6/shellnotes/blob/master/docs/auths/author.txt)  
* [check the software requirements](https://github.com/dmarakom6/shellnotes/blob/master/docs/system/requirements.txt)  
* [see the license](https://github.com/dmarakom6/shellnotes/blob/master/docs/github/RIGHTS.txt)  
* [see what versions are supported](https://github.com/dmarakom6/shellnotes/blob/master/docs/github/SECURITY.md)  
* [get more info about shellnotes](https://github.com/dmarakom6/shellnotes/blob/master/docs/help)  
Want even more information? Feel free to see the whole [shellnotes documentation](https://github.com/dmarakom6/shellnotes/blob/master/docs/)!  


# Warnings!

*WARNING*: The default shell for shellnotes is bash. However, shellnotes will find your shell if it's different and continue installing according to it. If your shell is not supported though, the installation will fail.

*WARNING*: install.sh must be run from the folder where it was downloaded WITH the other files from the repo. Otherwise, installation will fail. (see [installation documentation](https://github.com/dmarakom6/shellnotes/blob/master/docs/installing.txt) for more).