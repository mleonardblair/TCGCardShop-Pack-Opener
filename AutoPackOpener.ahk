; DO NOT REMOVE: Made by mleonardblair and can be downloaded at https://github.com/mleonardblair/TCGCardShop-Pack-Opener/
#SingleInstance

; Define the RGB colors looking for
colorRarePack1 := 0xF3F3F3  ; Color at (718, 206)
colorRarePack2 := 0x000000  ; Color at (698, 167)
colorRarePack3 := 0xFFFFA5  ; Color at (672, 187)

; Default resolution is 1920x1080
defaultWidth := 1920
defaultHeight := 1080

coord1 := [718, 206]
coord2 := [698, 167]
coord3 := [672, 187]

colorTV1 := 0xFBF4AE
colorTV2 := 0xF7F0AB
coord4 := [1075, 913]
coord5 := [1069, 917]  
; Default resolution is 1920x1080
defaultWidth := 1920
defaultHeight := 1080

; Read from the configuration file
packCount := IniRead("config.ini", "Settings", "packCount",8)  ; Default to 8 if not found
handCount := IniRead("config.ini", "Settings", "handCount", 8)  ; Default to 4 if not found
boxCount := IniRead("config.ini", "Settings", "boxCount", 7)  ; Default to 2 if not found
; Read user-specified resolution from config.ini
userWidth := IniRead("config.ini", "Settings", "width", defaultWidth)
userHeight := IniRead("config.ini", "Settings", "height", defaultHeight)
speed := IniRead("config.ini", "Settings", "speed", 10)  ; Default to 20 if not found
maxEightHands := true ; default because keybind 1 is intended to be stationary and pull 64 packs, or 8 hands of 8 packs. 1 full box max. to get around this use keybind 4 or 6 which can do more than one box autonomously


; Calculate scaling factors dynamically based on user resolution
scaleX := userWidth / defaultWidth
scaleY := userHeight / defaultHeight

; Function to scale coordinates based on user's resolution
scaleCoordinates(coord) {
    global scaleX, scaleY
    return [Round(coord[1] * scaleX), Round(coord[2] * scaleY)]
}


; Set global variables for tooltip position
x := 810 * scaleX
y := 935 * scaleY
coord1 := scaleCoordinates(coord1)
coord2 := scaleCoordinates(coord2)
coord3 := scaleCoordinates(coord3)
coord4 := scaleCoordinates(coord4)
coord5 := scaleCoordinates(coord5)

tvColorMatched := false
colorMatched := false

SendMode("Event")  ; Set once before loops
; Set coordinate mode to window (relative to the active window)
CoordMode("Pixel", "Window")


; Function to check colors and modify global colorMatched variable
checkForRareCard() {
    global colorMatched, coord1,coord2,coord3 ; Declare colorMatched as a global variable here
    global colorRarePack1, colorRarePack2, colorRarePack3  ; 
    foundColor1 := PixelGetColor(coord1[1], coord1[2], "RGB")
    foundColor2 := PixelGetColor(coord2[1], coord2[2], "RGB")
    foundColor3 := PixelGetColor(coord3[1], coord3[2], "RGB")

    ; Assign the result to the global variable
    colorMatched := (foundColor1 == colorRarePack1) && (foundColor2 == colorRarePack2) && (foundColor3 == colorRarePack3)
}

; Function to check colors and modify global colorMatched variable
checkForTV() {
    global tvColorMatched, coord4, coord5 ; 
    global colorTV1, colorTV2  ;
    foundColor4 := PixelGetColor(coord4[1], coord4[2], "RGB")
    foundColor5 := PixelGetColor(coord5[1], coord5[2], "RGB")
    ; Assign the result to the global variable
    tvColorMatched := (foundColor4 == colorTV1) && (foundColor5 == colorTV2) 
}

; Function to move character left then scan box
HoldAKey(duration) {
    Send("{A down}")  ; Hold down the A key
    Sleep(duration)    ; Wait for the specified duration (in milliseconds)
    Send("{A up}")    ; Release the A key
}

