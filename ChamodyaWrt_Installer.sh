
#!/bin/sh
clear
echo "============================================"
echo
echo "     ChamodyaWrt Auto Firmware Installer"
echo
echo "============================================"
echo "This firmware build is provided free of charge"
echo "and is intended for personal and non-commercial use."
echo "Please follow the step by step installation process."
echo "============================================"
echo "https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public"
echo
sleep 1

# Detect board name
BOARD_NAME=$(ubus call system board | jsonfilter -e '@.board_name')

# Print result
if [ "$BOARD_NAME" = "arcadyan,aw1000" ]; then
    echo "Device Model - $BOARD_NAME"
else
    echo "Unsupported Device. This firmware installation only supports Arcadyan AW1000."
    exit 1
fi


if [ -f /etc/openwrt_release ]; then
    FW_DESC=$(grep DISTRIB_DESCRIPTION /etc/openwrt_release | cut -d"'" -f2)
    echo "Current Firmware: $FW_DESC"
else
    echo "Current Firmware: Unsupported"
    exit 1
fi
sleep 1
echo





# Spinner animation function
animate() {
    text="$1"
    for i in 1 2 3; do
        for c in '-' '\' '|' '/'; do
            printf "\r%s %s" "$text" "$c"
            sleep 0.2 2>/dev/null || sleep 1  
        done
    done
    printf "\r%s ... Done!\n" "$text"
}

# 1. Check Internet connectivity
if ! ping -c 1 -W 2 google.com >/dev/null 2>&1; then
    echo "[ERROR] Internet Connection Not Available. Please check your network connection"
    exit 1
fi

sleep 1


animate "Downloading Necessary Packages"


REQUIRED_PACKAGES="wget jsonfilter curl"

MISSING_PACKAGES=""
for pkg in $REQUIRED_PACKAGES; do
    if ! command -v $pkg >/dev/null 2>&1; then
        MISSING_PACKAGES="$MISSING_PACKAGES $pkg"
    fi
done

if [ -n "$MISSING_PACKAGES" ]; then
    echo "[INFO] Installing missing packages:$MISSING_PACKAGES"
    opkg update
    for pkg in $MISSING_PACKAGES; do
        opkg install $pkg
        if [ $? -ne 0 ]; then
            echo "[ERROR] Failed to install package: $pkg"
            exit 1
        fi
    done
else
    echo "[INFO] All required packages are already installed."
fi
echo

animate() {
    text="$1"
    for i in 1 2 3; do
        for c in '-' '\' '|' '/'; do
            printf "\r%s %s" "$text" "$c"
            # sleep 1/5 sec using usleep
            if command -v usleep >/dev/null 2>&1; then
                usleep 200000  # 200,000 microseconds = 0.2 sec
            else
                sleep 1       # fallback: 1 sec
            fi
        done
    done
    printf "\r%s ... Done!\n" "$text"
}

animate "Checking Your router MTD layout.Please wait"
# Get rootfs size (hex string)
ROOTFS_SIZE_HEX=$(awk '/"rootfs"/ {print $2}' /proc/mtd)

# Convert hex to decimal
ROOTFS_SIZE=$(printf "%d" "0x$ROOTFS_SIZE_HEX")

# Show actual MB
ROOTFS_MB=$((ROOTFS_SIZE / 1024 / 1024))

# Determine layout
if [ "$ROOTFS_SIZE" -gt 262144000 ]; then   # >250 MB
    MTD_LAYOUT="Expanded"
elif [ "$ROOTFS_SIZE" -ge 80000000 ] && [ "$ROOTFS_SIZE" -lt 200000000 ]; then  # ~100 MB
    MTD_LAYOUT="Standard"
else
    MTD_LAYOUT="Unknown"
fi

echo "[INFO] Your router MTD layout: $MTD_LAYOUT ($ROOTFS_MB MB rootfs)"
sleep 1

echo

# Simple spinner using integer sleep
spinner='-\|/'
for i in $(seq 1 10); do
    c=${spinner:i%4:1}
    printf "\rChecking Your router MTD space.Please wait %s" "$c"
    sleep 1
