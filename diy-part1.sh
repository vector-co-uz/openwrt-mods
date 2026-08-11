#!/bin/bash
#

# add proton theme package directly to the OpenWrt tree
rm -rf package/luci-theme-proton2025
mkdir -p package
if [ ! -d package/luci-theme-proton2025 ]; then
    git clone --depth 1 https://github.com/ChesterGoodiny/luci-theme-proton2025.git package/luci-theme-proton2025
fi

# add fantastic-packages feed directly to the OpenWrt tree
rm -rf package/fantastic_packages
if [ ! -d package/fantastic_packages ]; then
    git clone --depth 1 --branch 23.05 https://github.com/fantastic-packages/packages.git package/fantastic_packages
fi

echo 'src-link fantastic_packages package/fantastic_packages' >>feeds.conf.default

# add custom DTS
mkdir -p target/linux/ramips/image/mt7621

script_dir="$(cd "$(dirname "$0")" && pwd)"
src_root="${GITHUB_WORKSPACE:-$script_dir}"

cp -f "$src_root/files/mt7621_xiaomi_mi-router-4a-gigabit-32m.dts" \
target/linux/ramips/dts/

cp -f "$src_root/files/mt7621_xiaomi_mi-router-4a-common.dtsi" \
target/linux/ramips/dts/

echo "Custom DTS copied"