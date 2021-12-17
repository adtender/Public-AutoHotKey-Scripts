; Created by Asger Juul Brunshøj

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. Take inspiration from the samples provided here.

;-------------------------------------------------------------------------------
;;; SEARCH GOOGLE ;;;
;-------------------------------------------------------------------------------
if Pedersen = g%A_Space% ; Search Google
{
    gui_search_title = LMGTFY
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = a%A_Space% ; Search Google for AutoHotkey related stuff
{
    gui_search_title = Autohotkey Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = p%A_Space% ; Search Google for AutoHotkey related stuff
{
    gui_search_title = Python Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=python%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = m%A_Space% ; Open more than one URL
{
    gui_search_title = multiple
    gui_search("https://www.google.com/search?&q=REPLACEME")
    gui_search("https://www.bing.com/search?q=REPLACEME")
    gui_search("https://duckduckgo.com/?q=REPLACEME")
}
else if Pedersen = x%A_Space% ; Search Google as Incognito
;   A note on how this works:
;   The function name "gui_search()" is poorly chosen.
;   What you actually specify as the parameter value is a command to run. It does not have to be a URL.
;   Before the command is run, the word REPLACEME is replaced by your input.
;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
{
    gui_search_title = Google Search as Incognito
    gui_search("C:\Users\WMPCw\AppData\Local\Vivaldi\Application\vivaldi.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
}


;-------------------------------------------------------------------------------
;;; SEARCH OTHER THINGS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}
else if Pedersen = kill2002
{
    gui_destroy()
    DetectHiddenWindows, On
    WinClose, C:\Users\WMPCw\Documents\GitHub\FFXIV-Queue-Dodger\QueueDodger.ahk ahk_class AutoHotkey
    DetectHiddenWindows, Off

}
else if Pedersen = killinst
{
    gui_destroy()
    DetectHiddenWindows, On
    WinClose, C:\Users\WMPCw\Documents\GitHub\FFXIV-Instance-Switcher\instanceSwitcher.ahk ahk_class AutoHotkey
    DetectHiddenWindows, Off
; (you may want to disable DetectHiddenWindows afterwards)

}
;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = tab ; Open up new Vivaldi tab
{
    gui_destroy()
    run www.google.com
}
else if Pedersen = / ; Go to subreddit. This is a quick way to navigate to a specific URL.
{
    gui_search_title := "/r/"
    gui_search("C:\Users\WMPCw\AppData\Local\Vivaldi\Application\vivaldi.exe -incognito https://www.reddit.com/r/REPLACEME")
}
else if Pedersen = note ; Notepad++
{
    gui_destroy()
    Run "C:\Program Files (x86)\Notepad++\notepad++.exe"
}
else if Pedersen = paint ; MS Paint
{
    gui_destroy()
    run "C:\Program Files\paint.net\paintdotnet.exe"
}
else if Pedersen = gmail ; Open google inbox
{
    gui_destroy()
    run https://inbox.google.com/u/1/
    ; run https://mail.google.com/mail/u/0/#inbox  ; Maybe you prefer the old gmail
}
;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if Pedersen = rel ; Reload this script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}
else if Pedersen = exit ; Exits out of the launcher
{
    gui_destroy()
    ExitApp
}
;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}
;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = ? ; Tooltip with list of commands
{
    GuiControl,, Pedersen, ; Clear the input box
    Gosub, gui_commandlibrary
}
else if Pedersen = inst
{
    gui_destroy()
    run "C:\Users\WMPCw\Documents\GitHub\FFXIV-Instance-Switcher\instanceSwitcher.ahk"
}
else if Pedersen = 2002
{
    gui_destroy()
    run "C:\Users\WMPCw\Documents\GitHub\FFXIV-Queue-Dodger\QueueDodger.ahk"
}
;-------------------------------------------------------------------------------
;;; KILL PROGRAMS ;;;
;-------------------------------------------------------------------------------
