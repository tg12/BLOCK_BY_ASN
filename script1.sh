#!/bin/bash

grep -E '(BREAK-IN|Invalid user|Failed|refused|Illegal)' /var/log/auth.log | rev | cut -d\  -f4 | rev | sort -u > host.txt

while read hostname
do

#netcat whois.cymru.com 43 < host.txt | sort -n >  host.txt
whois -h v4.whois.cymru.com "  -v $hostname"

IP=$hostname
REVERSE_IP=$(echo $IP | awk -F "." '{print $4"."$3"."$2"."$1}')
ASN_INFO=$(dig +short $REVERSE_IP.origin.asn.cymru.com TXT)
#PEER_INFO=$(dig +short $REVERSE_IP.peer.asn.cymru.com TXT)
NUMBER=$(echo $ASN_INFO | cut -d'|' -f 1 | cut -d'"' -f 2 | cut -d' ' -f 1)
ASN="$NUMBER"

#THIS IS WHAT I WAS REALLY LOOKING FOR - THE ASN NUMBER
#DEBUG
#echo -e "$ASN"

#ADD TO DODGY ASN FILE
echo $ASN >> badASNs.txt
#cat $ASN >> badASNs.txt

done < host.txt

#REMOVE DUPLICATES - SORT OF!!
sort -u badASNs.txt

while read ASNTOBLOCK
do
#echo "DEBUG:" $ASNTOBLOCK
ASN=$ASNTOBLOCK; for s in $(whois -H -h riswhois.ripe.net -- -F -K -i $ASN | grep -v "^$" | grep -v "^%" | awk '{ print $2 }' ); do echo "  blocking $s"; sudo iptables -A INPUT -s $s -j REJECT &> /dev/null || sudo ip6tables -A INPUT -s $s -j REJECT; done
done < badASNs.txt

#Cleanup after ourselfs
rm badASNs.txt host.txt
