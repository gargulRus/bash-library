#!/bin/bash
#Пример аналогичный скриптам backup
#С той разницей, что тут внутри запускаются разные скрипты сторонние
#В идеале, туда бы еще передавать параметры.
if test -d /home/obmen/Roman/
then
mess1="$(date +"%y-%m-%d %T") $@ Бэкап Обмен-начат"
rsync -auvv /home/obmen /home/Obmen >/dev/null 2>&1
mess2="$(date +"%y-%m-%d %T") $@ Бэкап Обмен-закончен"
/home/shscripts/sendobsuc.sh
else echo 'Директория не смонтирована, копирование отменено!'
/home/shscripts/sendobfail.sh
fi
