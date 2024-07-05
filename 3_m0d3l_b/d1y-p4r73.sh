#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.50.68/g' package/base-files/files/bin/config_generate

# Change ash to bash
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd

# Change language=auto to zh_cn
sed -i 's/lang="auto"/lang="zh_cn"/g' package/emortal/default-settings/files/99-default-settings

# Change luci list name
sed -i 's/"Argon 主题设置"/"主题设置"/g' feeds/ace8/luci-app-argon-config/po/zh_Hans/argon-config.po
sed -i 's/services/system/g' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
sed -i 's/nas/services/g' feeds/luci/applications/luci-app-samba4/root/usr/share/luci/menu.d/luci-app-samba4.json

# change some tips
sed -i '/interface}/d' feeds/packages/utils/ttyd/files/ttyd.init
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config
sed -i 's/"终端"/"TTYD 终端"/g' feeds/luci/applications/luci-app-ttyd/po/zh_Hans/ttyd.po

# Boost UDP
echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf

rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/favicon.ico
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/favicon.ico "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/favicon.ico"
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/img/argon.svg"
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/img/bg1.jpg"
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/*.png
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/android-icon-192x192.png "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/icon/android-icon-192x192.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-60x60.png "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/icon/apple-icon-60x60.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-72x72.png "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/icon/apple-icon-72x72.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/icon/apple-icon-144x144.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-16x16.png "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/icon/favicon-16x16.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-32x32.png "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/icon/favicon-32x32.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-96x96.png "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/icon/favicon-96x96.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/ms-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/argon/icon/ms-icon-144x144.png"

# Change to my banner
sudo rm package/base-files/files/etc/banner
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/banner -O package/base-files/files/etc/banner

# upgrade config
#wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/99-init-settings -O package/base-files/files/etc/uci-defaults/99-init-settings
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/zzz-updata-settings-snake -O package/base-files/files/etc/uci-defaults/zzz-updata-settings-snake
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1/main/3_m0d3l_b/30-sysinfo.sh -O feeds/packages/utils/bash/files/etc/profile.d/30-sysinfo.sh

echo "diy-part2.sh is done."
