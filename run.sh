#!/bin/sh

LISTENING_PORT=${LISTENING_PORT:="8080"}
DESTINATION_ADDRESS=${DESTINATION_ADDRESS:="www.google.com"}
DESTINATION_PORT=${DESTINATION_PORT=:"80"}

echo "Listening on port: ${LISTENING_PORT}"
echo "Destination address: ${DESTINATION_ADDRESS}"
echo "Destination port: ${DESTINATION_PORT}"

sed -i "s|listening_port|${LISTENING_PORT}|g" /etc/Caddyfile
sed -i "s|destination|${DESTINATION_ADDRESS}|g" /etc/Caddyfile
sed -i "s|port|${DESTINATION_PORT}|g" /etc/Caddyfile

echo "Starting Proxy"
/usr/bin/caddy --conf /etc/Caddyfile --http2=false 
