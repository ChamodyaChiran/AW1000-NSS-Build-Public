# ChamodyaWrt For Telstra AW1000

ChamodyaWRT is a free and open-source firmware developed for the Arcadyan AW1000 router, focused on enhancing performance, flexibility, and community access. This project is developed in my free time and provided as-is, without any guarantees regarding functionality, stability, or performance. While it is completely free to use, users are encouraged to take full responsibility when installing and using the firmware.
<br><br>
**Every firmware image is personally tested on my own AW1000 router before being published, to ensure basic functionality and minimize risk during flashing.**
<be>

> [!NOTE]
> This firmware is built using the NSS (Network SubSystem) fork of OpenWrt.
> 
> NSS (Network Subsystem) is a specialized hardware offloading engine developed by Qualcomm, integrated into their IPQ series SoCs (System-on-Chip), such as the IPQ807x and IPQ6018. NSS is designed to handle high-throughput network tasks like NAT, routing, and even security > tasks such as IPsec, without burdening the main CPU cores.
<be>

![Screenshot of a aw1000 router from openwrt page.](https://openwrt.org/_media/media/arcadyan/aw1000/arcadyan_aw1000.png)


## 🎁 What's Included in ChamodyaWRT?

> Standard ChamodyaWRT comes packed with a wide range of powerful and user-friendly features designed to unlock the full potential of your router. It includes essential tools and customizations that go beyond the stock OpenWrt experience.

> Some of the most valuable features included are:

* 🗂️ NAS support for file sharing and media storage

* 📶 Band locking and cell locking for LTE/5G modems

* 📡 Carrier Aggregation (CA) optimization for faster and more stable mobile data connections

* 💡 Custom LED configuration and Task Plan

* 🎨 Custom Theme for a modern and responsive web interface

* 💬 SMS utilities to read and send messages from supported modems

* 🔐 PassWall for advanced proxy, VPN, and firewall control

* 🏠 HomeProxy for advanced proxy management

* 🚫 Adblock with filter list support to block ads and trackers(adblock/adguard home)

* ☁️ Cloudflare Tunnel (Zero Trust) for secure remote access and tailscale

* 🔄 Watchcat for auto-reboot and network monitoring

* 🌐 Guest Wi-Fi support to isolate visitor traffic from your main network

* 📱 Dedicated IoT network support for smart devices like CCTV, smart switches, and sensors, allowing enhanced control, isolation, and security

* 🔌Preinstalled USB support packages for external drives and hotplug auto-mounting

* 👨‍👩‍👧‍👦 Parental controls and timed network access to manage internet usage

### Expanded ChamodyaWRT comes with all the features of the Standard version, plus additional features
* 🐳 Docker support for containerized applications

* ⚡ Clash integration for advanced proxy and routing

* 🎨 Custom themes for a modern and responsive web interface (more themes now available)

* 🔐 PassWall 2 for enhanced proxy, VPN, and firewall control with the latest features(Hysteria Included in both passwalls)

* 🔗 Tailscale VPN for secure, easy-to-manage remote connections

* 📊 Traffic Monitoring to track bandwidth usage by device, interface, or time period

* 🔄UPnP support

* 💾 More available storage

<br/>
  <img width="1813" height="907" alt="image" src="https://github.com/user-attachments/assets/a77a4018-d6ef-4c02-8f19-2f425d33316f" />
  <img width="1833" height="901" alt="image" src="https://github.com/user-attachments/assets/8ce1baaa-c9b9-4bf0-97d9-a058d7819f1a" />
  <img width="1226" height="682" alt="image" src="https://github.com/user-attachments/assets/afb44c21-969e-404d-baaa-91887c1b44f8" />
  <img width="1881" height="930" alt="image" src="https://github.com/user-attachments/assets/8c975015-9e2d-4bc0-b5b1-470fbd1a9a1e" />
  <img width="1887" height="936" alt="image" src="https://github.com/user-attachments/assets/178aac53-80ce-435b-b8ac-0e0356b2a87f" />
  <img width="1504" height="644" alt="image" src="https://github.com/user-attachments/assets/7b5205d2-6abf-4a70-ae23-38c3e646046f" />
  <img width="1652" height="725" alt="image" src="https://github.com/user-attachments/assets/001b56b4-fdaf-43e6-b6a4-90ff915f2e0a" />
  <img width="1705" height="873" alt="image" src="https://github.com/user-attachments/assets/eea62c5f-5776-4340-b447-ff5cdfc13b9e" />
  <img width="1694" height="789" alt="image" src="https://github.com/user-attachments/assets/52b75fa8-d811-41b1-a000-cb5eb1e193b6" />
  <img width="1878" height="912" alt="image" src="https://github.com/user-attachments/assets/b19a7d6d-20d7-4264-8422-0f88c3043f19" />
  <img width="1886" height="893" alt="image" src="https://github.com/user-attachments/assets/c69a43c8-49e4-4dd3-94b6-5088f703ec5c" />
  <img width="1881" height="906" alt="image" src="https://github.com/user-attachments/assets/1e87114c-a511-47d5-b961-9e80b3ed8460" />
  <img width="1881" height="917" alt="image" src="https://github.com/user-attachments/assets/8c735803-7ac3-413c-9e4a-fe1bd0328b18" />
  <img width="1458" height="405" alt="477607690-4482a14d-0d2d-4b98-9cf8-eadea54581fd" src="https://github.com/user-attachments/assets/4bf021a6-fe35-47ac-a84c-664fbbb0cbb7" />
  <img width="1879" height="929" alt="image" src="https://github.com/user-attachments/assets/ee662b10-4ab2-4b89-be0b-a4c23383fe23" />

> [!NOTE]
> Some builds may use OpenWrt snapshot with the APK package manager, while most others are based on stable releases and use the standard OPKG package manager. This depends on the base image used for each release.

- And many more packages, scripts, and tweaks to enhance performance, security, and usability especially for users with LTE/5G connectivity needs.

- ChamodyaWRT aims to offer a complete, powerful solution right out of the box while maintaining full flexibility for customization.

<br/>

> [!CAUTION]
> Before doing anything, make sure to back up all important data and settings.
> This process will erase everything on the device, including custom configurations, installed packages, and any files stored internally.


> [!IMPORTANT]
> The AW1000 router originally comes with a Standard MTD layout, which limits the accessible storage for the system and installed packages.
However, it is possible to expand the rootfs using this method [Change Standard MTD layout to Expanded MTD layout](https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public/blob/main/Expanded%20MTD%20layout.md).
> Because of this, ChamodyaWRT for AW1000 is released in two versions:
> 
> 1. Standard versions – For routers with the original factory flash partition table. (Standard MTD layout)
> 2. Expanded versions – For routers that have been modified at the MTD/mibib level to merge unused partitions into a larger partition. (Expanded MTD layout)
 
> [!WARNING]
> **If you flash the wrong version:**
> * **On Standard MTD layout**, flashing the **Expanded version will brick the device** because the router does not have enough space for it.
> * **On Expanded MTD layout**, flashing the Standard version will still boot and work perfectly. in fact, you’ll have more available free storage because the Standard ChamodyaWRT release contains fewer preinstalled packages than the Expanded version but features will be limited.
> * If your router has the Standard MTD layout, always use the Standard ChamodyaWRT version
> * If your router has the Expanded MTD layout, always use the Expanded ChamodyaWRT version.

## How to check before flashing:
Run:
```
cat /proc/mtd | grep '"rootfs"$'
```
* If the output shows:
```
mtd18: 06400000 00040000 "rootfs"
```
**or something similar → you have Standard layout → download Standard ChamodyaWRT. This hexadecimal number means you have approximately 100 MB**

* If the output shows:
```
mtd24: 2bd00000 00040000 "rootfs"
```
**or something similar → you have Expanded layout → download Expanded ChamodyaWRT. This hexadecimal number means you have approximately 701 MB**

## Download the All-in-One Installer
```
opkg update && opkg install wget && wget -O /tmp/ChamodyaWrt_Installer.sh https://raw.githubusercontent.com/ChamodyaChiran/AW1000-NSS-Build-Public/main/ChamodyaWrt_Installer.sh && chmod +x /tmp/ChamodyaWrt_Installer.sh && /tmp/ChamodyaWrt_Installer.sh
```

## Flashing ChamodyaWRT via Web Interface
1. Download the Firmware
- Go to the [ChamodyaWRT GitHub Releases](https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public/releases/latest)
- Download the latest sysupgrade firmware (*.squashfs-sysupgrade.bin) for your device.
- ⚠️ Make sure you select the correct firmware file for your device model.


2. Flash via Web Interface
- Open your router’s web UI (usually at http://192.168.8.1).
- Go to System > Backup / Flash Firmware.
- Under Flash new firmware image, click Choose File and select the sysupgrade.bin file you downloaded.

<br/>

> [!CAUTION]
> :x: Untick the checkbox
> :x: Keep settings and retain the current configuration
> (Recommended for a clean installation)
> 
<br/>

3. Wait for Flashing to Complete
- The flashing process will take approximately 1 minute.
- The first boot may take around 2 minutes. Do not power off the device during this time.
- ✅ Done!

<br/>

**You have successfully installed ChamodyaWRT. :wink:**
**Welcome to a faster, feature-rich OpenWrt experience! :smiling_face_with_three_hearts:**

**Login Details**
```
Webgui: https://192.168.8.1
User: root
Password: <empty>
```
**Tiny FIle Manager Details**
```
Username: admin
Password: admin@123
Username: user
Password: 12345
```
**Wifi Details**
```
SSID: ChamodyaWrt_2G / ChamodyaWrt_5G / ChamodyaWrt_IOT / GUEST WIFI
Password: 1234567890
```

<br/>

## 🛠️ Recovery Instructions

*  If something goes wrong during the flashing process such as a power cut, interrupted upload, firmware mismatch or unexpected reboot and your router becomes unresponsive, don’t panic. You can try the following recovery methods:

1. Failsafe Mode: Most OpenWrt-supported devices, including the AW1000, have a failsafe mode. Power on the router while holding the reset button . This mode lets you access the router via SSH or TFTP to re-upload a valid firmware image without booting the full system.[more info](https://openwrt.org/docs/guide-user/troubleshooting/failsafe_and_factory_reset#failsafe_mode)
2. Serial Console Access: connect to the router’s serial or [UART](https://openwrt.org/toh/arcadyan/astoria/aw1000#serial) console for low-level recovery and debugging. [more info](https://openwrt.org/docs/techref/hardware/port.serial)
3. USB Boot Option: To help prevent bricking or permanent failures in the future, consider configuring USB boot. Booting from a USB drive allows safer recovery and testing of firmware without overwriting internal storage.[more info](https://openwrt.org/toh/arcadyan/astoria/aw1000#making_usb_boot_permanent)

<br/>

## 📢 Stay Updated

- ChamodyaWRT will continue to be actively maintained and updated for as long as I use the AW1000 router. Community feedback and suggestions are highly encouraged!

- Let’s work together to make ChamodyaWRT even better for everyone!

* For the latest news, updates, tips, and community support related to ChamodyaWRT, join our official WhatsApp Channel:

* 👉 Join ChamodyaWRT WhatsApp Channel https://whatsapp.com/channel/0029VbBFGBM0bIdqp0xKPI2U
  
<img width="190" height="191" alt="image" src="https://github.com/user-attachments/assets/e09131f8-6cbf-4d6b-a300-1cfbc85d3ee3" />

<br/>

## 🙏 Acknowledgements

Sincere thanks to all developers, contributors, and community members who made ChamodyaWRT possible. This project is proudly built on the shoulders of giants.

Special appreciation goes to:

* The OpenWrt development team for building and maintaining one of the most powerful and flexible open-source firmware platforms in the world.

* The [NSS](https://github.com/qosmio/openwrt-ipq) (Network SubSystem) developers and maintainers for enabling high-performance hardware acceleration on Qualcomm platforms.

* The creators and maintainers of [HikariWRT](https://github.com/xhikarishii/openwrt-ipq/releases), whose work served as an inspiration for this project.

* The countless open-source developers, custom package builders, and community maintainers who continue to create, test, and share valuable tools like PassWall, Adblock, 3ginfo, Watchcat, qmodem and many others.

ChamodyaWRT exists thanks to your generosity, skill, and dedication.
Thank you for helping build a better, faster, and freer internet. ❤️
