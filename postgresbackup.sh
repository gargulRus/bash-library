#!/bin/bash
#Скрипт для бэкапов баз 1С на PostgreSql
#И их обслуживания. Скрипт запускается в 2 часа ночи, что бы гаранированно небыло клиентских подключений
mount -o username={USER},password={HOST} //{HOST}/{PATH}/{TODIR} /home/user1c/postbackup/
BACKUPDIR="/home/user1c/postbackup"
DATA=-`date +%d-%a-%R`

PGPASSWORD="8zjsrraU%" pg_dump -U postgres giprobuh | pigz > $BACKUPDIR/giprobuh$DATA.sql.gz
PGPASSWORD="8zjsrraU%" pg_dump -U postgres giprozup1 | pigz > $BACKUPDIR/giprozup1$DATA.sql.gz
PGPASSWORD="8zjsrraU%" pg_dump -U postgres giproregionbuh | pigz > $BACKUPDIR/giproregionbuh$DATA.sql.gz
PGPASSWORD="8zjsrraU%" pg_dump -U postgres giproregionzup | pigz > $BACKUPDIR/giproregionzup$DATA.sql.gz
PGPASSWORD="8zjsrraU%" pg_dump -U postgres ipkukshin | pigz > $BACKUPDIR/ipkukshin$DATA.sql.gz

echo 'done'

vacuumdb --full --analyze --username postgres --dbname giprobuh
reindexdb --username postgres --dbname giprobuh
vacuumdb --full --analyze --username postgres --dbname giprozup1
reindexdb --username postgres --dbname giprozup1
vacuumdb --full --analyze --username postgres --dbname giproregionbuh
reindexdb --username postgres --dbname giproregionbuh
vacuumdb --full --analyze --username postgres --dbname giproregionzup
reindexdb --username postgres --dbname giproregionzup
vacuumdb --full --analyze --username postgres --dbname ipkukshin
reindexdb --username postgres --dbname ipkukshin