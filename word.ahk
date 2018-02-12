#SingleInstance Force           ; No dialog when restarting
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;Menu, Tray, Icon, %A_WorkingDir%\w.ico,,1


#w::
WordList := ""
;FileEncoding, UTF-16
loop, read, words.txt
    WordList .= A_LoopReadLine "|"


Gui, Add, Button, w350 h20 +Default gSelected,
Gui, Add, ListBox, vWordChoice gMouseControl W350 H200, %WordList%

Gui, Show
return


Selected:
	Gui, Submit
	Gui, Destroy
	Clipboard := % WordChoice  ; Copies TextItem1/TextItem2/etc. to the clipboard
	;TrayTip, Item Copied, %Choice% has been copied to the clipboard.
    sleep 500
    send, ^v
return

MouseControl: ;;mouse control
If A_GuiEvent = Normal
 return


#IfWinActive, ahk_class AutoHotkeyGUI
;$Up::Left
;$Down::Right
Up::ControlSend, ListBox1, {Left}, %GUITitle%
Down::ControlSend, ListBox1, {Right}, %GUITitle%

return




ESC::
GuiClose:
	Gui, Destroy
return
#ifWinActive