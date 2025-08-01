# ChamodyaWrt For Telstra AW1000

ChamodyaWRT is a free and open-source firmware developed for the Arcadyan AW1000 router, focused on enhancing performance, flexibility, and community access. This project is developed in my free time and provided as-is, without any guarantees regarding functionality, stability, or performance. While it is completely free to use, users are encouraged to take full responsibility when installing and using the firmware.
<br><br>
**Every firmware image is personally tested on my own AW1000 router before being published, to ensure basic functionality and minimize risk during flashing.**
<br>

> [!NOTE]
> This firmware is built using the NSS (Network SubSystem) fork of OpenWrt.
> 
> NSS (Network Subsystem) is a specialized hardware offloading engine developed by Qualcomm, integrated into their IPQ series SoCs (System-on-Chip), such as the IPQ807x and IPQ6018. NSS is designed to handle high-throughput network tasks like NAT, routing, and even security > tasks such as IPsec, without burdening the main CPU cores.
<be>

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

* ChamodyaWRT V5.2 Comes with HomeProxy for advanced proxy management

* 🚫 Adblock with filter list support to block ads and trackers

* ☁️ Cloudflare Tunnel (Zero Trust) for secure remote access

* 🔄 Watchcat for auto-reboot and network monitoring

* 🌐 Guest Wi-Fi support to isolate visitor traffic from your main network

* 📱 Dedicated IoT network support for smart devices like CCTV, smart switches, and sensors, allowing enhanced control, isolation, and security

* 🔌Preinstalled USB support packages for external drives and hotplug auto-mounting

* 👨‍👩‍👧‍👦 Parental controls and timed network access to manage internet usage

<br/>

  <img width="1754" height="900" alt="image" src="https://github.com/user-attachments/assets/4dd15f08-b34e-4396-b88d-14e0a416987a" />
  <img width="1881" height="930" alt="image" src="https://github.com/user-attachments/assets/8c975015-9e2d-4bc0-b5b1-470fbd1a9a1e" />
  <img width="1887" height="936" alt="image" src="https://github.com/user-attachments/assets/178aac53-80ce-435b-b8ac-0e0356b2a87f" />
  <img width="1878" height="912" alt="image" src="https://github.com/user-attachments/assets/b19a7d6d-20d7-4264-8422-0f88c3043f19" />
  <img width="1886" height="893" alt="image" src="https://github.com/user-attachments/assets/c69a43c8-49e4-4dd3-94b6-5088f703ec5c" />
  <img width="1881" height="906" alt="image" src="https://github.com/user-attachments/assets/1e87114c-a511-47d5-b961-9e80b3ed8460" />
  <img width="1881" height="917" alt="image" src="https://github.com/user-attachments/assets/8c735803-7ac3-413c-9e4a-fe1bd0328b18" />
  <img width="1879" height="929" alt="image" src="https://github.com/user-attachments/assets/ee662b10-4ab2-4b89-be0b-a4c23383fe23" />

> [!NOTE]
> Some builds may use OpenWrt snapshot with the APK package manager, while most others are based on stable releases and use the standard OPKG package manager. This depends on the base image used for each release.

- And many more packages, scripts, and tweaks to enhance performance, security, and usability—especially for users with LTE/5G connectivity needs.

- ChamodyaWRT aims to offer a complete, powerful solution right out of the box while maintaining full flexibility for customization.

<br/>

> [!CAUTION]
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
SSID: ChamodyaWrt_2G / ChamodyaWrt_5G / ChamodyaWrt_IOT / GUEST WIFI
Password: 1234567890
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

<br/>

## 🛠️ Recovery Instructions

*  If something goes wrong during the flashing process—such as a power cut, interrupted upload, firmware mismatch or unexpected reboot—and your router becomes unresponsive, don’t panic. You can try the following recovery methods:

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

* The countless open-source developers, custom package builders, and community maintainers who continue to create, test, and share valuable tools—like PassWall, Adblock, 3ginfo, Watchcat, qmodem and many others.

ChamodyaWRT exists thanks to your generosity, skill, and dedication.
Thank you for helping build a better, faster, and freer internet. ❤️
