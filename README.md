# BLOCK_BY_ASN
VERY hacky, I mean REALLY hacky script that works...Block by entire ASN Number

Quite easy, It will scan through your /var/log/auth.log file for brute force shit....

yada yada yada....Expand if you like. 

grep -E '(BREAK-IN|Invalid user|Failed|refused|Illegal)' /var/log/auth.log | rev | cut -d\  -f4 | rev | sort -u > host.txt

grab the entire ASN (Mainly China, Sorry China!!) then block everything that exists under that ASN (reject-with icmp-port-unreachable)


