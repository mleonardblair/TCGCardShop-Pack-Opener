# TCG Card Shop Simulator  Pack Opener Script

## Purpose
This script automates the process of opening card packs in the **TCG Card Shop Owner Simulator**, which is typically a tedious and repetitive task. As of game version `v0.34`, this script works reliably to grab and open packs, even handling rare drops that slow down the process.

Since the script relies on specific game timings and does not interact with the game’s internal processes, future game updates may break this functionality if timing changes are made. However, it has been tested with the current version and works as expected.

### Handling Rare Drops
The script accounts for rare card drops by implementing a slightly longer delay around the time that the pack total value is being calculated. This ensures that the script does not break overall due to the slight additional game delay introduced by a rare cards appearance, before the next card appears.

## Usage
1. Double-click the script file `OpenPacks.ahk` to run it.
2. Press `1` on your keyboard to start the pack-opening process.
3. Press `3` to exit the script once done or at any time. If you forget to do this, the script will continue to trigger whenever you press `1`.

# [Example: Opening 2 Hands of 3 Packs](https://www.youtube.com/watch?v=G3QEsq1QnkQ)
[![Watch the video](https://img.youtube.com/vi/G3QEsq1QnkQ/maxresdefault.jpg)](https://www.youtube.com/watch?v=G3QEsq1QnkQ)
### Customization
You can set the number of packs and hands to be processed by editing the `config.ini` file. Open this file in a text editor like Notepad to make changes. By default, the script processes four hands of eight packs, for a total of 32 packs.

## Game Settings for Optimal Performance
To ensure the script works properly, make sure the following settings are applied in the game:

- **Settings > Game > Open Pack > Show New Card**: *Not checked*
- **Settings > Game > Open Pack > Auto Next Card**: *Checked*

## Configuration
You can adjust the number of packs opened per session by modifying the values in the `config.ini` file:
- `packCount`: Number of packs per hand (default is 8).
- `handCount`: Number of hands to process (default is 4).

## Release Information
This script was created, debugged, and published on GitHub on **2024-09-20**.

