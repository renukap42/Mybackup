DATE=`date +"%d_%b_%Y_%H%M"`
SQLFILE=/home/renuka/mybackup/db_backup_${DATE}.sql
DATABASE="wordpress"
USER="renuka"
PASSWORD="root@123"

mysqldump --no-tablespaces --skip-lock-tables -u ${USER} -p${PASSWORD} ${DATABASE}|gzip > ${SQLFILE}.gz
aws s3 cp ${SQLFILE}.gz s3://mydemobackup
sudo find /home/renuka/mybackup/. -mtime +10 -exec rm {} \;


