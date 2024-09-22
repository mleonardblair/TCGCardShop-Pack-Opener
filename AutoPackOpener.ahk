; Read from the configuration file
packCount := IniRead("config.ini", "Settings", "packCount", 8)  ; Default to 8 if not found
handCount := IniRead("config.ini", "Settings", "handCount", 4)  ; Default to 4 if not found
SendMode("Event")  ; Set once before loops


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
        Sleep(4250)  ; Sleep twice as long for the last packs
	Send("{LButton}")
	if packCount == packNumber 
        {
		Tooltip("LAST PACK")
		;Critical
		Send("{LButton}")
		Sleep(250)  ; Sleep for 100 milliseconds to prevent overload
		;Critical "Off"

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
