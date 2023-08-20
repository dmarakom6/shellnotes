:<<'info'
shellnotes - gh_token.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

ght() {
	echo -n "Enter your Github Gists Token: " && read input
	if [ -z "$input" ]; then
		echo "No input given."
		return 1
	else
		echo "GH_TOKEN=$input" > ~/.shellnotes/sne/.env && echo "Successfully saved token to ~/.shellnotes/sne/.env .\nDo not share it with anyone."
	fi
}

case $1 in -ght|--set-github-token )
	if [ -s ~/.shellnotes/sne/.env ]; then
		str="Your Github Gists Token" 
		underlines=$(echo "$str" | tr -c '\010' '-')
		echo "$str\n$underlines"
		cat ~/.shellnotes/sne/.env
		echo "\n\nThis will be used when pasting your notes as gists via SnE (Shellnotes Notes Editor)."
		echo -n "Would you like to change it? [Y/N]: " && read input
		case $input in Yes|y|Y|yes|YES )
			ght
		esac
	else
		echo "No Github Gists Token Found."
		ght
	fi
		
esac