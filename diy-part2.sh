#!/bin/bash
#============================================================
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: cbpk
#============================================================

echo 'Rewrite Gateway'
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

echo 'Rewrite Hostname'
sed -i 's/OpenWrt/G-DOCK/g' package/base-files/files/bin/config_generate

echo 'Rewrite Wifiname'
sed -i 's/OpenWrt/G-DOCK/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

echo 'Rewrite Banner'
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/

echo 'Download ServerChan'
git clone https://github.com/tty228/luci-app-serverchan ../diy/luci-app-serverchan

echo 'Link diy directory'
ln -s ../../diy ./package/openwrt-packages
