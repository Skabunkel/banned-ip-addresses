

cat banned-ips.txt | while read line
do 
  fail2ban-client set sshd banip "$line"
done