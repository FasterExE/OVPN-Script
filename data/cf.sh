#!/bin/bash
#random
apt install jq curl -y
rm -rf /etc/domain/d-domain
rm -rf /etc/domain/f-domain
mkdir -p /etc/domain
touch /etc/domain/d-domain
touch /etc/domain/f-domain
clear
sub=$(</dev/urandom tr -dc a-z0-9 | head -c5)
DOMAIN=ilyass.my.id
WS_DOMAIN=ws-${sub}.ovpn.ilyass.my.id
FLARE_DOMAIN=flare-${sub}.ovpn.ilyass.my.id
NS_DOMAIN=ns-${sub}.ilyass.my.id
CF_ID=ilyassnajhi10@gmail.com
CF_KEY=c802b86ce41793d4aed457ad769889b7e31e9
set -euo pipefail
IP=$(curl -sS ifconfig.me);
echo "Updating DNS for ${WS_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${WS_DOMAIN}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
#start-ws
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${WS_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
#end-ws
echo "Updating DNS FLARE for ${FLARE_DOMAIN}..."
#start-flare
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"CNAME","name":"'${FLARE_DOMAIN}'","content":"'${WS_DOMAIN}'","ttl":120,"proxied":true}' | jq -r .result.id)
#end-flare

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${WS_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo "Updating DNS NS for ${NS_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then

#start-ns
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${WS_DOMAIN}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
#end-ns

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${WS_DOMAIN}'","ttl":120,"proxied":false}')
echo "Host WS : $WS_DOMAIN"
echo "Host FLARE: $FLARE_DOMAIN"
echo "Host NS : $NS_DOMAIN"
echo -e "Done Record Domain= $WS_DOMAIN"
echo -e "Done Record Flare Domain= $FLARE_DOMAIN"
echo -e "Done Record NSDomain= $NS_DOMAIN"
echo "$WS_DOMAIN" > /etc/domain/d-domain
echo "$FLARE_DOMAIN" >/etc/domain/f-domain 
rm -rf cf
sleep 1
