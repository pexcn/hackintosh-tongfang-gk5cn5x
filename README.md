# :green_apple: Hackintosh Tongfang GK5CN5X

![OpenCore version](https://img.shields.io/badge/OpenCore-1.0.1-blue?style=flat-square&logo=circle) ![macOS version](https://img.shields.io/badge/macOS-Sonoma-green?style=flat-square&logo=apple)

## :computer: Specification

| **Hardware**    | **Detail**                                          |
| --------------- | --------------------------------------------------- |
| **CPU**         | Intel Core i7-8750H Processor                       |
| **GPU**         | Intel UHD Graphics 620 / NVIDIA GeForce GTX 1050 Ti |
| **RAM**         | Crucial 8GB 2666MHz DDR4 x 2                        |
| **SSD**         | ZHITAI PC005 Active NVMe M.2 SSD                    |
| **Chipset**     | Intel HM370 Chipset                                 |
| **Display**     | BOE NV156FHM-N61 15.6" 1920x1080p                   |
| **Audio**       | Realtek ALC269 HD Audio                             |
| **Ethernet**    | Realtek RTL8168/8111 PCI-E Gigabit Ethernet NIC     |
| **Wireless**    | Intel Wi-Fi 6 AX200                                 |
| **Camera**      | Chicony Electronics HD Webcam                       |
| **Keyboard**    | Standard PS/2 Keyboard                              |
| **TouchPad**    | I2C HID TouchPad                                    |
| **Card Reader** | Realtek USB 2.0 Card Reader                         |
| **SMBIOS**      | `MacBookPro15,1` ~~`MacBookPro15,3`~~               |

## :unlock: BIOS Settings

> [!IMPORTANT]
> Unlock your BIOS first.

1. Security -> Secure Boot -> `Disabled`
2. Boot -> Fast Boot -> `Disabled`
3. Advanced -> CPU Configuration -> Software Guard Extensions (SGX) -> `Disabled`
4. Advanced -> Power & Performance -> CPU - Power Management Control -> CPU Lock Configuration -> CFG Lock -> `Disabled`
5. Chipset -> System Agent (SA) Configuration -> Above 4GB MMIO BIOS assignment -> `Enabled`
6. Chipset -> System Agent (SA) Configuration -> Graphics Configuration -> DVMT Total Gfx Mem -> `MAX`

## :hammer: Usage

1. Generate SMBIOS info and put it into `config.plist`.
2. Put your EFI into EFI partition.

   ```sh
   # Find EFI partition
   diskutil list

   # Mount EFI partition
   sudo diskutil mount disk0s1

   # Copy EFI to /Volumes/EFI
   cp -a /path/to/your/EFI /Volumes/EFI/

   # Umount EFI partition
   diskutil umount disk0s1
   ```

3. Additionals:

   ```sh
   # TODO
   ```

## :x: Not Working

- NVIDIA Graphics Card

// TODO
