#!/bin/bash
#Пример копирования файлов через Rsync
#За монтирование директорий отвечал другой скрипт, стартовавший при старте системы,
#а так же при перед каждым заданием на бэкап
otherbackup () {

mess1="$(date +"%y-%m-%d %T") $@ Бэкап ЭлАрхив-начат"
curl -s -X POST https://api.telegram.org/bot{BOT_TOKEN}/sendMessage -d chat_id=416641360 -d text="$mess1"
rsync -auvv /home/public /home/other
mess2="$(date +"%y-%m-%d %T") $@ Бэкап ЭлАрхив-закончен"
curl -s -X POST https://api.telegram.org/bot{BOT_TOKEN}/sendMessage -d chat_id=416641360 -d text="$mess2"

mess1="$(date +"%y-%m-%d %T") $@ Бэкап Договора-начат"
curl -s -X POST https://api.telegram.org/bot{BOT_TOKEN}/sendMessage -d chat_id=416641360 -d text="$mess1"
rsync -auvv /home/dogovora /home/other
mess2="$(date +"%y-%m-%d %T") $@ Бэкап Договора-закончен"
curl -s -X POST https://api.telegram.org/bot{BOT_TOKEN}/sendMessage -d chat_id=416641360 -d text="$mess2"

mess1="$(date +"%y-%m-%d %T") $@ Бэкап Настя-начат"
curl -s -X POST https://api.telegram.org/bot{BOT_TOKEN}/sendMessage -d chat_id=416641360 -d text="$mess1"
rsync -auvv /home/design /home/other
mess2="$(date +"%y-%m-%d %T") $@ Бэкап Настя-закончен"
curl -s -X POST https://api.telegram.org/bot{BOT_TOKEN}/sendMessage -d chat_id=416641360 -d text="$mess2"

}
otherbackup