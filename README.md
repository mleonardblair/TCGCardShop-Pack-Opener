# 🃏 TCG Card Shop Simulator | Auto Pack Opener

**Author**: mleonardblair
**Downloads**: 10,000+ via [NexusMods](https://www.nexusmods.com/tcgcardshopsimulator/mods/16)  
**Script Type**: UI automation using AutoHotKey with user-defined config

## 🔍Overview

**Auto Pack Opener (APO)** is a fully configurable automation script for [TCG Card Shop Simulator](https://store.steampowered.com/app/2289240/TCG_Card_Shop_Simulator/) . It automates the current time-consuming dilemma in **TCG Card Shop Simulator** of grabbing and opening any number of card packs. This works with rare drops that as of live (v0.38), stop the card opening flow. This script avoids you having to constantly click through, if there is a rare card, and it has delays placed intentionally when the card pack total value is being calculated at the end, that's slightly longer than it actually takes on purpose. This ensures that if you get many rare cards in the pack, it does not break the script timings, so you can leave the room if you want. 

> APO removes the need to manually click through hundreds of card packs and intelligently handles interruptions such as rare drops and card evaluation delays — all without reading or injecting memory. It uses screen-based pixel detection and configurable logic.


---


## 💡 Key Features

- ✅ **Pixel-based automation** — safe, memory-free interaction using screen detection
- ✅ **Resolution scaling** — supports all 16:9 aspect ratios with adjustable `width`/`height` config
- ✅ **Customizable pack count, speed, and box logic** via `config.ini`
- ✅ **Multiple run modes** (`1`, `4`, or `6` keybinds) for flexible batch operation
- ✅ **Built-in delays to accommodate rare cards or pack value displays**
- ✅ **Tooltip overlay** for live progress tracking
- ✅ **Patch-versioned releases** tested against v0.34–v0.38 of the game

## 🚩Usage
To use this script:
1. Open the `config.ini` file:
   - if your monitor resolution is not `1920 x 1080` , replace the `width` and `height`values with your monitors values.
   - if the new pack opening in-game speed is not set to max, then `speed` should be set to 1. (10 is default max speed)
2. Either run the exe or download [autohotkey](https://www.autohotkey.com/) and run the uncompiled ahk script directly.
3. To open one box - Press `1` on your keyboard to start the pack-opening process for a single box. (32 default)
3. To open multiple boxes - `4` or `6` to open multiple boxes/shelves. (Default is 2 shelves or 64 packs total, 32 packs per shelf)
   - `4` Will move your character left after each shelf is cleared, meaning you must **start at the rightmost shelf**.
   - `6` Will move your character right after each shelf is cleared, meaning you must **start at the leftmost shelf**.
4. After you're done, press `3` to quit out of the script, otherwise, it'll remain active and trigger whenever you press `1`.
---

## 📺 Demo Video
The number of hands and packs per hand can be set in an INI file you can open in a text editor like Notepad.
# [Example: Opening 2 Boxes - 4 Hands of 8 Packs](https://youtu.be/yAKYqAP0y3w)
[![Watch the video](https://img.youtube.com/vi/G3QEsq1QnkQ/maxresdefault.jpg)](https://youtu.be/yAKYqAP0y3w)

## 🧪 Config.ini Breakdown

| Setting     | Purpose                                             | Default |
|-------------|------------------------------------------------------|---------|
| `packCount` | Packs picked up per hand                            | `8`     |
| `handCount` | Hands to process per box                            | `4`     |
| `boxCount`  | Number of boxes/shelves to run                      | `2`     |
| `speed`     | Speed of pack-opening animation (1 or 10)           | `10`    |
| `width`     | Monitor width in pixels                             | `1920`  |
| `height`    | Monitor height in pixels                            | `1080`  |

You can adjust the number of packs opened per session by modifying the values in the `config.ini` file:
- `packCount`: Number of packs per hand (default is 8).
- `handCount`: Number of hands to process (default is 4).
_*New*_
- `boxCount`: Number of boxes to process (default is 2 boxes of 4 hands of 8 packs (64), when pressing `4` or `6` keybinds, and default 1 box of 32 packs when pressing  keybind `1`)
You can change the tooltip and pixel detection scaling to your monitor resolution by modifying the values below in the `config.ini` file:
- `height` : Change to height of monitor resolution being played on (E.g default is 1920 for 1080p, 2560 for 1440p etc)
- `width` : Change to width of monitor resolution being played on (E.g default is 1080 for 1080p, 1440 for 1440p etc)
You can change the speed that packs are opened per session by modifying the value below in the `config.ini` file:
- `speed` : Number to control whether set to max speed pack opening or not. 10 is max speed relative to the ingame slider, 1 is normal or lowest speed, that was default only speed prior to patch v0.38 of the game. Treat as a toggle for now. (Set to 10 or 1 only)

## 🙋 FAQ

> ❓ *Will this work on 1440p or ultrawide?*  
🔹 Yes, as long as you update the resolution fields in `config.ini` and maintain a 16:9 aspect ratio.

> ❓ *Will this break after future game updates?*  
🔹 Possibly. The script is version-specific to in-game animation timing and may need tweaks if pack-opening logic changes. Check NexusMods page for latest compatibility updates.

> ❓ *Does this interact with the game memory or violate TOS?*  
🔹 No — it uses screen detection and input automation only.
---
## Gotcha: 
*Very Important* If you are not on a 1920 x 1080 display monitor you must manually change default to monitors resolution in the config.ini file! Pixel detection used requires scaling to resolution size, all 16:9 aspect ratios are supported, however, if you do not tell it what yours is, It will get stuck on flipping cards because its not scaling the functionality to your screen!!!
I anticipate that the game's developer may choose to make timing changes to the pack opening flow, like number of packs to open options and with any new features, it is likely that will break this script, as it relies on predicting/determining current game timings, and is not actually scanning any processes in the game. However, as of game version ~~v0.34 v0.37~~ v0.38, it's functional.

New cards have a slightly longer delay as the automatic pack opening simply stops flipping cards when a new card is encountered, no matter what game setting you have on, so to beat this new features have been added as of v0.38 notes below
## APO v0.2 for game v0.38

Added support for rapid card opening via the `speed` variable in config.ini, simply set `speed` to 10 for max speed, and put to 1 for lowest speed. currently these are the only tested & supported modes so consider it a toggle feature, not a scaling one.
Add new keybind for those who want to open a user specified number of shelves/boxes automatically. See usage for more details.
Now checks for new cards using pixel detection, which avoids the issues with rare card delays needing to be accounted for. The demo below is operating at max speed in settings in-game and `speed` at 10 in the config.ini file.
   - Updated tooltip to show the box number explicitly. 
You can customize the number of packs this script opens by modifying the configuration file in a text editor. By default, it will process four hands of eight packs for a total of 32 packs.
Resolution is something that must be accounted for with pixel detection, so put your given monitor resolution in the `width` and `height` variables in the config.ini, by default they are set for 1080 but any resolution is supported. Note tested on 1440 and 1080, however no foreseeable issues so long as 16:9 aspect ratio applies.

## ✅ Game Settings
To ensure the script works properly, make sure the following settings are applied in the game:

- **Settings > Game > Open Pack > Show New Card**: *Not checked*
- **Settings > Game > Open Pack > Auto Next Card**: *Checked*
- **Settings > Game > Open Pack > Speed**: Slider To Farthest Right**

## 🔗 Links

- 💾 [Download on NexusMods](https://www.nexusmods.com/tcgcardshopsimulator/mods/16)
- 📁 [Source on GitHub](https://github.com/mleonardblair/TCGCardShop-Pack-Opener)
  
## 📒 Auto Pack Opener - Release Information
- v0 Created, debugged, and published on **2024-09-20**.
- v0.1, for game version `v0.37` , this script version released on **2024-09-23**.
   - Resolved user-reported script performance inconsistencies by removing active game window focus from the card opening loop.
- v0.2, for game version `v0.38` patched on **2024-09-24**, this script version released on **2024-09-25** .
    - Added in new keybinds to auto pack opener for player movement, left and right, so that it can process up to nth number of shelves/boxes the user defines in config.ini.
    - Updated tooltip that displays progress of the current box out of the total user defined box number that will be opened.
    - ~~*WIP*~~ Updated to support new v0.38 setting of fast pack opening, controllable via user defined value in config.ini.
    - Updated to scale to work on all monitors for new pixel detection of rare new cards

## 📜 License

This project is licensed under the [MIT License](./LICENSE).
