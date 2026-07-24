#!/bin/bash

echo "Starting database restore..."

BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]
then
    echo "Usage: ./restore.sh backup_file.sql"
    exit 1
fi

CONTAINER="employee-postgres"
DATABASE="employee"
USER="postgres"


echo "Terminating active database connections..."

docker exec -i $CONTAINER psql -U $USER postgres <<EOF
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname='$DATABASE'
AND pid <> pg_backend_pid();
EOF


echo "Dropping existing database..."

docker exec -i $CONTAINER psql -U $USER postgres <<EOF
DROP DATABASE IF EXISTS $DATABASE;
CREATE DATABASE $DATABASE;
EOF


echo "Restoring backup..."

cat $BACKUP_FILE | docker exec -i $CONTAINER psql -U $USER $DATABASE


if [ $? -eq 0 ]
then
    echo "Restore completed successfully"
else
    echo "Restore failed"
    exit 1
fi


echo "Checking restored data..."

docker exec -i $CONTAINER psql -U $USER $DATABASE -c "SELECT COUNT(*) FROM employees;"
