
case `dpkg --print-architecture` in

aarch64) pegar="arm64"
;;
arm) pegar="armhf"
;;
i*86) pegar="i386"
;;
x86_64) pegar= "amd64"
;;
*) echo "arquitetura desconhecida"
;;
esac

clear
echo "Baixando Debian 9"
echo ""
echo ""
debootstrap --arch=$pegar stretch debian http://ftp.de.debian.org/debian

touch start.sh
chmod +x start.sh
echo "unset LD_PRELOAD

#!/data/data/com.termux/files/usr/bin/sh
proot -0 -r ~/debian -b /dev/ -b /sys/ -b /proc/ -b /data/data/com.termux/files/home /usr/bin/env -i HOME=/root TERM="xterm-256color" PS1='[root@stable \W]$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin:/bin /bin/bash --login" >> start.sh

