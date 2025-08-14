# AW1000 Expanded MTD Layout Flash Guide

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

(Download Link)[]

### Disassembly

1. Remove the four rubber feet and the four screws underneath.

2. Unclip the bottom cover and slide the hardware out of the white shell.

### Serial Port Location

* The serial port is labeled J1003, located near the LED light guide (plastic extension).

* Pin layout (from square hole to farthest): **VCC (⚠️ Do not connect this!**), TX, RX, GND.

* **Correct connection order for use: GND – RX – TX – VCC (leave VCC unconnected)**

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
