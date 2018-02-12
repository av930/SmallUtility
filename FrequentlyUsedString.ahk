#SingleInstance Force           ; No dialog when restarting
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


 
TextItem1 =  ; see "Splitting a Long Line into a Series of Shorter Ones" for more info: https://autohotkey.com/docs/Scripts.htm#continuation
	(LTrim Join`r`n
		Lorem ipsum dolor sit 
		amet, consectetur
		adipiscing elit, 
	)

TextItem2 = 
	(LTrim Join`r`n
		sed do eiusmod tempor 
		incididunt ut labore 
		et dolore magna aliqua.
	)
	
TextItem3 = 
	(LTrim Join`r`n
		Some more text here
		Blah blah blah
	)
	
TextItem4 = 
	(LTrim Join`r`n
		Once again
		Some more text
	)
    
    
#+z::
	Gui, Add, Tab2,    vMyTabs                 H250 W400, Subject|Salutation
	Gui, Tab, Subject
	Gui, Add, ListBox, vChoice1 gItemSelected1 W350 H200, Item1|Item2|Item3|Item4
	Gui, Tab, Salutation
	Gui, Add, ListBox, vChoice2 gItemSelected2 W350 H200, Item5|Item6|Item7|Item8
	Gui, Show
return

ItemSelected1:
	Gui, Submit
	Gui, Destroy
	Clipboard := Text%Choice1%  ; Copies TextItem1/TextItem2/etc. to the clipboard
	;TrayTip, Item Copied, %Choice% has been copied to the clipboard.
return

ItemSelected2:
	Gui, Submit
	Gui, Destroy
	Clipboard := Text%Choice2%  ; Copies TextItem1/TextItem2/etc. to the clipboard
	;TrayTip, Item Copied, %Choice% has been copied to the clipboard.
return



ESC::
GuiClose:
	Gui, Destroy
return