; Function to move character right then scan box
HoldDKey(duration) {
    Send("{D down}")  ; Hold down the D key
    Sleep(duration)    ; Wait for the specified duration (in milliseconds)
    Send("{D up}")    ; Release the D key
}

; Function to grab packs
grabPacks(handCount, handNumber, packCount) {
    global x, y
  
    ToolTip(handNumber " - Pressing and holding right mouse button to grab " packCount " packs...", x, y) 
    StartTime := A_TickCount  ; Record the start time
    Click("right down")  ; Hold the right mouse button
    Sleep(156.25*packCount)  ; Hold duration based on packCount
    Click("right up")  ; Release the right mouse button
    EndTime := A_TickCount  ; Record the release time
    HoldDuration := EndTime - StartTime  ; Calculate hold duration
    ToolTip(handNumber " - Released! Hold duration: " HoldDuration " ms", x, y)   ; Show the hold duration in milliseconds
    Sleep(2000)  ; Keep the message on screen for 2 seconds
    ToolTip("")  ; Clear the ToolTip
}



; Function to open packs
openPacks(handCount, handNumber, packCount, boxNumber, maxEightHands := true) {  ; default true because keybind 1 is intended to be stationary and pull 64 packs, or 8 hands of 8 packs, 1 full box max.
    global x, y, colorMatched, tvColorMatched
    Loop packCount
    {
	Sleep(250)  ;
        packNumber := A_Index  ; Get current pack number

        ToolTip((!maxEightHands ? "Box " boxNumber "/" boxCount " - " : "") "Hand " handNumber "/" handCount " - Pack " packNumber "/" packCount " - Selecting a pack...", x, y)

        Send("r")  ; Flip the first pack over
        Loop 2
        {
            Send("{LButton}") 
            Sleep(300) 
        }
        
        ToolTip((!maxEightHands ? "Box " boxNumber "/" boxCount " - " : "") "Hand " handNumber "/" handCount " - Pack " packNumber "/" packCount " - Opening new pack...", x, y) 
        Send("{LButton}")  ; Simulate left mouse button click
        Loop 2 ; 
        {
            Send("{LButton}")  ; Simulate left mouse button click for each card
            Sleep(300)  
        }

        ToolTip((!maxEightHands ? "Box " boxNumber "/" boxCount " - " : "") "Hand " handNumber "/" handCount " - Pack " packNumber "/" packCount " - Flipping through cards...", x, y) 
        StartTime := A_TickCount  ; Record the start time

        
        while true  ; Repeat till no detection and tv still not detected
        {
	    ; Check for rare card
            checkForRareCard()
	    checkForTV()
            if (colorMatched == true && tvColorMatched == false) { ; if new card detected and not cash totalling then press to skip card
                 Send("{LButton}")  
                 colorMatched := false ; reset for next rare card detection event
	    }
	    if (tvColorMatched == true){
 		break
	    }
            Sleep(100)   ; prevent cpu overstimulation      
	}

        EndTime := A_TickCount  ; Record end time
       

        ; Wait until the money total is calculated
        ToolTip((!maxEightHands ? "Box " boxNumber "/" boxCount " - " : "") "Hand " handNumber "/" handCount " - Pack " packNumber "/" packCount " - Waiting For Cash Calculation...", x, y) 
        
        Sleep(4250/speed) 

	while true { ; Repeat till its completed
		if tvColorMatched == true { 	; Condition to break the loop
			; if already detected reset
			ToolTip((!maxEightHands ? "Box " boxNumber "/" boxCount " - " : "") "Hand " handNumber "/" handCount " - Pack " packNumber "/" packCount " - Total Cash Calculation Completion  Detected", x, y) 
			tvColorMatched := false	
 			Sleep(500)
			break
        	} else {
			; Not already detected (there were rare cards) then try to detect..
			 checkForTV()
		}
    	        
    		; Optional: Add a small sleep delay to prevent CPU overuse
    		Sleep(150)  ; Sleep for 100 milliseconds
	}
	if packCount == packNumber 
        {
		Send("{LButton}")
		Sleep(350)  ;
        
	}
        ToolTip()  ; Clear the ToolTip
    }
}

