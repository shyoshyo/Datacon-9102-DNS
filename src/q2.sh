#!/bin/sh

tshark -r q2_final.pcap -Y 'dns and udp and dns.flags.opcode == 0 and dns.qry.class == 0x1 and not dns.qry.name in {msn.com access-board.gov weilaigou.com hrsa.gov unionpaysecure.com tsinghua.edu.cn english.gov.cn weibo.com "<Root>" "" " " sina.com tsinghua.org.cn kprule.com join-tsinghua.edu.cn xn--r-5gn qq.com baidu.com taobao.com localhost 163.com sohu.com apple.com xunlei.com hao123.com aminer.org alertmanager-bot github.com smth.edu.cn local weibo.cn goldenfrog.com google.com cngi-6ix-inetboss cngi-tein4-inetboss cernet-inetboss twitter.com instagram.com cernet100g-inetboss mail sina.cn t.cn sina.com.cn tsinghua.edu fedoraproject.org yahoo.com sandrotracker.biz asnet.pw dns2.edu.cn}' -w filtered.pcap


echo "domain,family" > dga.csv

# padcrypt
tshark -r filtered.pcap -Y "ip.addr in {6.190.219.69 115.70.220.26 192.255.137.105 207.208.6.4 204.115.252.114 91.4.216.203 208.151.203.20 37.221.16.169 132.177.237.57 24.60.165.236}" -T fields -e dns.qry.name | sort -u | awk '{print $1",1"; split($1, tmp, "."); if(length(tmp[1]) != 16){exit -1}}' >> dga.csv

# dyre
tshark -r filtered.pcap -Y 'dns.qry.name ~ "^[a-z][0-9a-f]{33}[.].*$"' -T fields -e dns.qry.name | sort -u | awk '{print $1",2"}' >> dga.csv

# gameover
tshark -r filtered.pcap  -Y 'ip.addr in {61.6.177.74 183.77.59.102 161.76.32.19 243.162.172.198 66.72.168.139 95.236.124.207 208.213.170.82 111.162.252.19 18.37.227.134 2.132.85.31       146.65.146.175 25.240.174.111 179.117.6.212 111.1.7.121 142.243.157.58 123.115.59.126 12.208.142.22 245.120.44.253 238.179.106.148 225.219.8.65}' -T fields -e dns.qry.name | sort -u | awk '{print $1",3"}' >> dga.csv

# chinad
tshark -r filtered.pcap  -Y 'ip.addr in {168.73.33.96 61.71.169.229}' -T fields -e dns.qry.name | sort -u | awk '{print $1",4"}' >> dga.csv

# cryptolocker
tshark -r filtered.pcap  -Y 'ip.addr in {46.211.159.85 12.115.229.246 237.120.4.103 39.91.49.17 198.204.228.172 67.129.139.69 229.219.138.38 215.86.197.17 231.152.97.222 38.99.249.103 151.53.146.223 198.106.68.181 229.170.61.153 117.247.154.226 243.80.76.223 157.95.206.51 247.231.175.76 2.81.160.51 50.164.5.12 101.145.36.12 36.70.137.174 224.22.218.24 62.140.219.52 142.8.246.210 98.46.139.147 191.141.87.109 178.153.53.90 49.159.192.63 10.68.124.213 57.174.14.232}' -T fields -e dns.qry.name | sort -u | awk '{print $1",5"}' >> dga.csv

# mydoom
tshark -r filtered.pcap  -Y 'ip.addr in {118.129.22.83 11.85.145.177 155.160.69.223 66.252.209.43 132.201.172.28 214.79.15.107 85.66.116.26 192.197.115.238 13.62.120.217 233.135.17.164 45.73.58.186 220.108.180.170 254.22.70.71 86.170.170.130 29.46.48.78 37.143.23.6}' -T fields -e dns.qry.name | sort -u | grep -E "[aehmnpqrsw]{10}[.](com|biz|us|net|org|ws|info|in)" | awk '{print $1",6"}' >> dga.csv

# matsnu
tshark -r filtered.pcap  -Y 'ip.addr in {73.215.129.90 38.244.120.125 34.75.40.197 9.20.59.5 172.240.230.108 80.73.136.33 169.158.220.250 9.226.197.197 141.33.53.219 161.241.36.80 17.123.183.188 196.35.172.140 48.213.234.67 6.28.22.42 251.106.251.147 81.129.11.213 14.21.193.151 242.164.52.29 179.142.202.59 112.70.21.100 15.135.164.146 63.211.3.204 121.199.183.247 158.91.82.212 210.21.14.166 132.111.40.100 192.28.126.76 89.63.177.188 97.249.3.167 134.109.87.249}' -T fields -e dns.qry.name | sort -u | awk '{print $1",7"}' >> dga.csv

# murofet
tshark -r filtered.pcap  -Y 'ip.addr in {16.69.196.83 44.192.244.210 193.196.137.125 12.211.199.176 134.88.252.35 132.238.83.185 213.99.215.146 175.54.92.134 97.37.172.10 198.46.140.162 118.195.207.193 243.121.122.250 219.93.195.165 182.94.215.21 67.246.117.153 71.33.240.198 157.227.83.6 205.215.81.221 32.7.149.17 44.30.226.245}' -T fields -e dns.qry.name | sort -u | awk '{print $1",8"}' >> dga.csv

# conficker
tshark -r filtered.pcap  -Y 'ip.addr in {46.146.152.237 167.8.145.47 15.187.78.172 144.75.150.97 139.33.104.134 44.104.178.105 168.83.103.255 207.169.77.215 89.89.143.48 5.234.37.13 244.245.153.199 88.156.186.190 232.133.159.108 213.138.78.224 112.169.88.66 34.248.80.1 224.204.102.220 195.96.148.131 13.143.16.85 114.33.143.6 33.88.55.242 214.26.39.53}' -T fields -e dns.qry.name | sort -u | grep -v '^mail.com$' | grep -v '^v00d00.org$'  | awk '{print $1",9"}' >> dga.csv

# nymaim
tshark -r filtered.pcap  -Y 'ip.addr in { 231.17.127.66 181.236.87.100 246.177.125.5 109.239.47.243 110.4.97.194 206.223.217.201 237.24.185.175 48.78.87.97 230.161.69.80 203.104.120.107 252.226.79.107 122.32.204.250 115.81.137.241 139.144.49.41 19.19.119.174 182.18.243.199 78.136.122.185 91.234.240.165 47.206.131.40 59.7.59.175 116.129.183.208 116.129.183.208 }' -T fields -e dns.qry.name | sort -u | grep -v '^gefesosexwithjimmy.org$' | grep -v '^microsoft.com$' | awk '{print $1",10"}' >> dga.csv


cat dga.csv | tail -n+2 | awk -F, 'BEGIN{} {if(hash[$1] == 1){print "error dup: " $1}else{hash[$1] = 1} {count[$2] += 1; sum += 1}} END {print "=== summary ==="; for(i in count) print i, count[i]; print "sum = ", sum; print "==============="}'


name='submit__'$(date "+%Y_%m_%d_%H_%M_%S")'.zip'

echo $name
zip -r $name dga.csv writeup.pdf code.zip 
