#!/bin/bash
#Скрипт для бэкапа баз MySQL на Веб-Сервере. Запускается каждый день
mount -o username={USER},password={PASS} //{HOST}/{PATH}/{TODIR} /home/basebackup/
BACKUPDIR="/home/basebackup"
DATA=-`date +%d-%a-%R`

mysqldump --user='root' --password='1' giprotable > $BACKUPDIR/backup_giprotable$DATA.sql
mysqldump --user='root' --password='1' mgdatabase > $BACKUPDIR/backup_mgdatabase$DATA.sql
mysqldump --user='root' --password='1' planbase > $BACKUPDIR/backup_planbase$DATA.sql
mysqldump --user='root' --password='1' rdtable > $BACKUPDIR/backup_rdtable$DATA.sql
