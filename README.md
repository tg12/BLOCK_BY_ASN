# BLOCK_BY_ASN
VERY hacky, I mean REALLY hacky script that works...Block by entire ASN Number

Quite easy, It will scan through your /var/log/auth.log file for brute force shit....

yada yada yada....Expand if you like. 

grep -E '(BREAK-IN|Invalid user|Failed|refused|Illegal)' /var/log/auth.log | rev | cut -d\  -f4 | rev | sort -u > host.txt

grab the entire ASN (Mainly China, Sorry China!!) then block everything that exists under that ASN (reject-with icmp-port-unreachable)

Usage (Copy Pasta):

wget https://raw.githubusercontent.com/tg12/BLOCK_BY_ASN/master/script1.sh

chmod u+x

./script1.sh



<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WQ6V6K8ZY6D84">
  <img src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_donateCC_LG.gif" alt="Donate with PayPal" />
</a>
Bitcoin Cash (BCH) - qpz32c4lg7x7lnk9jg6qg7s4uavdce89myax5v5nuk

Ether (ETH) - 0x843d3DEC2A4705BD4f45F674F641cE2D0022c9FB

Litecoin (LTC) - Lfk5y4F7KZa9oRxpazETwjQnHszEPvqPvu

Bitcoin (BTC) - 14Dm7L3ABPtumPDcj3REAvs4L6w9YFRnHK
