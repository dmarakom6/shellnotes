:<<'info'
shellnotes - defaults.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

if [ $(cat "$HOME/.shellnotes/util/shellnotes/sd/sd-input1.txt") = ".shellnotes/sne/sne.py" ]; then
	function NOTES_EDITOR() {
    if [ -n "$1" ]; then
        python3 $(cat $HOME/.shellnotes/util/shellnotes/sd/sd-input1.txt) "$1"
    else
        python3 $(cat $HOME/.shellnotes/util/shellnotes/sd/sd-input1.txt)
    fi
}
else
	NOTES_EDITOR() { eval cat $HOME/.shellnotes/util/shellnotes/sd/sd-input1.txt }
fi

QUICK_NOTES_EDITOR="$(eval cat ~/.shellnotes/util/shellnotes/sd/sd-input2.txt)"
DEFAULT_PATH="$(eval echo $(cat ~/.shellnotes/util/shellnotes/sd/sd-input3.txt))"

