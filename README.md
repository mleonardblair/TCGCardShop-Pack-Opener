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

### Important Note: The only time there will be a problem to my knowledge, is if you have many new cards like in a fresh new booster pack you are opening for the first time. 

New cards have a slightly longer delay as the automatic pack opening simply stops flipping cards when a new card is encountered, no matter what game setting you have on, so to beat this there is LMB clicking in the script ongoing at certain times. The script waits for 4.5 seconds to give time for your game to "catch up" to normal operating timing, if enough new cards are in a row, it is possible for the delay caused by these new cards to stack and cause the script to "ditch" you and continue on as some have noted and as i've have observed myself. The script is built for a use case where you may have max 4/8 cards are new, however this can lead to issues if there are 5+ new cards per hand. Being aware of this you can prevent this occurring by doing one ~~of two~~ thing~~s~~:

~~1) Modify the AHK script by opening in notepad and modifying the 75 loop to 95 loops, this will add an extra two seconds flat of clickthrough to account for the additional animation time delay of encountering new cards in the pack opening sequence, leaving less chance for you to get "lapped" by the script, as it proceeds on without you.~~ Edit: Don't try.
~~2~~ 1) Manually open maybe 32 - 64 packs, gain at least half of the new cards for that booster pack, and then you'll be able to use this script with confidence that it will not get "stuck" when you want to farm for higher rarity cards or when you are wanting to afk.

~~I plan to do several recordings, eventually having recordings that cover 1 new card per hand all the way to optimally 8 new cards per hand, and afterward do an analysis to get the exact millisecond difference in delay of a seen vs never before seen card, of varying quantities. Eventually once i dial that in, one script will work in all circumstances, but I need to level up to 40 to get more new packs, or start a new game to run this experiement~~, so for now this is hacky workaround thats good for the meanwhile for anyone who cares to modify the script for their personal use case.

#### v0.38 (WIP)

Currently am working on a new featured keybind for those who want to open a user specified number of shelves automatically. Currently it's finished being made, and I've modified the base script to check for new cards using pixel detection, which avoids the issues with rare card delays needing to be accounted for. The demo below is operating at normal speed, hence the video duration, however it will support v0.38 pack opening max speed, I'm just updating it for now, so check back soon.
   - Updated tooltip to show the box number explicitly.

You can customize the number of packs this script opens by modifying the configuration file in a text editor. By default, it will process four hands of eight packs for a total of 32 packs.

## Game Settings
To ensure the script works properly, make sure the following settings are applied in the game:

- **Settings > Game > Open Pack > Show New Card**: *Not checked*
- **Settings > Game > Open Pack > Auto Next Card**: *Checked*

## Configuration
You can adjust the number of packs opened per session by modifying the values in the `config.ini` file:
- `packCount`: Number of packs per hand (default is 8).
- `handCount`: Number of hands to process (default is 4).
_*New*_
- `boxCount`: Number of boxes to process (default is 2 boxes of 4 hands of 8 packs (64), when pressing 4 or 6 keybinds, 1 box when press keybind 1)
## Release Information
- v0 beta Created, debugged, and published on **2024-09-20**.
- Updated for release v1.0, for game version `v0.37` on **2024-09-23**.
   - Resolved user-reported script performance inconsistencies by removing active game window focus from the card opening loop.
- Added in player movement, so that it can process up to 
