/*
PURPOSE
=======
This script automates the current dilemma in TCG card shop simulator of opening card packs which is boring and lame currently. I anticipate that the game's developer likely may choose to make timing changes to the pack opening flow, so it is likely that will break this script as it relies on predicting current game timings, and is not actually scanning any processes in the game; however that said, as of game version v0.34 it's functionally grabbing and opening packs. 

This works even with rare drops, as it has delays placed intentionally when the pack total value is being calculated that's slightly longer than it actually takes on purpose. This ensures that if you get many rare cards in the pack, it does not break the script timings, as rare cards have a slightly longer delay in the game before the next card appears.

USAGE
=====
To use this script double click this script OpenPacks.ahk, and press 1 on your keyboard. Make sure after use to press 3 to quit out of the script otherwise it'll remain and trigger whenever you press 1.

The number of hands and packs per hand can be set in an INI file you can open in a text editor like notepad.

That said, the script was created, debugged, and published on github on 2024-9-20 in an hour or two, with the following game settings:

Settings > Game > Open Pack > Show New Card (not checked)
Settings > Game > Open Pack > Auto Next Card (checked)


You can customize the number of packs this script opens by modifying the configuration file in a text editor, by default it will process four hands of eight packs for 32 packs total.

*/

; Read from the configuration file
packCount := IniRead("config.ini", "Settings", "packCount", 8)  ; Default to 8 if not found
handCount := IniRead("config.ini", "Settings", "handCount", 4)  ; Default to 4 if not found


; Function to grab packs
grabPacks(handNumber, packCount) {
    ToolTip(handNumber " - Pressing and holding right mouse button to grab " packCount " packs...")
    StartTime := A_TickCount  ; Record the start time
    Click("right down")  ; Hold the right mouse button
    Sleep(156.25*packCount)  ; Hold duration based on packCount
    Click("right up")  ; Release the right mouse button
    EndTime := A_TickCount  ; Record the release time
    HoldDuration := EndTime - StartTime  ; Calculate hold duration
    ToolTip(handNumber " - Released! Hold duration: " HoldDuration " ms")  ; Show the hold duration in milliseconds
    Sleep(2000)  ; Keep the message on screen for 2 seconds
    ToolTip()  ; Clear the ToolTip
}

; Function to open packs
openPacks(handNumber, packCount) {
    Loop packCount
    {
        packNumber := A_Index  ; Get current pack number

        ToolTip(handNumber " - Pack " packNumber "/" packCount " - Selecting a pack...")  ; Notify user of pack opening
        SendMode("Event")  ; Set SendMode to Event for better compatibility with games
        Send("r")  ; Flip the first pack over
        Loop 10
        {
            Send("{LButton}") 
            Sleep(50) 
        }

        ; Ensure the game window is active before clicking
        WinActivate("ahk_exe Card Shop Simulator.exe")  
        
        ToolTip(handNumber " - Pack " packNumber "/" packCount " - Opening new pack...")
        Send("{LButton}")  ; Simulate left mouse button click
        Loop 15
        {
            Send("{LButton}")  ; Simulate left mouse button click for each card
            Sleep(50)  ; 0.05-second delay between card scans
        }

        ToolTip(handNumber " - Pack " packNumber "/8 - Flipping through cards...")
        StartTime := A_TickCount  ; Record the start time

        ; Loop through scanning cards with a 50 ms delay between each click
        Loop 75
        {
            Send("{LButton}")  
            Sleep(50)  ; 0.05-second delay between card scans
        }

        EndTime := A_TickCount  ; Record end time
        HoldDuration := EndTime - StartTime  ; Calculate total duration for flipping the pack
        ToolTip(handNumber " - Pack " packNumber "/" packCount " - Pack opened! Time taken: " HoldDuration " ms")

        ; Wait until the money total is calculated
        ToolTip(handNumber " - Pack " packNumber "/" packCount " - Waiting for cash total to complete...")
        if (packNumber == packCount) {
            Sleep(4500)  ; Sleep twice as long for the last pack
        } else {
            Sleep(3500)  ; Normal sleep duration for packs 1-7
            Loop 3
            {
                Sleep(50)
                Send("{LButton}")  
            }
        }
        ToolTip()  ; Clear the ToolTip
    }
}

1:: ; Press 1 to start the pack-opening process for multiple hands of packs
{
    ; Loop through for the number of hands defined by handCount
    Loop handCount
    {
        currentHand := A_Index  ; Tracks the current hand number
        grabPacks(currentHand, packCount)
        openPacks(currentHand, packCount)
        Sleep(250)
	Send("{LButton}") 
        Sleep(250)
    }

    ToolTip("All packs opened!")  ; Notify user after all packs are opened
    Sleep(2000)  ; Keep the message on screen for 2 seconds
    ToolTip()  ; Clear the ToolTip
}
return

3:: ; Press 3 to close the script
{
    ToolTip("Closing AutoHotkey Script...")  
    Sleep(2000)  ; Keep the message on screen for 2 seconds
    ExitApp()  
}
