#!/bin/bash
#Script Variables
PORT_TCP='1194'
PORT_UDP='2200'

cd /etc/stunnel/ || exit

echo "-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQClmgCdm7RB2VWK
wfH8HO/T9bxEddWDsB3fJKpM/tiVMt4s/WMdGJtFdRlxzUb03u+HT6t00sLlZ78g
ngjxLpJGFpHAGdVf9vACBtrxv5qcrG5gd8k7MJ+FtMTcjeQm8kVRyIW7cOWxlpGY
6jringYZ6NcRTrh/OlxIHKdsLI9ddcekbYGyZVTm1wd22HVG+07PH/AeyY78O2+Z
tbjxGTFRSYt3jUaFeUmWNtxqWnR4MPmC+6iKvUKisV27P89g8v8CiZynAAWRJ0+A
qp+PWxwHi/iJ501WdLspeo8VkXIb3PivyIKC356m+yuuibD2uqwLZ2//afup84Qu
pRtgW/PbAgMBAAECggEAVo/efIQUQEtrlIF2jRNPJZuQ0rRJbHGV27tdrauU6MBT
NG8q7N2c5DymlT75NSyHRlKVzBYTPDjzxgf1oqR2X16Sxzh5uZTpthWBQtal6fmU
JKbYsDDlYc2xDZy5wsXnCC3qAaWs2xxadPUS3Lw/cjGsoeZlOFP4QtV/imLseaws
7r4KZE7SVO8dF8Xtcy304Bd7UsKClnbCrGsABUF/rqA8g34o7yrpo9XqcwbF5ihQ
TbnB0Ns8Bz30pjgGjJZTdTL3eskP9qMJWo/JM76kSaJWReoXTws4DlQHxO29z3eK
zKdxieXaBGMwFnv23JvXKJ5eAnxzqsL6a+SuNPPN4QKBgQDQhisSDdjUJWy0DLnJ
/HjtsnQyfl0efOqAlUEir8r5IdzDTtAEcW6GwPj1rIOm79ZeyysT1pGN6eulzS1i
6lz6/c5uHA9Z+7LT48ZaQjmKF06ItdfHI9ytoXaaQPMqW7NnyOFxCcTHBabmwQ+E
QZDFkM6vVXL37Sz4JyxuIwCNMQKBgQDLThgKi+L3ps7y1dWayj+Z0tutK2JGDww7
6Ze6lD5gmRAURd0crIF8IEQMpvKlxQwkhqR4vEsdkiFFJQAaD+qZ9XQOkWSGXvKP
A/yzk0Xu3qL29ZqX+3CYVjkDbtVOLQC9TBG60IFZW79K/Zp6PhHkO8w6l+CBR+yR
X4+8x1ReywKBgQCfSg52wSski94pABugh4OdGBgZRlw94PCF/v390En92/c3Hupa
qofi2mCT0w/Sox2f1hV3Fw6jWNDRHBYSnLMgbGeXx0mW1GX75OBtrG8l5L3yQu6t
SeDWpiPim8DlV52Jp3NHlU3DNrcTSOFgh3Fe6kpot56Wc5BJlCsliwlt0QKBgEol
u0LtbePgpI2QS41ewf96FcB8mCTxDAc11K6prm5QpLqgGFqC197LbcYnhUvMJ/eS
W53lHog0aYnsSrM2pttr194QTNds/Y4HaDyeM91AubLUNIPFonUMzVJhM86FP0XK
3pSBwwsyGPxirdpzlNbmsD+WcLz13GPQtH2nPTAtAoGAVloDEEjfj5gnZzEWTK5k
4oYWGlwySfcfbt8EnkY+B77UVeZxWnxpVC9PhsPNI1MTNET+CRqxNZzxWo3jVuz1
HtKSizJpaYQ6iarP4EvUdFxHBzjHX6WLahTgUq90YNaxQbXz51ARpid8sFbz1f37
jgjgxgxbitApzno0E2Pq/Kg=
-----END PRIVATE KEY-----
-----BEGIN CERTIFICATE-----
MIIDRTCCAi2gAwIBAgIUOvs3vdjcBtCLww52CggSlAKafDkwDQYJKoZIhvcNAQEL
BQAwMjEQMA4GA1UEAwwHS29ielZQTjERMA8GA1UECgwIS29iZUtvYnoxCzAJBgNV
BAYTAlBIMB4XDTIxMDcwNzA1MzQwN1oXDTMxMDcwNTA1MzQwN1owMjEQMA4GA1UE
AwwHS29ielZQTjERMA8GA1UECgwIS29iZUtvYnoxCzAJBgNVBAYTAlBIMIIBIjAN
BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApZoAnZu0QdlVisHx/Bzv0/W8RHXV
g7Ad3ySqTP7YlTLeLP1jHRibRXUZcc1G9N7vh0+rdNLC5We/IJ4I8S6SRhaRwBnV
X/bwAgba8b+anKxuYHfJOzCfhbTE3I3kJvJFUciFu3DlsZaRmOo64p4GGejXEU64
fzpcSBynbCyPXXXHpG2BsmVU5tcHdth1RvtOzx/wHsmO/DtvmbW48RkxUUmLd41G
hXlJljbcalp0eDD5gvuoir1CorFduz/PYPL/AomcpwAFkSdPgKqfj1scB4v4iedN
VnS7KXqPFZFyG9z4r8iCgt+epvsrromw9rqsC2dv/2n7qfOELqUbYFvz2wIDAQAB
o1MwUTAdBgNVHQ4EFgQUcKFL6tckon2uS3xGrpe1Zpa68VEwHwYDVR0jBBgwFoAU
cKFL6tckon2uS3xGrpe1Zpa68VEwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0B
AQsFAAOCAQEAYQP0S67eoJWpAMavayS7NjK+6KMJtlmL8eot/3RKPLleOjEuCdLY
QvrP0Tl3M5gGt+I6WO7r+HKT2PuCN8BshIob8OGAEkuQ/YKEg9QyvmSm2XbPVBaG
RRFjvxFyeL4gtDlqb9hea62tep7+gCkeiccyp8+lmnS32rRtFa7PovmK5pUjkDOr
dpvCQlKoCRjZ/+OfUaanzYQSDrxdTSN8RtJhCZtd45QbxEXzHTEaICXLuXL6cmv7
tMuhgUoefS17gv1jqj/C9+6ogMVa+U7QqOvL5A7hbevHdF/k/TMn+qx4UdhrbL5Q
enL3UGT+BhRAPiA1I5CcG29RqjCzQoaCNg==
-----END CERTIFICATE-----" >> stunnel.pem

cat <<"EOM" >/etc/stunnel/stunnel.conf
debug = 0
output = /tmp/stunnel.log
cert = /etc/stunnel/stunnel.pem
[openvpn-tcp]
connect = PORT_TCP  
accept = 443 
[openvpn-udp]
connect = PORT_UDP
accept = 444

[ssh-tunnel]
connect = 22
accept = 555

[stunnel]
connect = 127.0.0.1:8090
accept = 556

EOM

sed -i "s|PORT_TCP|$PORT_TCP|g" /etc/stunnel/stunnel.conf
sed -i "s|PORT_UDP|$PORT_UDP|g" /etc/stunnel/stunnel.conf
cd /etc/default && rm stunnel4

cat <<"EOM" >/etc/stunnel/stunnel4
ENABLED=1
FILES="/etc/stunnel/*.conf"
OPTIONS=""
PPP_RESTART=0
RLIMITS=""
EOM


chmod 755 stunnel4
sudo service stunnel4 restart