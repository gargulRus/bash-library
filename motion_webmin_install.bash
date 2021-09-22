#!/bin/bash
#Скрипт для быстрой установки WebMin+Motion
#Configuring Webmin
echo "deb http://download.webmin.com/download/repository sarge contrib" >>/etc/apt/sources.list
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
apt-get update
apt-get install -y webmin
apt-get install -y motion
reboot
