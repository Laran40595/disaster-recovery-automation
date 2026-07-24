#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_DIR="./database-backups"

CONTAINER="employee-postgres"

DATABASE="employee"

USER="postgres"


mkdir -p $BACKUP_DIR


echo "Starting PostgreSQL backup..."


docker exec -t $CONTAINER pg_dump -U $USER $DATABASE > $BACKUP_DIR/employee_backup_$DATE.sql


if [ $? -eq 0 ]; then
    echo "Backup completed successfully"
    echo "Backup file:"
    ls -lh $BACKUP_DIR
else
    echo "Backup failed"
fi
