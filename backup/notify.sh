#!/bin/bash

MESSAGE=$1

if [ -z "$SLACK_WEBHOOK_URL" ]; then
    echo "Slack webhook not configured"
    exit 1
fi

curl -X POST \
-H 'Content-type: application/json' \
--data "{\"text\":\"$MESSAGE\"}" \
$SLACK_WEBHOOK_URL
