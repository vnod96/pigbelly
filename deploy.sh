#!/bin/bash
 
echo 'Starting to Deploy...'
ssh ubuntu@pigbelly.duckdns.org " sudo docker image prune -f 
        cd pigbelly-bin
        sudo docker-compose down
        git fetch origin
        git reset --hard origin/main  &&  echo 'You are doing well'
        sudo docker-compose build && sudo docker-compose up -d
        "
echo 'Deployment completed successfully'