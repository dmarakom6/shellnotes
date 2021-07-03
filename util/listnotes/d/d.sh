:<<'info'
shellnotes - d.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

export LESSCHARSET=utf-8

chmod +x ~/.shellnotes/util/listnotes/d/d.py
python3 ~/.shellnotes/util/listnotes/d/d.py | less #> ~/.shellnotes/util/listnotes/output/dout.txt
