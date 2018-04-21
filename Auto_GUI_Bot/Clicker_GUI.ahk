#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu, FileMenu, Add, &New, FileNew
Menu, FileMenu, Add, &Open, FileOpen
Menu, FileMenu, Add, &Save, FileSave
Menu, FileMenu, Add, Save &As, FileSaveAs
Menu, FileMenu, Add  ; Separator line.
Menu, FileMenu, Add, E&xit, FileExit
Menu, HelpMenu, Add, Tu&torial, HelpTutorial
Menu, HelpMenu, Add, &About, HelpAbout

Menu, MyMenuBar, Add, &File, :FileMenu
Menu, MyMenuBar, Add, &Help, :HelpMenu

Gui, Menu, MyMenuBar

Gui, Add, ListView, x16 y357 w400 h110 Grid , N|Command|Key|Count|   X   |   Y   |Title|Delay|File/Program
;GuiControl,,Command, |%CB_List%
Gui, Add, ComboBox, x26 y42 w220 h20 r15 gCombo vCommand, %CB_List%
Gui, Add, Button, x266 y42 w90 h20 , Add Ctrl
Gui, Add, Button, x266 y68 w90 h20 , Browse
Gui, Add, Text, x251 y162 w35 h20, Reps:
Gui, Add, Edit, x286 y152 w70 h20 Number vComRep,
Gui, Add, Edit, x251 y115 w105 h20 gPath vPath, File/.exe
Gui, Add, Text, x251 y94 w85 h20 ,Full program path:
Gui, Add, Text, x26 y97 w750 h-70 , Text
Gui, Add, Text, x16 y115 w50 h20 , Delay:
Gui, Add, Edit, x56 y115 w60 h20 Number vDelay, 1000
Gui, Add, Edit, x156 y115 w70 h20 Number vX,
Gui, Add, Edit, x156 y152 w70 h20 Number vY,
Gui, Add, Edit, x56 y152 w60 h20 ReadOnly vRepCnt, Reps
Gui, Add, UpDown, vMyUpDown Range1-500, 1
Gui, Add, Text, x156 y94 w60 h20 , Coordinates:
Gui, Add, Text, x136 y152 w20 h20 ,  Y :
Gui, Add, Text, x136 y115 w20 h20 ,  X :
Gui, Add, Text, x416 y117 w0 h0 , Text
Gui, Add, GroupBox, x6 y7 w490 h180 , Setting
;Gui, Add, CheckBox, x381 y115 w100 h20 gScreen_relative vScreeen, Screen/Relative
Gui, Add, Text, x371 y115 w30 h20, Title:
Gui, Add, Edit, x406 y115 w70 h20 vwTitle, Title 
Gui, Add, Edit, x416 y152 w60 h20 vSpeed, 10
Gui, Add, Text, x371 y152 w35 h20 , Speed:
Gui, Add, Text, x16 y147 w40 h30 , Repeat count
Gui, Add, Button, x406 y20 w70 h25 gREC, REC
Gui, Add, Button, x406 y50 w70 h25 gstop_save, STOP/SAVE
Gui, Add, Text, x16 y78 w50 h20 , Keys:
Gui, Add, Edit, x56 y78 w60 h20 vKeys, Key
Gui, Add, Button, x426 y357 w60 h20 gDavai, Insert
Gui, Add, Button, x426 y387 w60 h20 gEditt, Edit
Gui, Add, Button, x426 y417 w60 h20, Delete
Gui, Add, Button, x426 y447 w60 h20 , Delete all
Gui, Add, GroupBox, x6 y197 w490 h90 , Hotkeys
Gui, Add, GroupBox, x6 y297 w490 h190 , Order list
Gui, Add, Button, x416 y317 w70 h30 , Add
Gui, Add, Button, x16 y317 w80 h20 gPick, Start
Gui, Add, Button, x666 y27 w-650 h0 , Button
Gui, Add, Button, x116 y317 w80 h20 gGOOO, Stop
Gui, Add, Text, x26 y22 w100 h20 , Command:
Gui, Add, Button, x696 y17 w-680 h20 , Button
Gui, Add, Button, x406 y80 w70 h25 , PLAY
Gui, Add, Hotkey, x86 y220 w70 h20 vStartHotkey gHotkey_Start, 
Gui, Add, Text, x26 y220 w60 h20 ,  Start/Stop: 
Gui, Add, Text, x206 y220 w80 h20 , Pause:
Gui, Add, Hotkey, x246 y220 w70 h20 vPauseHotkey gHotkey_Pause,
Gui, Add, Text, x346 y253 w70 h20 ,  Get title:
Gui, Add, Hotkey, x406 y253 w70 h20 vTitleHotkey gHotkey_Title,
Gui, Add, Text, x346 y220 w70 h20 ,  Get coords:
Gui, Add, Hotkey, x406 y220 w70 h20 vCoordHotkey gHotkey_Coord,
Gui, Add, Text, x52 y253 w40 h20 ,  REC:
Gui, Add, Hotkey, x86 y253 w70 h20 vRECHotkey gHotkey_REC,
Gui, Add, Text, x173 y253 w80 h20 , STOP/SAVE:
Gui, Add, Hotkey, x246 y253 w70 h20 vstop_saveHotkey gHotkey_stop_save,
;Gui,+AlwaysOnTop
Gui, Show, x349 y44 h504 w504, OWII_MouseClicker_v0.2
Return