infile="data.txt"
outfile="result.txt"

echo "Here is some text with an email dmytro.i.hrytsiuk@ukd.edu.ua, test@gmail.com and example@mail.com" > $infile
echo "Server 1 is at 192.168.1.10, server 2 is at 10.0.0.5, server 3 is at 0.0.0.0" >> $infile

test_string="DevOps2026"
# ^ - sets a carret at the start of the string, looks for  "DevOps" string and then
# checks is there are numbers after it ("[0-9]+" - at least one or more digits)
# $ is the end of the line, if there is any text after it the script flags it as a wrong match
# same way ^ flags any string before "DevOps" as a wrong match
# thus stringDevOps2026, DevOps2026x or "DevOps"(no numbers) will be flaged as a wrong match
if [[ $test_string =~ ^DevOps[0-9]+$ ]]; then
    echo "String matches the DevOps[number] pattern"
fi


echo "Starting data extraction..."
# array of 2 ints as we only need 2 steps: find IP and find email
for i in 1 2; do
	# look for IPs in the step 1
	# -E extends grep's regex, making it understand modern symbols
	# -o prints only the matching value of the string, instead of the whole string by default
	# regex looks for the standard IPv4 pattern n.n.n.n, n being numbers containing from 1 to 3 digits
	# so () group the [0-9]{1,3}\. expression, making the script to look for 3 groups of values
	# then after those values are found, script looks for the last group of digits via [0-9]{1,3}
	# this time without the dot, since it's the end of the IPv4 pattern
    if [ $i -eq 1 ]; then
        echo "Step $i: Extracting IPs..."
        grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}" $infile > $outfile
    # basic gmail pattern is username, "@", mail, ".", and domain like "com"
    # hence first we match for username: [a-zA-Z0-9._%+-] looks for any string value with
    # letters (case insensitive) and common symbols found in usernames
    # + afterwards means at least on of the characters in the set or more
    # @ matches the "@" symbol
    # [a-zA-Z0-9.-]+ matches for the mail name (along with some special symbols used in them)
    # again, + indicated there has to be at least one or more symbols from the available set
    # \. looks for the dot
    # and [a-zA-Z]{2,} looks for the domain name
    # which can contain character from a to z(case insensitive)
    # {2,} means that there must be at least 2 characters from the available set (or more)
    else
        echo "Step $i: Extracting Emails..."
        grep -E -o "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" $infile >> $outfile
    fi
done

echo "Extraction complete. Check $outfile."
