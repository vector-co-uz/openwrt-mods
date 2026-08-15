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
    git clone --depth 1 --branch 24.10 --no-tags --recurse-submodules https://github.com/fantastic-packages/packages.git fantastic_packages
fi

cat <<'EOF' >>feeds.conf.default
src-link fantastic_packages_packages fantastic_packages/feeds/packages
src-link fantastic_packages_luci     fantastic_packages/feeds/luci
src-link fantastic_packages_special  fantastic_packages/feeds/special
EOF

git clone https://github.com/VizzleTF/luci-theme-footstrap.git package/footstrap
git clone https://github.com/gSpotx2f/luci-app-internet-detector.git package/internet-detector
git clone https://github.com/alexwbaule/telegramopenwrt.git package/telegram-openwrt

# add custom DTS
mkdir -p target/linux/ramips/image/mt7621

script_dir="$(cd "$(dirname "$0")" && pwd)"
src_root="${GITHUB_WORKSPACE:-$script_dir}"

cp -f "$src_root/files/mt7621_xiaomi_mi-router-4a-gigabit-32mb.dts" \
target/linux/ramips/dts/

echo "Custom DTS copied"

# Add Xiaomi Mi Router 4A Gigabit Edition 32MB device definition
MT7621_MK="target/linux/ramips/image/mt7621.mk"

if [ -f "$MT7621_MK" ]; then
  if ! grep -q '^define Device/xiaomi_mi-router-4a-gigabit-32mb$' "$MT7621_MK"; then
    cat >> "$MT7621_MK" <<'EOF'

define Device/xiaomi_mi-router-4a-gigabit-32mb
  $(Device/dsa-migration)
  $(Device/uimage-lzma-loader)
  IMAGE_SIZE := 30208k
  DEVICE_VENDOR := Xiaomi
  DEVICE_MODEL := Mi Router 4A
  DEVICE_VARIANT := Gigabit Edition 32MB
  DEVICE_PACKAGES := kmod-mt7603 kmod-mt76x2 -uboot-envtools
endef
TARGET_DEVICES += xiaomi_mi-router-4a-gigabit-32mb
EOF
  fi
else
  echo "Warning: $MT7621_MK not found" >&2
fi
