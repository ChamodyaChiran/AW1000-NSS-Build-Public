# ChamodyaWrt For Telstra AW1000

ChamodyaWRT is a free and open-source firmware developed for the Arcadyan AW1000 router, focused on enhancing performance, flexibility, and community access. This project is developed in my free time and provided as-is, without any guarantees regarding functionality, stability, or performance. While it is completely free to use, users are encouraged to take full responsibility when installing and using the firmware.
![Screenshot of a aw1000 router from openwrt page.](https://openwrt.org/_media/media/arcadyan/aw1000/arcadyan_aw1000.png)


## 🎁 What's Included in ChamodyaWRT?

> ChamodyaWRT comes packed with a wide range of powerful and user-friendly features designed to unlock the full potential of your router. It includes essential tools and customizations that go beyond the stock OpenWrt experience.

> Some of the most valuable features included are:

* 🗂️ NAS support for file sharing and media storage

* 📶 Band locking and cell locking for LTE/5G modems

* 📡 Carrier Aggregation (CA) optimization for faster and more stable mobile data connections

* 💡 Custom LED configuration, including night-time LED behavior for a quieter environment after dark

* 🎨 Custom Theme for a modern and responsive web interface

* 💬 SMS utilities to read and send messages from supported modems

* 🔐 PassWall for advanced proxy, VPN, and firewall control

* 🚫 Adblock with filter list support to block ads and trackers

* ☁️ Cloudflare Tunnel (Zero Trust) for secure remote access

* 🔄 Watchcat for auto-reboot and network monitoring

* 🔌Preinstalled USB support packages for external drives and hotplug auto-mounting

* 👨‍👩‍👧‍👦 Parental controls and timed network access to manage internet usage

<br/>

  <img width="1754" height="900" alt="image" src="https://github.com/user-attachments/assets/4dd15f08-b34e-4396-b88d-14e0a416987a" />
  <img width="1808" height="873" alt="image" src="https://github.com/user-attachments/assets/d2738702-bbbc-4efe-8c1d-c565ed8b9e1d" />



- And many more packages, scripts, and tweaks to enhance performance, security, and usability—especially for users with LTE/5G connectivity needs.

- ChamodyaWRT aims to offer a complete, powerful solution right out of the box while maintaining full flexibility for customization.

<br/>

> [!NOTE]
> This firmware is built using the NSS (Network SubSystem) fork of OpenWrt.
> 
> NSS (Network Subsystem) is a specialized hardware offloading engine developed by Qualcomm, integrated into their IPQ series SoCs (System-on-Chip), such as the IPQ807x and IPQ6018. NSS is designed to handle high-throughput network tasks like NAT, routing, and even security > tasks such as IPsec, without burdening the main CPU cores.

<br/>

> [!WARNING]
> Before doing anything, make sure to back up all important data and settings.
> This process will erase everything on the device, including custom configurations, installed packages, and any files stored internally.

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
SSID: ChamodyaWrt_2G or ChamodyaWrt_5G
Password: 1234567890
```

### Flashing ChamodyaWRT via Web Interface
1. Download the Firmware
- Go to the [ChamodyaWRT GitHub Releases](https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public/releases)
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

<br/>

# 🙏 Acknowledgements

Sincere thanks to all developers, contributors, and community members who made ChamodyaWRT possible. This project is proudly built on the shoulders of giants.

Special appreciation goes to:

* The OpenWrt development team for building and maintaining one of the most powerful and flexible open-source firmware platforms in the world.

* The [NSS](https://github.com/qosmio/openwrt-ipq) (Network SubSystem) developers and maintainers for enabling high-performance hardware acceleration on Qualcomm platforms.

* The creators and maintainers of [HikariWRT](https://github.com/xhikarishii/openwrt-ipq/releases), whose work served as an inspiration for this project.

* The countless open-source developers, custom package builders, and community maintainers who continue to create, test, and share valuable tools—like PassWall, Adblock, 3ginfo, Watchcat, qmodem and many others.

ChamodyaWRT exists thanks to your generosity, skill, and dedication.
Thank you for helping build a better, faster, and freer internet. ❤️
