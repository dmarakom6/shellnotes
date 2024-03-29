:<<'info'
shellnotes - notegrep.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info


alias grep='grep --color=always'

:<<'comment'

Here, the color parameter is specified in a grep-specific environment variable.
Then, you don't have to enter it in the command line again.
The "always" option is selected in order to colorize the output of the "grep"
command every time it is called, even if the output is piped to a command, or 
redirected to a file.

Also works with: 
export GREP_OPTIONS='--color=auto' 

DO NOT pipe notegrep with less.

comment


export GREP_COLORS='ms=01;33'


:<<'comment'

Now, change the highlight color of grep by using an environment variable, GREP_COLORS.
An empty string or 0 resets all text styling and resets both colors to the defaults but
does not reset the font to the default. Some options/examples are:

┏━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ ### ┃ GNOME Terminal          ┃ xterm                   ┃ non-GUI TTY           ┃
┡━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
│     │ «reset style+colors»    │ «reset style+colors»    │ «reset style+colors»  │
│   0 │ «reset style+colors»    │ «reset style+colors»    │ «reset style+colors»  │
├─────┼─────────────────────────┼─────────────────────────┼─────━━━━━━━━━━━━━━━━━━━
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
├────┼───────────────────────────────────────────────────────────━━━━━━━━━━━━━━━━━                            Source: https://askubuntu.com/questions/1042234/modifying-the-color-of-grep
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
└─────┴─────────────────────────┴─────────────────────────┴──────━━━━━━━━━━━━━━━━━━

In this example, the matching regex is going to be displayed as bold yellow (in most terminals).

comment


export LESSCHARSET=utf-8


:<<'comment'

Do the above for utf-8 support. 

It should also work with:

LANG=
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

comment


function notegrep() {

    DIR="$(pwd)"

    do_grep() {

        if [ -e ${DEFAULT_PATH}/${notename} ]; then
            cd $DEFAULT_PATH
            out="$(grep $regex $notename | wc -l)"
            
            if [ "$(grep -c $regex $notename)" -eq 0 ]; then
                    echo "No matches found."
            else

                if [ $out -gt 20 ]; then
                    grep -i $regex $notename | less
                elif [ $out -le 20 ]; then
                    grep -i $regex $notename
                fi

            fi

        else
            echo "This note doesn't exist in $DEFAULT_PATH."
        fi
        cd $DIR
    }

    check_params() {

        #Function for checking notegrep parameters with three or more options.

        case $option in
            -sc | --split-char)
                . ~/.shellnotes/util/notegrep/sc/sc.sh
        ;;
            -cl | --count-lines )
                . ~/.shellnotes/util/notegrep/cl/cl.sh
        ;;
            -sl | --show-lines )
                . ~/.shellnotes/util/notegrep/sl/sl.sh
        ;;
            -ws | --without-string )
                . ~/.shellnotes/util/notegrep/ws/ws.sh
        ;;
            -m | --multiple )
                cd ~
                if [ "$(python3 ~/.shellnotes/util/notegrep/m/m.py $regex $notename | wc -l)" -ge 25 ]; then
                    python3 ~/.shellnotes/util/notegrep/m/m.py $regex $notename | less -R
                else
                    python3 ~/.shellnotes/util/notegrep/m/m.py $regex $notename
                fi
                cd $DIR
        ;;
            *)
                echo "Invalid parameter. Proceeding in normal grep mode."
                do_grep
        ;;
                
        esac

     return 0
    }

    if [ $# -eq 0 ]; then
        echo -n "Enter regex: " && read regex
        echo -n "Enter note name: " && read notename
        do_grep
    else
        if [ $# -ge 3 ]; then
            export option=$1
            export regex=$2
            export notename=$3
            check_params
            return 0
        else
            regex=$1
            notename=$2
        fi

        #Parameters without three or more options
        case $regex in
            -cf | --count-files )
                export regex=$2
                export option=$1
                . ~/.shellnotes/util/notegrep/cf/cf.sh
                ;;
            -sf | --show-files )
                export regex=$2
                export option=$1
                . ~/.shellnotes/util/notegrep/sf/sf.sh
                ;;
            -sc | --split-char | -cl | --count-lines | -sf | --show-lines | -ws | --without-string | -m | --multiple)
                echo "Invalid use of parameter '$regex'.\nUsage:\nnotegrep [PATTERN] file...\nnotegrep [OPTION] [PATTERN] file...\nnotegrep [OPTION] file...\nnotegrep [OPTION] [PATTERN]"
                ;;
            *)
                if [ -z $notename ]; then
                    echo "Invalid input."
                    cd $DIR
                    return 0

                elif [ -z $regex ]; then
                    echo "No pattern given."
                    cd $DIR
                    return 0
                fi

                do_grep

                ;;
        esac
        

    	
    fi

 unset GREP_OPTIONS
 unset -f check_params
 unset -f do_grep
 cd $DIR
 return 0
}


_notegrep_completion() {
    local cur prev

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"  # Get the previous argument

    # Generate the list of files in the directory
    files=("$DEFAULT_PATH"/*)
    files_list="${files[@]##*/}"  # Extract file names

    case "$prev" in
        notegrep)
            COMPREPLY=( $(compgen -W "-cf -cl -m -sc -sf -sl -ws" -- "$cur") )
            ;;
        *)
            COMPREPLY=( $(compgen -W "${files_list}" -- "$cur") )
            ;;
    esac
}
complete -F _notegrep_completion notegrep