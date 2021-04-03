#!/bin/zsh


#The first line is the user's default shell found during installation process.
#Warning! If you don't have gedit(text editor) or nano installed, you may have to change the default text editor (lines 10, 25, 40).

#The lines below must NOT be changed.
. ~/.shellnotes/util/getv.sh
. ~/.shellnotes/def/defaults.sh
. ~/.shellnotes/util/ChMkDir.sh

. ~/.shellnotes/util/readnote.sh
. ~/.shellnotes/util/quickread.sh
. ~/.shellnotes/util/quicknote.sh
. ~/.shellnotes/util/newnote.sh
. ~/.shellnotes/util/delnote.sh
. ~/.shellnotes/util/listnotes.sh
. ~/.shellnotes/util/findnote.sh
. ~/.shellnotes/util/findmisplacednote.sh
. ~/.shellnotes/util/renamenote.sh
. ~/.shellnotes/util/noteinfo.sh


. ~/.shellnotes/util/shellnotes.sh


. ~/.shellnotes/util/.hidden/.clearlogs.sh
. ~/.shellnotes/util/.hidden/.resetshellnotes.sh


. ~/.shellnotes/util/syntax/.logsyntax.sh
. ~/.shellnotes/util/syntax/.copr.sh
. ~/.shellnotes/util/syntax/.dir.sh
. ~/.shellnotes/util/syntax/.me.sh
. ~/.shellnotes/util/syntax/.dir.sh
. ~/.shellnotes/util/syntax/.param.sh