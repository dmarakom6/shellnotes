#See what's new after opening your terminal

echo -n "shellnotes has been updated.\nWant to see what's new?(Y/N): " && read show

case $show in
	y | yes | Y | Yes | YES )
		less ~/.shellnotes/whatsnew.txt	
		sed -i /whatsnew/d ~/.shellnotes/.shellnotes.sh
		rm -f ~/.shellnotes/whatsnew.txt
		rm -f ~/.shellnotes/whatsnew.sh
esac