; Function to process hands of packs and multiple boxes
processHands(packCount, handCount, boxNumber) {
    global x, y, maxEightHands  ; Access the global x and y coordinates for tooltips
    maxEightHands := false ; disabled
    Loop handCount
    {
        currentHand := A_Index  ; Tracks the current hand number
        grabPacks(handCount, currentHand, packCount)  ; Call the function to grab packs
        openPacks(handCount, currentHand, packCount, boxNumber, maxEightHands)  ; Call the function to open packs
    }
}

; Function to process hands of packs in a single box
processMaxEightHands(packCount, handCount, boxNumber:=1) {
    global x, y  ; Access the global x and y coordinates for tooltips
    Loop handCount
    {
        currentHand := A_Index  ; Tracks the current hand number
        grabPacks(handCount, currentHand, packCount)  ; Call the function to grab packs
        openPacks(handCount, currentHand, packCount, boxNumber)  ; Call the function to open packs
    }
}

1:: ; Press 1 to start the pack-opening process for multiple hands of packs
{
    global x, y
    ; Loop through for the number of hands defined by handCount
    processMaxEightHands(packCount, handCount) ; Take care of one box
    ToolTip("All " packCount * handCount " packs and " (packCount * 8) * handCount " total cards opened!", x, y)  ; Notify user after all packs are opened
    Sleep(4000)  ; Keep the message on screen for 2 seconds
    ToolTip("")  ; Clear the ToolTip
}
return

2:: ; Press 2 for a soft stop and reload the script
{
    Reload()  ; This will reload the script, acting as a "soft" reset
    ; Reloading clears all current variables and starts the script over from the top
    ToolTip("Script Reloaded. Ready to start again.", x, y)
    Sleep(2000)
    ToolTip("")
}


3:: ; Press 3 to close the script
{
    global x, y
    ToolTip("Closing AutoHotkey Script...", 870, 935)
    Sleep(2000)  ; Keep the message on screen for 2 seconds
    ExitApp()  
}

4:: ; Keybind 4: Initiates a loop with boxCount iterations of processHands
{
    global x, y
    Loop boxCount
    {
        currentBox := A_Index
        processHands(packCount, handCount, currentBox)  ; Call the processing loop for each box/shelf
        if currentBox == boxCount ; After last box don't move and report result.
        {
             reportOpened()
        }
        else {
	     ToolTip("Moving Left To Next Shelf/Box.." . currentBox . "/" . boxCount)
	     Sleep(1200)
	     HoldAKey(123)
             ToolTip("Move Completed - Shelf/Box.." . currentBox + 1. "/" . boxCount)
	     Sleep(1200)
        }
    }
}


; Keybind 6: Same as 4 but can be used to test or initiate another loop but rightaa
6:: 
{
    global x, y
    Loop boxCount
    {
	currentBox := A_Index
        processHands(packCount, handCount, currentBox)  ; Call the processing loop for each box/shelf
        if currentBox == boxCount ; After last box don't move and report result.
        {
             reportOpened()
        }
        else {
	     ToolTip("Moving Right To Next Shelf/Box.." . currentBox . "/" . boxCount)
	     Sleep(1000)
	     HoldDKey(123)
             ToolTip("Move Completed - Shelf/Box.." . (currentBox + 1) . "/" . boxCount)
	     Sleep(1000)
        }
    }
}

reportOpened() { ; report total number of cards opened
    global x, y
    ToolTip("All " . (packCount * handCount * boxCount) . " packs and " . ((packCount * 8) * handCount * boxCount) . " total cards opened!", x, y)  ; Notify user after all packs are opened
    Sleep(4000)  ; Keep the message on screen for 2 seconds
    ToolTip("")  ; Clear the ToolTip
}
