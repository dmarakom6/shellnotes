#!/usr/bin/env bash
:<<'info'
shellnotes - bash_update.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

dir="$(pwd)"
#Update script only for bash users. See supported shells for installation: help.txt > lines 88-95.
if [ -e ~/.shellnotes/ver/.shellnotes_version ]; then
	#Get the current version.
	VER=$(cat ~/.shellnotes/ver/.shellnotes_version)
	#Get the newer version of the source code from the github repository.
	NEW_VER=$(curl -s https://raw.githubusercontent.com/dmarakom6/shellnotes/master/ver/.shellnotes_version)
else
	echo "Shellnotes is not installed. Try running 'sh install.sh'."
	cd ~/.shellnotes/util/failed
	g++ ufailed.cpp -o ufailed
	~/.shellnotes/util/failed/ufailed
	rm -f ufailed
	cd $dir
	return 0
fi
clear

#colours
RED='\033[0;31m'
LRED='\033[1;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
ORANGE='\033[0;33m' 
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color



#Compare versions
if [ "$VER" = "$NEW_VER" ]; then
	echo "No new update found."
	echo -e "Shellnotes is up to date (version $GREEN$VER$NC)."
else
	echo "Good news!"
	echo "A new shellnotes update is available."
	read -n 1 -p "Would you like to update?[Y/n] " input
	case $input in y|Y|YES|Yes|yes )
		echo
		echo -e "Current version: $RED$VER$NC"
		echo -e "Version to install: $LGREEN$NEW_VER$NC"
		echo -ne "Preparing to update..."
		## spinner takes the pid of the process as the first argument and
		#  string to display as second argument (default provided) and spins
		#  until the process completes.
		spinner() {
		    local delay="0.1"
		    tput civis  # hide cursor
		    i="$(date +%s)"
			j="$(( i + 3 ))"
		    while [ $i -lt $j ]; do
		        printf '\033[s\033[u[ / ] %s\033[u'; sleep "$delay"
		        printf '\033[s\033[u[ — ] %s\033[u'; sleep "$delay"
		        printf '\033[s\033[u[ \ ] %s\033[u'; sleep "$delay"
			    printf '\033[s\033[u[ | ] %s\033[u'; sleep "$delay"
			    i="$(date +%s)"
		    done
		    printf ""  # return to normal
		    tput cnorm  # restore cursor
}
	spinner $!
	echo -ne "Updating..."
	echo
	#(Fake)Progress bar
	echo -ne "                        $RED[0%]$NC\r"
	sleep 0.15
	echo -ne ">                       $RED[5%]$NC\r"
	sleep 0.15
	echo -ne ">>>                     $RED[10%]$NC\r"
	sleep 0.15
	echo -ne ">>>>                    $RED[15%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>                   $LRED[20%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>                  $LRED[25%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>                 $LRED[30%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>                $LRED[35%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>               $ORANGE[40%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>              $ORANGE[45%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>>             $ORANGE[60%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>>>            $ORANGE[65%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>>>>           $YELLOW[70%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>>>>>          $YELLOW[75%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>>>>>>         $YELLOW[80%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>>>>>>>>       $GREEN[85%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>>>>>>>>>>>    $GREEN[90%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>>>>>>>>>>>>>> $GREEN[95%]$NC\r"
	sleep 0.15
	echo -ne ">>>>>>>>>>>>>>>>>>>>>>>>$GREEN[100%]$NC"
	echo -ne "Finishing..."
	spinner $1
	cd ~/.shellnotes/
	wget -q -O master.zip "https://github.com/dmarakom6/shellnotes/archive/master.zip"
	if [ -e master.zip ]; then
		unzip -qqo master.zip
		rm -rf master.zip
		cp shellnotes-master/* shellnotes-master/.* . 2> /dev/null
		mv -f shellnotes.sh .shellnotes.sh
		sleep 0.5
		echo -ne "\r"
		echo -ne ">>>>>>>>>>>>>>>>>>>>$LGREEN[done]$NC                                    "
	else
		echo -ne ">>>>>>>>>>>>>>>>>>>>$RED[failed]$NC                                    "
		cd ~/.shellnotes/util/failed
		g++ ufailed.cpp -o ufailed
		~/.shellnotes/util/failed/ufailed
		rm -f ufailed
		return 0
	fi
	echo -ne '\n'
	#ASCII Art (Don't judge it's still cool)
	echo -e "${ORANGE}   _____ __  __________    __    _   ______  _________________"
	echo -e ' / ___/ / / / / ____/ /   / /   / | / / __ \/_  __/ ____/ ___/'
	echo -e ' \__ \ / /_/ / __/ / /   / /   /  |/ / / / / / / / __/  \__ \'
	echo -e ' ___/ / __  / /___/ /___/ /___/ /|  / /_/ / / / / /___ ___/ / '
	echo -e "/____/_/ /_/_____/_____/_____/_/ |_/\____/ /_/ /_____//____/  $NC"
	echo
    echo -e "Shellnotes has been updated to the latest version $GREEN$NEW_VER$NC"
	echo "Please restart your terminal to complete the update."
	echo "Have fun taking notes!"
	cd $dir                                                      
	esac
fi
