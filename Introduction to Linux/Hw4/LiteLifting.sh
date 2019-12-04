#Alperen UGUS
#CWID: 10864101

echo "This file has $(cat $1 | wc -m) characters in it."

echo "This file has $(cat $1 | tr -d '\n' |wc -m) characters not counting newline."

echo "This file has $(grep -c ^$ $1) empty lines."

echo "This file has $(cat $1 | tr -d '\n' | sed 's/[^a-zA-Z0-9]//g' | wc -m) alphanumeric characters."

lineFour=$(cat $1 | sed -n 3p)

echo "The 4th word of the 3rd line of text is /$(echo $lineFour | awk '{print $4}')/"

capital=$(cat $1 | sed ':a;N;$!ba;s/\n/ /g')
echo "$capital" | grep -q "Capital Idea"

if [ $? -eq 0  ]; then
	tr '[A-Z]' '[a-z]' < $1 > "$1.lc"
fi