done
echo " ... Done!"


# Get available space on root filesystem in bytes
ROOT_AVAIL=$(df / | awk 'NR==2 {print $4 * 1024}') # df gives 1K blocks

# Determine MTD space type
if [ "$ROOT_AVAIL" -ge 262144000 ]; then  # ~250 MB threshold
    MTD_SPACE="Expanded MTD space"
else
    MTD_SPACE="Standard MTD space"
fi

echo "[INFO] Your router MTD space: $MTD_SPACE"



echo
# Determine router type
if [ "$MTD_LAYOUT" = "Standard" ] && [ "$MTD_SPACE" = "Standard MTD space" ]; then
    ROUTER_TYPE="Standard"
elif [ "$MTD_LAYOUT" = "Expanded" ] && [ "$MTD_SPACE" = "Expanded MTD space" ]; then
    ROUTER_TYPE="Expanded"
else
    ROUTER_TYPE="Unknown MTD type"
    exit 1
fi



if [ "$ROUTER_TYPE" = "Standard" ]; then
    echo "Your router has the Standard MTD layout, always use the Standard ChamodyaWRT version"
elif [ "$ROUTER_TYPE" = "Expanded" ]; then
    echo "Your router has the Expanded MTD layout, it is recommended to use the Expanded ChamodyaWRT version"
else
    echo "MTD layout and space do not match expected values. Please check manually before flashing."
fi
echo


#!/bin/sh

FIRMWARE_LIST="
ChamodyaWrt|Expanded|V5.4|https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public/releases/download/Expanded.V5.4/chamodyawrt-expanded-v5.4-202509-qualcommax-ipq807x-arcadyan_aw1000-squashfs-sysupgrade.bin
ChamodyaWrt|Expanded|V5.3|https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public/releases/download/Expanded.V5.3/chamodyawrt-expanded-v5.3-202508-qualcommax-ipq807x-arcadyan_aw1000-squashfs-sysupgrade.bin
ChamodyaWrt|Standard|V5.2|https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public/releases/download/Standard.V5.2/aw1000-squashfs-sysupgrade.bin
ChamodyaWrt|Standard|V5.1|https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public/releases/download/Standard.V5.1/aw1000-squashfs-sysupgrade.bin
"

# Find latest version for this router type
LATEST_VERSION=""
while IFS='|' read NAME TYPE VERSION URL; do
    if [ "$TYPE" = "$ROUTER_TYPE" ]; then
        if [ -z "$LATEST_VERSION" ]; then
            LATEST_VERSION="$VERSION"
        fi
    fi
done <<EOF
$FIRMWARE_LIST
EOF

# Display menu
echo "Available firmware versions for $ROUTER_TYPE router:"
i=1
> /tmp/firmware_names.txt
> /tmp/firmware_urls.txt
while IFS='|' read NAME TYPE VERSION URL; do
    if [ "$TYPE" = "$ROUTER_TYPE" ]; then
        LABEL="$NAME $TYPE $VERSION"
        if [ "$VERSION" = "$LATEST_VERSION" ]; then
            LABEL="$LABEL (Latest & Recommended)"
        fi
        printf " %d) %s\n" "$i" "$LABEL"
        echo "$LABEL" >> /tmp/firmware_names.txt
        echo "$URL" >> /tmp/firmware_urls.txt
        i=$((i+1))
    elif [ "$ROUTER_TYPE" = "Expanded" ] && [ "$TYPE" = "Standard" ]; then
        LABEL="$NAME $TYPE $VERSION (Not recommended)"
        printf " %d) %s\n" "$i" "$LABEL"
        echo "$LABEL" >> /tmp/firmware_names.txt
        echo "$URL" >> /tmp/firmware_urls.txt
        i=$((i+1))
    fi
done <<EOF
$FIRMWARE_LIST
EOF

echo " 0) Exit"

