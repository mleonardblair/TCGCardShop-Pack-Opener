# TCG Card Shop Simulator Pack Opener Script

## Purpose
This script automates the current dilemma in **TCG Card Shop Simulator** of opening card packs, which could be better than it is currently. I anticipate that the game's developer may choose to make timing changes to the pack opening flow, and new features, so it is likely that will break this script as it relies on predicting current game timings and is not actually scanning any processes in the game. However, as of game version `v0.34`, it's functionally grabbing and opening packs.

This works even with rare drops, as it has delays placed intentionally when the pack total value is being calculated that's slightly longer than it actually takes on purpose. This ensures that if you get many rare cards in the pack, it does not break the script timings, as rare cards have a slightly longer delay in the game before the next card appears.

## Usage
To use this script:
1. Double-click the script file `OpenPacks.ahk`.
2. Press `1` on your keyboard to start the pack-opening process.
3. After you're done, press `3` to quit out of the script, otherwise, it'll remain active and trigger whenever you press `1`.

The number of hands and packs per hand can be set in an INI file you can open in a text editor like Notepad.
# [Example: Opening 2 Hands of 3 Packs](https://www.youtube.com/watch?v=G3QEsq1QnkQ)
[![Watch the video](https://img.youtube.com/vi/G3QEsq1QnkQ/maxresdefault.jpg)](https://www.youtube.com/watch?v=G3QEsq1QnkQ)

## Game Settings
The script was created, debugged, and published on GitHub on **2024-09-20** with the following game settings:

- **Settings > Game > Open Pack > Show New Card**: *Not checked*
- **Settings > Game > Open Pack > Auto Next Card**: *Checked*

## Customization
You can customize the number of packs this script opens by modifying the configuration file in a text editor. By default, it will process four hands of eight packs for a total of 32 packs.

## Required Game Settings
To ensure the script works properly, make sure the following settings are applied in the game:

- **Settings > Game > Open Pack > Show New Card**: *Not checked*
- **Settings > Game > Open Pack > Auto Next Card**: *Checked*

## Configuration
You can adjust the number of packs opened per session by modifying the values in the `config.ini` file:
- `packCount`: Number of packs per hand (default is 8).
- `handCount`: Number of hands to process (default is 4).

## Release Information
This script was created, debugged, and published on GitHub on **2024-09-20**.

