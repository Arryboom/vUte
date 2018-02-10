#!/bin/bash

# Standard Debug function
function DeBug() {
exec 5> >(logger -t $0)
BASH_XTRACEFD="5"
PS4='$LINENO: '
set -x
echo -e " > \033[00;31m!!\033[0m Debug mode ON"
}
# END Debug function

# Print License 
function licensevUte() {
cat <<EOF

Copyright (c) $year Pawel 'okno' Zorzan Urban

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
$vuteline

EOF
#exit 0
}

# Print Banner 
function bannervUte() {
	if [ -e "$lolcatpath" ]; then
    	catcmd=$lolcatpath
	else 
    	catcmd=cat
	fi 
$catcmd <<EOF
$vuteline
       _   _ _         _   ____  
__   _| | | | |_ ___  / | |___ \ 
\ \ / / | | | __/ _ \ | |   __) |
 \ V /| |_| | ||  __/ | |_ / __/ 
  \_/  \___/ \__\___| |_(_)_____|

	VeraCrypt Bruteforcer : version 1.2
        Created by:  Pawel 'okno' Zorzan Urban
        Report bugs: mail@pawelzorzan.eu
        Homepage:    https://www.pawelzorzan.eu
	License :    MIT ($year)
$vuteline

EOF
}

#Print Usage
function printUsage() {
    cat <<EOF

    Usage :

    $0 [-t timeout INT] [-r threads INT ] [-d dictionary FILE]
       [-u update] [-l license] [-h help] [-c container.veracrypt FILE]

    -c container.veracrypt
	Veracrypt container to bruteforce. Default NOT SET(Mandatory)

    -t timeout
        Number of seconds to wait for Veracrypt completion. Default value: $timeout

    -r threads
        Threads to run. Default value: $threads.

    -d dictionary
        Wordlist file to use. Default value: $dictionary

    -u update
	Update and Exit 0
        Update vUte from official GitHub (https://github.com/okno/vUte)

    -l license
        Print License and Exit 0

    -h help
	Print help options and Exit 0
$vuteline

EOF
}

# Update from github repo
function updatevUte() {
			echo " > Updating..."
			wget "https://raw.githubusercontent.com/okno/vute/master/vute.sh" -q -O vute.sh.new
			updok=$?
			if [ $updok == "0" ]
				then
  					echo -e " >$GREEN Successfully downloaded!$RES"
					  while true; do
    					read -p " > Do you wish to update the script (this will overwrite the old one)?" yn
    					case $yn in
      					[Yy]* ) mv vute.sh.new vute.sh; break;;
       					[Nn]* ) exit;;
       					 * ) echo " > Please answer yes or no.";;
    					esac
						done
  						echo -e " >$GREEN Successfully updated!$RES"
					  	exit 0
				else
 					echo -e " > $RED! ERROR$RES -> Check yout proxy or Internet Connection." 
  					echo $vuteline
					exit 1
			fi
}