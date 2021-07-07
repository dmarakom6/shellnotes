#See what's new after opening your terminal

echo -n "Shellnotes is running version 3.5 for the first time.\nWant to see what's new?(Y/N): " && read show

case $show in
	y | yes | Y | Yes | YES )
		less ~/.shellnotes/whatsnew.txt	
		clear
		sed -i /whatsnew/d ~/.shellnotes/.shellnotes.sh
		rm -f ~/.shellnotes/whatsnew.txt
		rm -f ~/.shellnotes/whatsnew.sh
esac