# Prompt user
while true; do
    printf "Enter the number of the firmware to download: "
    read FIRMWARE_CHOICE

    if [ "$FIRMWARE_CHOICE" -ge 1 ] 2>/dev/null && [ "$FIRMWARE_CHOICE" -lt "$i" ] 2>/dev/null; then
        # Get firmware name for display
        FIRMWARE_NAME=$(sed -n "${FIRMWARE_CHOICE}p" /tmp/firmware_names.txt)
        echo "[INFO] Firmware selected: $FIRMWARE_NAME"
        # Get firmware URL for internal download
        FIRMWARE_DOWNLOAD_URL=$(sed -n "${FIRMWARE_CHOICE}p" /tmp/firmware_urls.txt)
        break
    elif [ "$FIRMWARE_CHOICE" = "0" ]; then
        echo "[INFO] Exiting."
        exit 0
    else
        echo "[ERROR] Invalid selection! Please try again."
    fi
done
sleep 1

TMP_DIR="/tmp"
FIRMWARE_FILE="$TMP_DIR/firmware.bin"

echo
echo "Downloading Firmware.Please Wait..."

# Start download in background silently
wget -q --show-progress -O "$FIRMWARE_FILE" "$FIRMWARE_DOWNLOAD_URL" &
WGET_PID=$!

# Simple spinner
spinner='-\|/'
i=0
while kill -0 $WGET_PID 2>/dev/null; do
    c=${spinner:i%4:1}
    printf "\rDownloading Firmware %s" "$c"
    i=$((i+1))
    sleep 1
done
wait $WGET_PID
echo ""  # Newline after spinner

# Verify download
if [ ! -f "$FIRMWARE_FILE" ] || [ ! -s "$FIRMWARE_FILE" ]; then
    echo "[ERROR] Firmware Downloading Failed. Please contact developer."
    exit 1
fi

# Optional: check if first line is HTML
FIRST_LINE=$(head -n 1 "$FIRMWARE_FILE")
echo "$FIRST_LINE" | grep -qi '<!DOCTYPE\|<html' && {
    echo "[ERROR] Firmware Downloading Failed (HTML received). Please contact developer."
    exit 1
}

echo "[INFO] Firmware downloaded successfully"
sleep 1
echo "[INFO] Firmware file location: $FIRMWARE_FILE"
echo

#################################
# Verify Firmware
#################################

# Spinner for verification
i=0
while [ $i -lt 5 ]; do
    c=${spinner:i%4:1}
    printf "\rVerifying Firmware %s" "$c"
    i=$((i+1))
    sleep 1
done
echo ""

# Get expected size from server (Content-Length)
EXPECTED_SIZE=$(wget --spider -S "$FIRMWARE_DOWNLOAD_URL" 2>&1 \
    | grep -i Content-Length \
    | awk '{print $2}' \
    | tr -d '\r\n ')

# Get actual downloaded size
DOWNLOADED_SIZE=$(wc -c < "$FIRMWARE_FILE" | tr -d '\r\n ')

echo "[INFO] Firmware Expected size: $EXPECTED_SIZE"
echo "[INFO] Firmware Downloaded size: $DOWNLOADED_SIZE"

# Check
if [ -z "$EXPECTED_SIZE" ] || [ "$EXPECTED_SIZE" -ne "$DOWNLOADED_SIZE" ]; then
    echo "[ERROR] Firmware verification failed (size mismatch)."
    echo "Expected: $EXPECTED_SIZE bytes, Got: $DOWNLOADED_SIZE bytes"
    exit 1
fi
echo
echo "[INFO] Firmware Verified."
echo "[INFO] Firmware ready to flash."

# Ask user confirmation before flashing
echo
read -p "Do you want to continue with flashing the $FIRMWARE_NAME firmware? Your router has $MTD_LAYOUT MTD layout (yes/no): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
    echo "Flash cancelled by user."
    exit 0
fi

echo
echo "Firmware Flashing. This will take a few minutes. Do not power off the device."

# Run sysupgrade without keeping settings
sysupgrade -n /tmp/firmware.bin
