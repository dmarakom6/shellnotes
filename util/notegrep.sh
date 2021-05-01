:<<'info'
shellnotes - notegrep.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info


export GREP_OPTIONS='--color=auto' 


:<<'comment'

Here, the color parameter is specified in a grep-specific environment variable.
Then, you don't have to enter it in the command line again.
The "auto" option is selected in order to colorize the output of the "grep"
command every time it is called, unless the output is piped to a command, or 
redirected to a file.

comment


export GREP_COLORS='ms=01;33'


:<<'comment'

Now, change the highlight color of grep by using an environment variable, GREP_COLORS.
An empty string or 0 resets all text styling and resets both colors to the defaults but
does not reset the font to the default. Some options/examples are:

┏━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━
┃ ### ┃ GNOME Terminal          ┃ xterm                   ┃ non-GUI TTY           ┃
┡━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━
│     │ «reset style+colors»    │ «reset style+colors»    │ «reset style+colors»  │
│   0 │ «reset style+colors»    │ «reset style+colors»    │ «reset style+colors»  │
├─────┼─────────────────────────┼─────────────────────────┼─────│
│   1 │ +bold, +brighter color  │ +bold, +brighter color  │ +brighter color,      │
│     │                         │                         │   -forced grey        │
│   2 │ +fainter color          │ +fainter color          │ +forced grey          │
│   3 │ +italic                 │ +italic                 │ +forced green         │
│     │                         │                         │   ● overrides 2 and 4 │
│   4 │ +underline              │ +underline              │ +forced cyan          │
│     │                         │                         │   ● overrides 2       │
│   5 │ «no effect»             │ +blink                  │ «no effect»           │
│   7 │ +invert colors          │ +invert colors          │ +invert colors        │
│   8 │ +invisible              │ +invisible              │ «no effect»           │
│     │                         │   ● underline appears   │                       │
│   9 │ +strikethrough          │ +strikethrough          │ «no effect»           │
├────┼───────────────────────────────────────────────────────────┤                                             Source: https://askubuntu.com/questions/1042234/modifying-the-color-of-grep
│  21 │ -bold, -brighter color, │ +double underline       │ -brighter color,      │
│     │   -fainter color        ├     -forced grey        │                       │
│  22 │ -bold, -brighter color, │ -bold, -brighter color, │ -brighter color,      │
│     │   -fainter color        │   -fainter color        │   -forced grey        │
│  23 │ -italic                 │ -italic                 │ -forced green         │
│  24 │ -underline              │ -underline,             │ -forced cyan          │
│     │                         │   -double underline     │                       │
│  25 │ «no effect»             │ -blink                  │ «no effect»           │
│  27 │ -invert colors          │ -invert colors          │ -invert colors        │
│  28 │ -invisible              │ -invisible              │ «no effect»           │
│  29 │ -strikethrough          │ -strikethrough          │ «no effect»           │
└─────┴─────────────────────────┴─────────────────────────┴──────

In this example, the matching regex is going to be displayed as bold yellow (in most terminals).

comment



function notegrep() {
    if [ $# -eq 0 ]; then
		echo -n "Enter note name: " && read notename
		echo -n "Enter regex: " && read find
	else
		notename=$1
        find=$2
	fi

	if [ -z $notename ]; then
		echo "Invalid input."
		return 0

    elif [ -z $find ]; then
        echo "No key word or character given."
        return 0
    fi

    if [ -e ${DEFAULT_PATH}/${notename} ]; then
        cd $DEFAULT_PATH
        grep $find $notename
    else
        echo "This note doesn't exist in $DEFAULT_PATH."
    fi

 cd $DIR
}