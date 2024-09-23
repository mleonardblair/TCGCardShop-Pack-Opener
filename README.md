# TCG Card Shop Simulator Pack Auto Opener

## Purpose
This script automates the current dilemma in **TCG Card Shop Simulator** of grabbing and opening any number of card packs.. I anticipate that the game's developer may choose to make timing changes to the pack opening flow, like number of packs to open options and with any new features, it is likely that will break this script as it relies on predicting current game timings and is not actually scanning any processes in the game. However, as of game version ~~v0.34~~ v0.37, it's functional.

This works even with rare drops that of live, stop the card opening flow. This script removes you having to constantly click through if there is a rare card, and it has delays placed intentionally when the pack total value is being calculated at the end, that's slightly longer than it actually takes on purpose to ensure that if you get many rare cards in the pack, it does not break the script timings you can leave the room if you want. 

## Usage
To use this script:
1. Either run the exe or download autohotkey and run the uncompiled ahk script directly.
2. Press `1` on your keyboard to start the pack-opening process.
4. After you're done, press `3` to quit out of the script, otherwise, it'll remain active and trigger whenever you press `1`.

The number of hands and packs per hand can be set in an INI file you can open in a text editor like Notepad.
# [Example: Opening 2 Hands of 3 Packs](https://www.youtube.com/watch?v=G3QEsq1QnkQ)
[![Watch the video](https://img.youtube.com/vi/G3QEsq1QnkQ/maxresdefault.jpg)](https://www.youtube.com/watch?v=G3QEsq1QnkQ)

You can customize the number of packs this script opens by modifying the configuration file in a text editor. By default, it will process four hands of eight packs for a total of 32 packs.

## Game Settings
To ensure the script works properly, make sure the following settings are applied in the game:

- **Settings > Game > Open Pack > Show New Card**: *Not checked*
- **Settings > Game > Open Pack > Auto Next Card**: *Checked*

## Configuration
You can adjust the number of packs opened per session by modifying the values in the `config.ini` file:
- `packCount`: Number of packs per hand (default is 8).
- `handCount`: Number of hands to process (default is 4).

## Release Information
- v0 beta Created, debugged, and published on **2024-09-20**.
- Updated for release v1.0, for game version `v0.37` on **2024-09-23**.
   - Resolved user-reported script performance inconsistencies by removing active game window focus from the card opening loop.

