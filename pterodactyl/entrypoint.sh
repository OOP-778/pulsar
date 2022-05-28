#!/bin/bash
cd /home/container || exit

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

export PORT=$SERVER_PORT

cd /pulsar/

# Run the Server
eval ${MODIFIED_STARTUP}
#eval npm run start
