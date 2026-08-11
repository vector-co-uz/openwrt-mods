#!/bin/bash
#

# add proton theme package directly to the OpenWrt tree
rm -rf package/luci-theme-proton2025
mkdir -p package
if [ ! -d package/luci-theme-proton2025 ]; then
    git clone --depth 1 https://github.com/ChesterGoodiny/luci-theme-proton2025.git package/luci-theme-proton2025
fi

# add fantastic-packages feed according to upstream instructions
rm -rf fantastic_packages
if [ ! -d fantastic_packages ]; then
    git clone --depth 1 --branch 23.05 --no-tags --recurse-submodules https://github.com/fantastic-packages/packages.git fantastic_packages
fi

cat <<'EOF' >>feeds.conf.default
src-link fantastic_packages_packages fantastic_packages/feeds/packages
src-link fantastic_packages_luci     fantastic_packages/feeds/luci
src-link fantastic_packages_special  fantastic_packages/feeds/special
EOF

# add custom DTS
mkdir -p target/linux/ramips/image/mt7621

script_dir="$(cd "$(dirname "$0")" && pwd)"
src_root="${GITHUB_WORKSPACE:-$script_dir}"

cp -f "$src_root/files/mt7621_xiaomi_mi-router-4a-gigabit-32m.dts" \
target/linux/ramips/dts/

cp -f "$src_root/files/mt7621_xiaomi_mi-router-4a-common.dtsi" \
target/linux/ramips/dts/

echo "Custom DTS copied"