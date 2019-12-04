#Alperen UGUS
#CWID: 10864101

while true; do
	echo "Pick a quote-sayer from:"
	for file in *
	do
		echo $file
	done

	echo "... or enter QUIT to exit the script."

	read INPUT

	if [ "$INPUT" == "QUIT" ]; then
		exit 0
	fi

	if test -f "$INPUT/quote.txt"; then
		echo "$INPUT said ..."
		cat $INPUT/quote.txt
	else
		exit 7
	fi
	echo
done
