NewIps=$(fail2ban-client status sshd | grep -oP "Banned IP list:\K.*" | xargs | sed -r 's/ /\n/g')

echo "$NewIps" > tmp.txt
cat banned-ips.txt >> tmp.txt

cat tmp.txt | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n | uniq > banned-ips.txt
rm tmp.txt