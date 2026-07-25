#!/bin/bash

echo "Starting database restore..."

BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]
then
    echo "Usage: ./restore.sh backup_file.sql"

    ./backup/notify.sh "❌ Database Restore Failed
Reason: No backup file provided
🖥️ Host: $(hostname)
⏰ Time: $(date)"

    exit 1
fi


echo "Dropping existing employee database..."


docker exec -i employee-postgres psql -U postgres <<EOF
DROP DATABASE IF EXISTS employee WITH (FORCE);
CREATE DATABASE employee;
EOF


echo "Restoring backup..."


cat $BACKUP_FILE | docker exec -i employee-postgres psql -U postgres employee


if [ $? -eq 0 ]
then

    echo "Restore completed successfully"

    ./backup/notify.sh "✅ Database Restore Successful
📦 Database: employee
📁 Backup: $BACKUP_FILE
🖥️ Host: $(hostname)
⏰ Time: $(date)"

else

    echo "Restore failed"

    ./backup/notify.sh "❌ Database Restore FAILED
📦 Database: employee
📁 Backup: $BACKUP_FILE
🖥️ Host: $(hostname)
⏰ Time: $(date)"

fi
