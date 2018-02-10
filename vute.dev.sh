#!/bin/bash
. functions/defFunction.sh
# Comment to disable Debug Function
DeBug
#Include default Variables
. functions/defVars.sh
# Print banner
bannervUte
# Defaults vUte Parameters
###############################
timeout=5
threads=10
dictionary=wordlist.txt
###############################
while getopts "c:t:r:d:hlu" opt; do
	case $opt in
		t)
			timeout=$OPTARG
		;;
		r)
			threads=$OPTARG
		;;
		d)
			dictionary=$OPTARG
		;;
		u)
		        updatevUte
			exit 0
		;;
                l)
			echo " > Printing License :";
                        licensevUte
			exit 0
		;;
		h)
			echo " > Printing Usage :";
						printUsage
			exit 0
                ;;
		c)
			container=$OPTARG
		;;
		\?)
			echo " > ! ERROR -> Invalid option: $OPTARG";
			exit 1
		;;
	esac
done
if [ $OPTIND -eq 1 ];
	then
		echo -e " > $RED! ERROR$RES -> No options were passed, -d is mandatory"
		echo " > TIP -> Use $0 -h for usage."
		exit 1;
fi
shift $((OPTIND-1))


function bruteVeracrypt() {
if [ $container == 0 ];
	then
		echo " > ! ERROR -> No Container was specified" ; 
		exit 1;
fi

cat <<EOF
 > Starting vUte...
 > Timeout = $timeout
 > Threads = $threads
 > Wordlist = $dictionary
 > Container = $container
EOF

while IFS='' read -r passwd || [[ -n "$passwd" ]]; do
    echo -e " > Testing Password : $WHITE$passwd$RES";
    timeout $timeout echo BRUTE ;
done < "$dictionary"

echo $vuteline
}
########################## Start vUte ##########################################
bruteVeracrypt

