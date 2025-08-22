# AW1000 Expanded MTD Layout Flash Guide

### Why do I need to do this?
* With the standard MTD layout, you are limited to only 100 MB of router storage. The AW1000 actually has 1 GB of NAND storage, but you’re not even using 50% of it. By switching to the expanded MTD layout, you can use up to 700 MB of storage.

### What happened to the other 300 MB of the 1 GB NAND?
The remaining 300 MB is used for essential router functions such as the bootloader and other system partitions.

> By doing this, you can expand the available flash storage, allowing you to install firmware with more features, more functions, and additional capabilities on this router.MTD24 and MTD25 are merged together to create a new rootfs partition.The previous rootfs partition will be renamed to rootfs_bak.

> [!WARNING]
> Please follow this tutorial carefully. Incorrect modifications can damage your router, sometimes permanently. Always use a backup power supply to prevent sudden power outages during this process.

### Requirements

* Computer (any OS)

* Internet connection

* Screwdriver

* USB to TTL adapter (CP2102 or any compatible model, ~LKR 300)

### Required Software

* [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

* [TFTPD64](https://pjo2.github.io/tftpd64/)

* USB to TTL drivers (download the correct driver for your adapter model from Google)

### Files Needed

Download **aw1000-mibib.bin**, **factory.bin** files from the link below, then place them in a separate folder:

[Download Link](https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public/tree/main/Files)

### Disassembly

1. Remove the four rubber feet and the four screws underneath.

2. Unclip the bottom cover and slide the hardware out of the white shell.
3. ![arcadyan_aw1000_bottom](https://github.com/user-attachments/assets/df481572-858d-47e6-b9f2-ffa34ea47750)


### Serial Port Location

* The serial port is labeled J1003, located near the LED light guide (plastic extension).

* Pin layout (from square hole to farthest): **VCC (⚠️ Do not connect this!**), TX, RX, GND.

* **Correct connection order for use: GND – RX – TX – VCC (leave VCC unconnected)**
* <img width="200" height="243" alt="arcadyan astoria aw1000 serial" src="https://github.com/user-attachments/assets/c914d081-4cc2-4406-bad5-6852bb0ca7bf" />


### Connect wires:
* USB-TTL GND → Router (GND)
* USB-TTL RX → Router (TX)
* USB-TTL TX → Router (RX)


### UART Connection Details

* Baud Rate: 115200
* Data Bits: 8
* Parity: None
* Stop Bits: 1
* Flow Control: None
* Voltage Level: 3.3V TTL

### Flashing Guide

1. Install USB-to-TTL adapter drivers on your computer.

2. Configure your computer’s network adapter (IPv4 properties):

* IP Address: 192.168.1.2

* Subnet Mask: 255.255.255.0

* Default Gateway: leave blank
* ![photo_2025-02-11_20-52-31](https://github.com/user-attachments/assets/8daeafd4-e857-49bf-8cca-162fb3440d5f)

* Save the settings.

3. Connect the hardware:

* Connect the router’s RJ45 LAN port to your computer’s RJ45 port using a LAN cable.

4. Connect the USB-to-TTL adapter to your computer.

* Check Device Manager-the adapter should appear as COM##.

5. Open PuTTY:

* Select Serial connection.

* Enter the COM port number shown in Device Manager (replace ## with your COM number).

* Set Speed to 115200.
* ![photo_2025-02-11_20-50-59](https://github.com/user-attachments/assets/dc36cc86-60ea-48a1-b3ac-63a40a4b8e40)


* Click Open-a black terminal screen will appear.

6. Power on the router:

* Plug in the router’s 12V adapter and turn it on.

* The PuTTY terminal will start showing boot information.

7. Interrupt the boot process:

* When prompted, press any key on your keyboard to stop the boot process.

8. Open Tftpd64:

* Launch Tftpd64 on your computer.

* In the Current Directory field, select the folder where aw1000-mibib.bin and factory.bin are located.

* In the Server Interface drop-down menu, select the network adapter you configured earlier (with IP 192.168.1.2).

9. Disable Antivirus if Necessary

* Sometimes third-party antivirus or security software can block Tftpd64 connections.

* If Tftpd64 is not working or the transfer fails, temporarily disable your antivirus and try again.

10. Run UART Commands
In the PuTTY terminal (after interrupting the boot process), type the following commands one by one, pressing Enter after each:
```
tftpboot aw1000-mibib.bin
flash 0:MIBIB
tftpboot factory.bin
flash rootfs
```
![photo_2025-02-11_21-05-55](https://github.com/user-attachments/assets/a61740af-59e8-463a-8b53-d31cbf07ece9)
![photo_2025-02-11_21-08-19](https://github.com/user-attachments/assets/a63b8bb9-2689-4181-9218-73337bd7d14e)
![photo_2025-02-11_21-09-49](https://github.com/user-attachments/assets/9204d0e0-8b9b-48e9-8984-85fa0ee059b7)
![photo_2025-02-11_21-10-18](https://github.com/user-attachments/assets/fe8a3979-5337-4366-b030-1699cbf29c81)

11. Optional – Enable USB Boot

* Setting USB boot will make it easier to recover your router in the future if something goes wrong, such as a failed firmware flash.

* If you want to enable USB boot, enter the following commands in the PuTTY terminal (after completing the previous steps):
```
setenv bootusb 'usb start && usbboot 0x44000000 0 && bootm 0x44000000'
setenv bootcmd 'run bootusb; bootipq'
saveenv
```
* If you do not want USB boot, skip this step and proceed to Step 12.

12. Reboot the Router

Once all steps are complete, reboot by typing:
```
reset
```
13. Final Step

* You have now successfully modified the MTD partitions.

* The router will boot into factory bin.If the WebUI asks for login details, the username is root and the password is password.

* From here, you can flash any custom firmware via the [WebUI Sysupgrade option](https://github.com/ChamodyaChiran/AW1000-NSS-Build-Public#flashing-chamodyawrt-via-web-interface)

## Credits ❤️
This method was originally developed and shared by [sopeksemprit](https://www.sopeksemprit.xyz). All credit for the procedure and the associated files belongs to him, and his contribution is gratefully acknowledged.
