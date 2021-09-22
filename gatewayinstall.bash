#!/bin/bash
#Конфиг для быстрой установки WebMin
#Ставился на сервер, который использовался как шлюз, в давние времена
#Configuring Webmin
echo "deb http://download.webmin.com/download/repository sarge contrib" >>/etc/apt/sources.list
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
apt-get update
apt-get install -y webmin
apt-get install -y motion
#Configurng Network interface to local
exec 1>>/etc/network/interfaces
echo "#The second interface to the local"
echo "auto eth1"
echo "iface eth1 inet static"
echo "   address {ADDRESS}"
echo "   netmask {MASK}"
echo "pre-up iptables-restore < /etc/iptables.up.rules"
echo "up route add -net {192.168.1.0} netmask 255.255.255.0 dev eth1"
echo "up route add -net 0.0.0.0 netmask 255.255.255.0 dev eth0"
exec 1>&-
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables-save > /etc/iptables.up.rules
exec 1>>/etc/sysctl.conf
echo "net.ipv4.ip_forward=1"
exec 1>&-
#Configuring DHCP
apt-get install -y isc-dhcp-server
exec 1>>/etc/dhcp/dhcpd.conf
echo "# giprodhcp"
echo "subnet 192.168.62.0 netmask 255.255.255.0 {"
echo "       option domain-name-servers {DNS1} , {DNS2};"
echo "       option broadcast-address {BROADCAST(255)};"
echo "       option subnet-mask 255.255.255.0;"
echo "       option routers {ADDRESS};"
echo "       range {DHCP_POOL_START} {DHCP_POOL_END};"
echo "       }"
exec 1>&-
reboot
