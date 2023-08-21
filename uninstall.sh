#!usr//bin/env bash
:<<'info'
shellnotes - uninstall.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info
clear
echo "Choose an option"
echo "----------------"
echo "1.Uninstall shellnotes and delete all files."
echo "2.Disable shellnotes and all its commands, but keep the files in your system."
echo "3.Enable shellnotes."
echo ""
echo -n "[1,2,3]: " && read option

case $option in 1 )
	if [ -e ~/.shellnotes/.shellnotes.sh ]; then
		echo -n "Are you sure you want to delete Shellnotes?[Y/N]: " && read delete
		case $delete in y|Y|YES|Yes|yes )
			cd ~/.shellnotes/
			rm -rfv ~/.shellnotes/.* 2>/dev/null
			rm -f ~/.shellnotes/* 2>/dev/null
			rm -rf ~/.shellnotes/docs 2>/dev/null
			rm -rf ~/.shellnotes/util 2>/dev/null
			rm -rf ~/.shellnotes/ver 2>/dev/null
			rm -rf ~/.shellnotes/logs 2>/dev/null
			rm -rf ~/.shellnotes/def 2>/dev/null
			rm -rf ~/.shellnotes/sne 2>/dev/null
			rm -rf ~/.shellnotes/image 2>/dev/null
			cd ..
			rmdir .shellnotes
			if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
				if grep -q 'source ~/.shellnotes/.shellnotes.sh' ~/.zshrc; then
					sed -i '/shellnotes/d' .zshrc
					clear
					echo "Shellnotes is uninstalled"
					echo "--------------------------"
					echo "It was fun taking notes with you!"
				fi
			elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
				if grep -q 'source ~/.shellnotes/.shellnotes.sh' ~/.bashrc; then
					sed -i '/shellnotes/d' ~/.bashrc
					clear
					echo "Shellnotes is uninstalled"
					echo "--------------------------"
					echo "It was fun taking notes with you!"
				fi
			elif [ -n "`$SHELL -c 'echo $CSH_VERSION'`" ]; then
				if grep -q 'source ~/.shellnotes/.shellnotes.sh' ~/.cshrc; then
					sed -i '/shellnotes/d' ~/.cshrc
					clear
					echo "Shellnotes is uninstalled"
					echo "--------------------------"
					echo "It was fun taking notes with you!"
				fi
			elif [ -n "`$SHELL -c 'echo $KSH_VERSION'`" ]; then
				if grep -q 'source ~/.shellnotes/.shellnotes.sh' ~/.kshrc; then
					sed -i '/shellnotes/d' ~/.kshrc
					clear
					echo "Shellnotes is uninstalled"
					echo "--------------------------"
					echo "It was fun taking notes with you!"
				fi
			elif [ -n "`$SHELL -c 'echo $FISH_VERSION'`" ]; then
				if grep -q 'source ~/.shellnotes/.shellnotes.sh' ~/.fishrc; then
					sed -i '/shellnotes/d' ~/.fishrc
					clear
					echo "Shellnotes is uninstalled"
					echo "--------------------------"
					echo "It was fun taking notes with you!"
				fi
			else
				echo "Your shell is not supported."
			   	cd ~/.shellnotes/util/exec
   				./uninfailed
			   	cd $DIR
			fi
		esac
	else
		echo "An error occured." 
		echo "Shellnotes is not installed."
		cd ~/.shellnotes/util/exec
   		./uninfailed
	    cd $DIR
	fi
esac

case $option in 2 )
	if grep 'return' <~/.shellnotes/.shellnotes.sh >/dev/null; then
		echo "Shellnotes is already disabled."
		cd ~/.shellnotes/util/exec
   		./disfailed
	   	cd $DIR
	else
		sed -i '2 i\return 0 #Shellnotes is disabled by the user. Do not change this line.' ~/.shellnotes/.shellnotes.sh
		echo "Shellnotes is now disabled. To enable, run this script again and choose option (3)."
	fi
esac

case $option in 3 )
	if grep 'return' <~/.shellnotes/.shellnotes.sh >/dev/null; then
		sed -i '2d' ~/.shellnotes/.shellnotes.sh
		echo "Shellnotes is now enabled. Please restart your terminal."
	else
		echo "Shellnotes is already enabled."
		cd ~/.shellnotes/util/exec
   		./enfailed
	   	cd $DIR
	fi
esac


case $option in
	(*[a-zA-Z]* | "" )
		echo "Invalid input."
esac
