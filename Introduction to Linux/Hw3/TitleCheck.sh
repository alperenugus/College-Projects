#ALPEREN UGUS
#CWID : 10864101
LC_COLLATE=C

echo "Enter a title:"
read TITLE

for token in _${TITLE}
do
	case "${token}" in
		a|an|in|out|to|from|for|the|of )
			;;

		A|An|In|Out|To|From|For|The|Of )
			echo "'${token}' should NOT be capitalized."
			;;
		_* )
			if [[ "${token:1:1}" =~ [a-z] ]]; then
				echo "'${token:1}' should be capitalized."
			fi
			;;
		* )
			if [[ "${token:0:1}" =~ [a-z] ]]; then
				echo "'${token}' should be capitalized."
			fi
			;;
	esac

done


