#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_DIR="./database-backups"

CONTAINER="employee-postgres"

DATABASE="employee"

USER="postgres"

mkdir -p $BACKUP_DIR


echo "Starting PostgreSQL backup..."


BACKUP_FILE="$BACKUP_DIR/employee_backup_$DATE.sql"


docker exec -t $CONTAINER pg_dump -U $USER $DATABASE > $BACKUP_FILE


if [ $? -eq 0 ]; then

    echo "Backup completed successfully"

    ls -lh $BACKUP_FILE

    ./backup/notify.sh "✅ PostgreSQL Backup Successful
📦 Database: $DATABASE
📁 File: $BACKUP_FILE
🖥️ Host: $(hostname)
⏰ Time: $DATE"

else

    echo "Backup failed"

    ./backup/notify.sh "❌ PostgreSQL Backup FAILED
📦 Database: $DATABASE
🖥️ Host: $(hostname)
⏰ Time: $DATE"

fi
