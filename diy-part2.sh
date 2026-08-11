#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Make Proton2025 the default LuCI theme after first boot
mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/40-luci-theme <<'EOF'
#!/bin/sh

if [ -d /www/luci-static/proton2025 ]; then
    uci set luci.main.mediaurlbase='/luci-static/proton2025'
    uci commit luci
fi

exit 0
EOF
chmod +x files/etc/uci-defaults/40-luci-theme

# Add additional first-boot settings
cp -f "$PWD/files/99-vector-settings" files/etc/uci-defaults/99-vector-settings
chmod +x files/etc/uci-defaults/99-vector-settings
