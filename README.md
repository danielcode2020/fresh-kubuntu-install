# New instance setup
**Tested with:**
- [x] Kubuntu 24.04.3
- [x] Ubuntu 26

**Development Environment Setup**

This repository contains two Bash scripts to quickly set up a fresh ubuntu machine for development and work.

**Scripts Included**
1. docker_install.sh
Installs and configures Docker on your system.
2. apps_install.sh
Installs commonly used applications and tools for development/work.

**Usage**

Make scripts executable:

```bash
chmod +x docker_install.sh apps_install.sh
```

Run Docker installation:
```bash
sudo ./docker_install.sh
```

Run development apps installation:
```bash
sudo ./apps_install.sh
```

# High CPU when using ThinkVision monitor ubuntu how to address 

# System Details Report
---

## Report details
- **Date generated:**                              2026-07-23 11:44:46

## Hardware Information:
- **Hardware Model:**                              Lenovo ThinkPad T480s
- **Memory:**                                      16.0 GiB
- **Processor:**                                   Intel® Core™ i5-8250U × 8
- **Graphics:**                                    Intel® UHD Graphics 620 (KBL GT2)
- **Disk Capacity:**                               1.0 TB

## Software Information:
- **Firmware Version:**                            N22ET85W (1.62 )
- **OS Name:**                                     Ubuntu 26.04 LTS
- **OS Build:**                                    (null)
- **OS Type:**                                     64-bit
- **GNOME Version:**                               50
- **Windowing System:**                            Wayland
- **Kernel Version:**                              Linux 7.0.0-27-generic


# Step 1 : **Use standard 100% display instead of fractional scaling** 

# Step2 : **Fix the ThinkPad Throttling Bug (throttled)** (verified and works)

Lenovo 8th-gen laptops (T480/T480s) have a known bug in Linux where the Embedded Controller locks power limits incorrectly, causing thermal throttling and weird fan curves.

Installing the community-standard fix stops thermal conflicts:

```bash
sudo apt install python3-dbus python3-gi python3-apt build-essential
git clone https://github.com/erpalma/throttled.git
cd throttled
sudo ./install.sh
```