NewIps=$(fail2ban-client status sshd | grep -oP "Banned IP list:\K.*" | xargs | sed -r 's/ /\n/g')

echo "$NewIps" > tmp.txt
cat banned-ips.txt >> tmp.txt

cat tmp.txt | sort | uniq >> banned-ips.txt
rm tmp.txt