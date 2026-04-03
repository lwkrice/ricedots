# Rice Dots
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
## Required Packages
1. **foot** - a light-weight terminal emulator for wayland  
2. **rofi** - a light-weight menu interface required for app launcher, powermenu, and applets  
3. **waybar** - a light-weight status bar  
4. **awww** - a light-weight wallpaper daemon  
5. **mako** - a light-weight notification daemon  

```
sudo pacman -S --needed foot rofi waybar awww mako
```

### Basic Packages
1. **bluez** and **bluez-utils** - for Bluetooth  
2. **pipewire, pipewire-alsa, pipewire-pulse, pipewire-jack**, and **wireplumber** - for audio  

```
sudo pacman -S --needed bluez bluez-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber
```
#### <!> Enable audio and Bluetooth services
```
sudo systemctl enable --now bluetooth.service pipewire.service pipewire-pulse.service wireplumber.service
```

### Additional Packages
1. **grim** and **slurp** - for screenshots  
2. **wf-recorder** - for recording  
3. **wl-clipboard** and **cliphist** - for clipboard  

```
sudo pacman -S --needed grim slurp wf-recorder wl-clipboard cliphist
```
#### Enable clipboard history service for cliphist
```
systemctl --user enable --now cliphist.service
```

---

## The Theme 
- **background** - #141514  
- **foreground** - #f2e0e0  
- **accent** - #f16e65  

---
