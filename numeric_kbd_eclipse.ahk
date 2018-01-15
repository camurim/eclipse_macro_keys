#NoEnv
SendMode Input
#InstallKeybdHook
#UseHook On
Menu, Tray, Icon, shell32.dll, 283 ; this changes the tray icon to a little keyboard!
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm
;;
;WARNING, CURRENTLY UNTESTED - WILL TEST SOON.

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; HELLO, poeple who want info about making a second keyboard, using LUAmacros!

; Here's my LTT video about how I use the 2nd keyboard with Luamacros: https://www.youtube.com/watch?v=Arn8ExQ2Gjg
; And Tom's video, which unfortunately does not have info on how to actually DO it: https://youtu.be/lIFE7h3m40U?t=16m9s
; so you also need LUAmacros as well, of course.
; Luamacros: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
; AutohotKey: https://autohotkey.com/

; However, I no longer use luaMacros, because I believe interecept.exe is even better! My current code is available in "ALL MULTIPLE KEYBOARD ASSIGNMENTS.ahk"

; Lots of other explanatory videos other AHK scripts can be found on my youtube channel! https://www.youtube.com/user/TaranVH/videos 
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


;-------------2ND KEYBOARD USING LUAMACROS-----------------

RunWait, %A_ScriptDir%\LuaMacros.exe -r "%A_ScriptDir%\2ndkbd.lua"

#IfWinActive ahk_exe eclipse.exe

~F24::
FileRead, key, %A_Temp%\keypressed.txt
tippy(key) ; this function will just launch a quick tooltip that shows you what key you pressed. OPTIONAL.

if(key = "num0") ; Format
	Send, ^+f
else if(key = "num1") ; Import
	Send, ^+o
else if(key = "num2") ; Extract method
	Send, !+m
else if(key = "num3") ; Rename
	Send, !+r
else if(key = "num4") ; Class members
	Send, ^o
else if(key = "num5") ; Next member
	Send, ^+{Down}
else if(key = "num6") ; Previous member
	Send, ^+{Up}
else if(key = "num7") { ; New Class
	Send, ^n
	Sleep, 200
	ControlFocus, Edit1, ahk_class SWT_Window0
	Send, Class
	Sleep, 500
	Send, {Enter}
} else if(key = "num8") { ; New Interface
	Send, ^n
	Sleep, 200
	ControlFocus, Edit1, ahk_class SWT_Window0
	Send, Interface
	Sleep, 500
	Send, {Enter}
} else if(key = "num9") { ; New Enumerator
	Send, ^n
	Sleep, 200
	ControlFocus, Edit1, ahk_class SWT_Window0
	Send, Enum
	Sleep, 500
	Send, {Enter}
} else if(key = "numAdd") { ; Generate Getters And Setters
	Send, ^3
	Send, generate getters and setters
	Send, {Enter}
} else if(key = "numSub") { ; Generate hashCode() and equals()
	Send, ^3
	Send, generate hashcode() and equals()
	Send, {Enter}
} else if(key = "numDiv") ; Toggle Breakpoint
	Send, ^!b
else if(key = "numMult") ; Run
	Send, ^!r
else if(key = "numDelete") ; Stop
	Send, ^!s
else if(key = "backspace") { ; Comment
	Send, {Home}{Home}
	Send, //
	Send, {Home}
} else if(key = "enter")
	Send,{Enter}

Return ;from luamacros F24
;THE BLOCK OF CODE ABOVE is the original, simple Luamacros-dependant script.

;;;ALL THE CODE BELOW CAN BE THE ACTUAL FUNCTIONS THAT YOU WANT TO CALL;;;

;;;;;;temporary tooltip maker;;;;;;
tippy(tipsHere, wait:=333)
{
	ToolTip, %tipsHere% TP,,,8
	SetTimer, noTip, %wait% ;--in 1/3 seconds by default, remove the tooltip
}
noTip:
	ToolTip,,,,8
	;removes the tooltip
return
;;;;;;/temporary tooltip maker;;;;;;