#!/bin/sh

LISTENING_PORT=${LISTENING_PORT:="8080"}
DESTINATION_ADDRESS=${DESTINATION_ADDRESS:="www.google.com"}
DESTINATION_PORT=${DESTINATION_PORT=:"80"}
DEBUG=${DEBUG=:"false"}

echo "Listening on port: ${LISTENING_PORT}"
echo "Destination address: ${DESTINATION_ADDRESS}"
echo "Destination port: ${DESTINATION_PORT}"
echo "Component tag: ${POD_TAG}"
echo "Debug Enabled: ${DEBUG}"

sed -i "s|listening_port|${LISTENING_PORT}|g" /etc/Caddyfile
sed -i "s|destination|${DESTINATION_ADDRESS}|g" /etc/Caddyfile
sed -i "s|port|${DESTINATION_PORT}|g" /etc/Caddyfile
sed -i "s|podtag|${POD_TAG}|g" /etc/Caddyfile

if [ $DEBUG == "true" ]
then
    #line 4 has the debug log
    echo "Debug is enabled!"
    sed -i '4s/^/#/' /etc/Caddyfile 
else
    #line 3 has the debug log
    sed -i '5s/^/#/' /etc/Caddyfile
fi

echo "Starting Proxy"
/usr/bin/caddy --conf /etc/Caddyfile --http2=false
