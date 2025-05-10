# Freenove ADS7830 device driver

A simple driver for the Freenove ADS7830 8-channel ADC module. This library provides simple I2C communication with the ADS7830 chip, enabling voltage measurements for my Raspberry Pi and other embedded Linux projects.

## Installation

The repo contains a Makefile which includes simple installation/uninstallation and clean-up scripts. Note that installation will will install library system-wide in /lib/ so if you don't want that, be sure to modify the Makefile.

```
git clone https://github.com/zakfarrow/ads7830.git
cd ads7830

# Build the library
make

# Install system-wide (requires sudo)
make install
```
**Note:** The installation places the library in `/lib/` and headers in `/usr/include/`. If you prefer a different location, modify the Makefile before installation.
