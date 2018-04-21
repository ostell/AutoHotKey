#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;SetMouseDelay, -20
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
SetBatchLines, -1
CB_List = LClick|RClick|MClick|Move Mouse|LClick Hold|LClick Release|RClick Hold|RClick Release|Scroll Up|Scroll Down|Press|Run|Search Image|Window Active|Window Close
KArray := Object()
i := 0
z := 1
u := 1
t := 1
array := []
Splited := []
HArray := []
varLC := "MouseClick, left"
varRC := "MouseClick, right"
varCP := "Send,"
varCR := "Run,"
varSI := "ImageSearch,"
varMM := "MouseMove,"
varLH := "down left"
varLR := "up left"
varRH := "down right"
varRR := "up right"
varSU := "MouseClick, WheelUp"
varSD := "MouseClick, WheelDown"
varMC := "MouseClick, middle"

#include Clicker_GUI.ahk
#include dunamicc.ahk
;-----------------------------
Screen_relative:
GuiControlGet, Screeen,, Screeen 
if (Screeen = 1)
  CoordMode, Mouse, Relative
else
  CoordMode, Mouse, Screen
return
;-----------------------------
Hotkey_Start:
 Try Hotkey, %StartHotkey%, Off
 GuiControlGet, StartHotkey
 Hotkey, %StartHotkey%, Pick
return
;-----------------------------
Hotkey_Title:
 Try Hotkey, %TitleHotkey%, Off
 GuiControlGet, TitleHotkey
 Hotkey, %TitleHotkey%, TitleGet
return
;-----------------------------
Hotkey_Coord:
 Try Hotkey, %CoordHotkey%, Off
 GuiControlGet, CoordHotkey
 Hotkey, %CoordHotkey%, CoordGet
return
;-----------------------------
Hotkey_Pause:
 Try Hotkey, %PauseHotkey%, Off
 GuiControlGet, PauseHotkey
 Hotkey, %PauseHotkey%, ScriptPause
return
;-----------------------------
ScriptPause:
Pause, Toggle
return
;-----------------------------
Hotkey_REC:
 Try Hotkey, %RECHotkey%, Off
 GuiControlGet, RECHotkey
 Hotkey, %RECHotkey%, REC
return
;-----------------------------
Hotkey_stop_save:
 Try Hotkey, %stop_saveHotkey%, Off
 GuiControlGet, stop_saveHotkey
 Hotkey, %stop_saveHotkey%, stop_save
return
;-----------------------------
GOOO:
Pause, On
return
;-----------------------------
Path:
return
;-----------------------------
Davai:
Gui, Submit, NoHide
i := 0
p := LV_GetNext()
s := LV_GetCount()

Loop, % (s-p+1)*2 
{
array[s*2+2-i] := array[s*2-i]
;MsgBox, % array[s*2+2-i]
i+=1
}
array[p*2] := ""
array[p*2-1] := ""
;Loop, % 10
;MsgBox, % array[A_Index]
z+=2
gosub, AddInsert
array[p*2] := array[z-1]
array[p*2-1] := array[z-2]
;MsgBox, % array[z-2]
;MsgBox, % array[z-1]
LV_Insert(p,,i,Command,Keys,ComRep,X,Y,,Delay,Path)
Loop, % LV_GetCount()
LV_Modify(A_Index,, A_Index)
z-=2
array[z] := ""
array[z+1] := ""
;Loop, % array.MaxIndex()
;MsgBox, % array[A_Index]
;ListVars
return
;-----------------------------
Editt:
Gui, Submit, NoHide
p := LV_GetNext()
array[p*2] := ""
array[p*2-1] := ""
gosub, AddInsert
array[p*2] := array[z-1]
array[p*2-1] := array[z-2]
array[z-1] := ""
array[z-2] := ""
z-=2
LV_Modify(p,,p,Command,Key,ComRep,X,Y,,Delay,Path)
;ListVars
;Loop, % array.MaxIndex()
;MsgBox, % array[A_Index]
return
;-----------------------------
Combo:
Gui, Submit, NoHide
if(Command = "Press")
{ 
 GuiControl, Disable, X
 GuiControl, Disable, Y
 GuiControl, Enable,Keys
 GuiControl, Disable, Path
 GuiControl, Enable, ComRep
 GuiControl, Disable, Screen
 GuiControl, Disable, CursorBack
 GuiControl,, Path,
 GuiControl,, Keys, Key
 GuiControl,, X,
 GuiControl,, Y,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "LClick")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Enable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "LClick Hold")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Disable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "LClick Release")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Disable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "RClick Hold")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Disable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "RClick Release")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Disable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "Scroll Up")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Enable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "Scroll Down")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Enable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "MClick")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Enable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "RClick")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Enable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "Run")
{
 GuiControl, Disable, X
 GuiControl, Disable, Y
 GuiControl, Disable, ComRep
 GuiControl, Disable, Keys
 GuiControl, Enable, Path
 GuiControl, Disable, Screen
 GuiControl,, Keys,
 GuiControl,, X,
 GuiControl,, Y,
 GuiControl,, ComRep,
 GuiControl,, Path, File/.exe
 GuiControl, Enable, Browse 
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
if(Command = "Window Active")
{
 GuiControl, Disable, X
 GuiControl, Disable, Y
 GuiControl, Disable, ComRep
 GuiControl, Disable, Keys
 GuiControl, Disable, Path
 GuiControl, Enable, wTitle
 GuiControl, Disable, Screen
 GuiControl,, Keys,
 GuiControl,, X,
 GuiControl,, Y,
 GuiControl,, ComRep,
 GuiControl,, Path,
 GuiControl, Disable, Browse 
}
if(Command = "Window Close")
{
 GuiControl, Disable, X
 GuiControl, Disable, Y
 GuiControl, Disable, ComRep
 GuiControl, Disable, Keys
 GuiControl, Disable, Path
 GuiControl, Enable, wTitle
 GuiControl, Disable, Screen
 GuiControl,, Keys,
 GuiControl,, X,
 GuiControl,, Y,
 GuiControl,, ComRep,
 GuiControl,, Path,
 GuiControl, Disable, Browse 
}
if(Command = "Search Image")
{
 GuiControl, Disable, X
 GuiControl, Disable, Y
 GuiControl, Disable, ComRep
 GuiControl, Disable, Keys
 GuiControl, Enable, Path
 GuiControl, Enable, Screen
 GuiControl,, Keys,
 GuiControl,, X,
 GuiControl,, Y,
 GuiControl,, ComRep,
 GuiControl,, Path, File/.exe
 GuiControl, Enable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle, 
}
if(Command = "Move Mouse")
{
 GuiControl, Enable, X
 GuiControl, Enable, Y
 GuiControl, Disable, ComRep
 GuiControl, Disable,Keys
 GuiControl, Disable,Path
 GuiControl, Enable, Screen
 GuiControl,, Path,
 GuiControl,, Keys,
 GuiControl,, ComRep,
 GuiControl, Disable, Browse
 GuiControl, Disable, wTitle
 GuiControl,, wTitle,
}
return
;----------------------------
FileNew:
LV_Delete()
Loop, % array.MaxIndex()
array[A_index] := ""
z := 1
Reload
return
;-----------------------------
FileOpen:
Gui, Submit, NoHide
FileSelectFile, Selected,,,,*.txt
If(Selected = "")
return
else
Gosub, OpenDel
FileRead, Loaded, %Selected%
array := StrSplit(Loaded, "`n")
;Loop, % array.MaxIndex()
;MsgBox, % Splited[A_Index]
z := array.MaxIndex()-1
Loop, % array.MaxIndex()
{
Haystack := array[A_Index]
HArray := StrSplit(Haystack, ",")

IfInString, Haystack, %varLC%
LV_Add("",,"LClick",,HArray[5],HArray[3],HArray[4])
IfInString, Haystack, %varRC%
LV_Add("",,"RClick",,HArray[5],HArray[3],HArray[4])
IfInString, Haystack, %varCP%
LV_Add("",,"Press",HArray[2])
IfInString, Haystack, %varCR%
LV_Add("",,"Run",,,,,,,HArray[2])
IfInString, Haystack, %varLH%
LV_Add("",,"LClick Hold",,,HArray[2],HArray[3])
IfInString, Haystack, %varLR%
LV_Add("",,"LClick Release",,,HArray[2],HArray[3])
IfInString, Haystack, %varRH%
LV_Add("",,"RClick Hold",,,HArray[2],HArray[3])
IfInString, Haystack, %varRR%
LV_Add("",,"RClick Release",,,HArray[2],HArray[3])
IfInString, Haystack, %varSU%
LV_Add("",,"Scroll Up",,HArray[5],HArray[3],HArray[4])
IfInString, Haystack, %varSD%
LV_Add("",,"Scroll Down",,HArray[5],HArray[3],HArray[4])
IfInString, Haystack, %varMM%
LV_Add("",,"Move Mouse",,,HArray[2],HArray[3])
IfInString, Haystack, %varMC%
LV_Add("",,"MClick",,HArray[5],HArray[3],HArray[4])
IfInString, Haystack, %varSI%
LV_Add("",,"Search Image",,,,,,,HArray[8])
If !Mod(A_Index, 2)
LV_Modify(LV_GetCount(),,,,,,,,,HArray[2])
Loop, % LV_GetCount()
LV_Modify(A_Index,, A_Index)
}
;Loop, % array.MaxIndex()
;MsgBox, % array[A_Index]
return
;-----------------------------
FileSave:
if CurrentFileName =   ; No filename selected yet, so do Save-As instead.
    Goto FileSaveAs
Gosub SaveCurrentFile
return
;------------------------------
FileSaveAs:
Gui +OwnDialogs  ; Force the user to dismiss the FileSelectFile dialog before returning to the main window.
FileSelectFile, SelectedFileName, S16,, Save File, Text Documents (*.txt)
if SelectedFileName =  ; No file selected.
    return
CurrentFileName = %SelectedFileName%
Gosub SaveCurrentFile
return

SaveCurrentFile:  ; Caller has ensured that CurrentFileName is not blank.
IfExist %CurrentFileName%
{
    FileDelete %CurrentFileName%
    if ErrorLevel
    {
        MsgBox The attempt to overwrite "%CurrentFileName%" failed.
        return
    }
}
Loop, % z
{
temp := array[A_Index] 

IfInString, temp, %varLC%
temp := RTrim(temp, ",")
IfInString, temp, %varRC%
temp := RTrim(temp, ",")
IfInString, temp, %varMC%
temp := RTrim(temp, ",")
IfInString, temp, %varCR%
temp .= ","
IfInString, temp, %varRH%
temp .= ","
IfInString, temp, %varRR%
temp .= ","
IfInString, temp, %varSI%
temp .= ","
IfInString, temp, %varCP%
temp .= ","

FileAppend, %temp%`n, %CurrentFileName%
}
Gui, Show,, ;%CurrentFileName%
return
;----------------------------------
HelpTutorial:
Gui, Tutorial:+owner1 ; Make the main window (Gui #1) the owner of the "about box".
Gui +Disabled  ; Disable main window.
Gui, Tutorial:Add, Tab3, h490 w490, 1.Overview|2.Settings-Pt.1|3.Settings-Pt.2|4.Settings-Pt.3|5.Hotkeys|6.Order list|7.File Menu
Gui, Tutorial:Tab, 1.Overview
Gui, Tutorial:Add, Text,,`n`tOWII_MouseClicker_v0.2 is a free to use script written by ostell and wolf_II (Members`n in the AutoHotKey forum). With it you can easily automate different repeating/looping task.`nThe script has user friendly Interface in witch you can set and save your commands. And later`nexecute them, the commands number is unlimited. In the Interface are build the three main`nsections Settings, Hotkeys, Order list and the top File and Help menu.`n`nIn the Settings sec-`ntion generally the`nuser can set the`ncommands that he`nwant to execute and`ntheir options.`n`nThe Hotkeys section`nis focused on time`nsaving and conve-`nnience.`n`nOrder list section`nviews your saved`ncommands and allow`nyou to manipulate`nthem.
Gui, Tutorial:Add, Picture,h-1 x125 y136, C:\Users\OSTEL\Desktop\1.png
Gui, Tutorial:Tab, 2.Settings-Pt.1
Gui, Tutorial:Add, Text,,`n%A_Space%%A_Space%%A_Space%%A_Space%The Settings section is the section where ther user can choose the command and set its options. 
Gui, Tutorial:Add, Picture, x35 y83, C:\Users\OSTEL\Desktop\4.png
Gui, Tutorial:Add, Text, x35 y245, The first option is the Command dropdown list form`nwhere the user can select the command to exe-`ncute or add to the list of commands. The list co-`nntains commands like:`nLClick - `ncomplies to Left Mouse Click, RClick - Right`nmouse click,..,`nPress -`nA key,a combination of keys pressed on the key-`nboard and also a word or a message written in a`ntext box if there is some selected.`nThis is the base key Mapping in the script:`nCrtl -> ^; Alt -> !; Shift -> +; WinKey -> #`n All other keys are the same as in the keyboard`nbut put in parantises {..} Example: {Enter}`nRun - `ncommands the user can open a program or open a document from the computer after speci-`nfying the full path with the button browse or write it in the "Full program path:" box.    
Gui, Tutorial:Add, Picture, x272 y248, C:\Users\OSTEL\Desktop\2.png
Gui, Tutorial:Tab, 3.Settings-Pt.2
Gui, Tutorial:Add, Text,,`n%A_Space%%A_Space%%A_Space%%A_Space%Search Image -`nThis command can be extremely`nuseful if the object or window you want to click on`nthe screen moves on a different position every time`nit is opened. This command searches the object on`nthe screen and than moves the mouse on it. Fists`nyou need to have a Image of the object. With Press`n->PrintScrn ->Open Paint.exe ->Ctrl+V ->Crop the`nobject ->Save the Image. Than click on the Browse`nbutton and find it. Thant's it!`n   ScrollUp/Down -`nI forgot to mention that command. This command`nmoves the scroll bar according to the number the`nuser writes in the "Reps:" box.`n   LClick Hold/LClick Release -`nHolds the left mouse button clicked fortime Inputed`nby thre user in the "Delay:" box in milliseconds. After that you need to mandatory Add a LClick`nRelease to release the mouse button.
Gui, Tutorial:Add, Picture, x272 y60, C:\Users\OSTEL\Desktop\2.png
Gui, Tutorial:Add, Picture, x295 y305, C:\Users\OSTEL\Desktop\5.png
Gui, Tutorial:Add, Text, x30 y290,`n   Keys - In this box becomes active when the user is`nselected the "Press" command. He can specify wich`nkeys or message the script to Input. Delay - The time`nbetween the different commands. Repeat count - How`nmany times the list of commands to be executed.`n   X/Y - This two boxes becomes active if the user is`nselected most of the mouse commands and it specifies`nthe place where the mouse to move and execute the`nselected action.
Gui, Tutorial:Tab, 4.Settings-Pt.3
Gui, Tutorial:Add, Text,,`n%A_Space%%A_Space%%A_Space%%A_Space%Add Ctrl - `nAdd Control opens a new window were you can create`nyour own commands(But only key press commands like-`nExample:Alt+Tab, Ctrl+S..) for fast access. The first field`nis Key - Secify the key combinations or text, The second`nfield is Name - The name that the command can be found`nin the Command list. After the user specify those two things`npress Add. With clear you can clear the whole list of co-`nmmands to add. With Done you you add the new co-`nmmands to the command list and exit the add control win-`ndow.`n   Browse - `nIt becomes active in certain commands- Run, Search Image.`n   Full program path -`nIs where the user inputs the path of the program wich he wants to run of it is inputed`nautomaticaly with "Browse".`n   Reps -`nNumber of clicks or number of scrolls.`n   REC\STOP/SAVE\PLAY - `nThis is a menu for a small mouse recorder. It records the movement and clicks of the mouse`nwhen you press REC and when you are finished press STOP/SAVE - It saves the movement`nin a document. With PLAY you can find your saved document and replay the mouse movement.`n   Screen/Relative -`nThis checkbox is not active at this moment.`n   Speed -`nThis is how fast to replay the mouse movements and clicks.   
Gui, Tutorial:Add, Picture, x303 y63, C:\Users\OSTEL\Desktop\3.png
Gui, Tutorial:Tab, 5.Hotkeys
Gui, Tutorial:Tab, 6.Order list
Gui, Tutorial:Tab, 7.File Menu
Gui, Tutorial:Add, Text,, ahsdh  ; Future controls are not part of any tab control.
Gui, Tutorial:Add, Text,, Coming soon...
;Gui, Tutorial:Add, Button,x30 y460 Default, OK
Gui, Tutorial:Show, h504 w504, Tutorial
return

TutorialButtonOK:  ; This section is used by the "tutorail box" above.
TutorialGuiClose:
TutorialGuiEscape:
Gui, 1: -Disabled  ; Re-enable the main window (must be done prior to the next step).
Gui Destroy  ; Destroy the about box.
return
;----------------------------------
HelpAbout:
Gui, About:+owner1  ; Make the main window (Gui #1) the owner of the "about box".
Gui +Disabled  ; Disable main window.
Gui, About:Add, Text,, Made by ostell and wolf_II`n`nSpecial thanks to HotKeyIt for developing the Exec() function`nand to garath for developing the MoRe mouse recorder.
Gui, About:Add, Button, Default, OK
Gui, About:Show ,,About
return

AboutButtonOK:  ; This section is used by the "about box" above.
AboutGuiClose:
AboutGuiEscape:
Gui, 1:-Disabled  ; Re-enable the main window (must be done prior to the next step).
Gui Destroy  ; Destroy the about box.
return
;-------------------
;ADD CTRL
ButtonAddCtrl:
Gui, MyGui:+owner1
Gui +Disabled
Gui, MyGui:Add,ListView,x6 y40 w238 h170 Grid, Keys|Name
Gui, MyGui:Add,Edit,x50 y10 w70 h20 vName,
Gui, MyGui:Add,Text,x12 y10 w33 h20, Name:
Gui, MyGui:Add,Edit,x160 y10 w70 h20 vKey,
Gui, MyGui:Add,Text,x132 y10 w30 h20, Key:
Gui, MyGui:Add,Button,x40 y217 w50 h25, Add
Gui, MyGui:Add,Button,x170 y217 w50 h25, Done
Gui, MyGui:Add,Button,x105 y217 w50 h25, Clear
Gui, MyGui:Show, x349 y44 h250 w250, AddCtrl
return
;-------------------
;ADDCTRLADD
MyGuiButtonAdd:
Gui, Submit, NoHide
LV_Add("",Key, Name)
;Control, Add, Name, Command
KArray[u, 1] := Key
KArray[u, 2] := Name
u+=1
Command := KArray[u-1, 2]
CB_List .="|"Command
GuiControl,1:,Command, |%CB_List%
;MsgBox, % CB_List
return
;-------------------
;ADDCTRLCLEAR
MyGuiButtonClear:
Loop, % u-1
{
KArray[A_Index, 1] := ""
KArray[A_Index, 2] := ""
}
LV_Delete()
u := 1
return
;-----------------
;ADDCTRLDONE
MyGuiButtonDone:
MyGuiGuiClose:
MyGuiGuiEscape:
Gui, 1: -Disabled  ; Re-enable the main window (must be done prior to the next step).
Gui Destroy  ; Destroy the MyGui window
Gui, Submit, NoHide
;Loop, % u
;MsgBox, % KArray[A_Index, 1]
return
;-----------------
;BROWSE
ButtonBrowse:
    FileSelectFile, Filename, 1, %A_ProgramFiles%,, *.exe
    If (ErrorLevel = 1) ; user cancelled dialoge
    Return
    GuiControl,, Path, %Filename%
    ;LV_Add("", LV_GetCount() + 1, "Run, " Filename)
return
;------------------
;DELETE ALL
ButtonDeleteAll:
OpenDel:
LV_Delete()
Loop, % array.MaxIndex()
array[A_index] := ""
z := 1
;MsgBox, % array[1]
;MsgBox, % array[2]
;MsgBox, % array[3]
;MsgBox, % array[4]
return
;-------------------
;DELETE
ButtonDelete:
Gui, Submit, NoHide
i := 0
p := LV_GetNext()
LV_Delete(p)
array[p*2] :=""
array[p*2-1] :=""
Loop, % LV_GetCount()
LV_Modify(A_Index,, A_Index)
Loop, % array.MaxIndex()
{
array[p*2-1+i] := array[p*2+1+i]
i+=1
}
z-=2
array[z] := ""
array[z+1] := ""
;Loop, % array.MaxIndex()
;MsgBox, % array[A_Index]
;ListVars
return
;--------------------
;START
Pick:
Gui, Minimize
Loop, % RepCnt
{
Loop, % array.MaxIndex()
;Loop, % LV_GetCount()*2
{
Hay := array[A_Index]
IfInString, Hay, %varSI%
{
;MsgBox, WTF
Exec(Hay)
Sleep, 100
MouseMove, %Xi%, %Yi%, 100
}
else
Exec(array[A_Index])
}
}
/*
Loop, % RepCnt
{
Loop, % LV_GetCount()*2
Exec(array[A_Index])
}
  GuiControl,, X, %Xi%
  GuiControl,, Y, %Yi%
*/
Gui, Show
return
;--------------------
;ADD
ButtonAdd:
Gui, Submit, NoHide
LV_Add("",i,Command,Keys,ComRep,X,Y,wTitle,Delay,Path)
Loop, % LV_GetCount()
LV_Modify(A_Index,, A_Index)

AddInsert:

if(Command = "LClick")
{ 
  array[z] := "MouseClick, left, " X "," Y "," ComRep
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
  GuiControl,,Edit6,
  GuiControl,,Edit2,
  GuiControl,,Edit5,
  GuiControl,,Edit8,
}
else if(Command = "RClick")
{ 
  array[z] := "MouseClick, right, " X "," Y "," ComRep
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
  GuiControl,,Edit6,
  GuiControl,,Edit2,
  GuiControl,,Edit5,
  GuiControl,,Edit8,
}
else if(Command = "MClick")
{ 
  array[z] := "MouseClick, middle, " X "," Y "," ComRep
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
  GuiControl,,Edit6,
  GuiControl,,Edit2,
  GuiControl,,Edit5,
  GuiControl,,Edit8,
}
else if(Command = "Scroll Up")
{ 
  array[z] := "MouseClick, WheelUp, " X "," Y "," ComRep
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
  GuiControl,,Edit6,
  GuiControl,,Edit2,
  GuiControl,,Edit5,
  GuiControl,,Edit8,
}
else if(Command = "Window Active")
{ 
  array[z] := "WinWaitActive, " wTitle
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
}
else if(Command = "Window Close")
{ 
  array[z] := "WinWaitNotActive, " wTitle
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
}
else if(Command = "Scroll Down")
{ 
  array[z] := "MouseClick, WheelDown, " X "," Y "," ComRep
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
  GuiControl,,Edit6,
  GuiControl,,Edit2,
  GuiControl,,Edit5,
  GuiControl,,Edit8,
}
else if(Command = "LClick Hold")
{ 
  array[z] := "Click, " X "," Y " down left"
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
  GuiControl,,Edit6,
  GuiControl,,Edit2,
  GuiControl,,Edit5,
  GuiControl,,Edit8,
  ;MsgBox, % array[1]
}
else if(Command = "LClick Release")
{ 
  array[z] := "Click, " X "," Y " up left"
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
  GuiControl,,Edit6,
  GuiControl,,Edit2,
  GuiControl,,Edit5,
  GuiControl,,Edit8,
  ;MsgBox, % array[1]
}
else if(Command = "RClick Hold")
{ 
  array[z] := "Click, " X "," Y " down right"
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
  GuiControl,,Edit6,
  GuiControl,,Edit2,
  GuiControl,,Edit5,
  GuiControl,,Edit8,
  ;MsgBox, % array[1]
}
else if(Command = "RClick Release")
{ 
  array[z] := "Click, " X "," Y " up right"
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
  GuiControl,,Edit6,
  GuiControl,,Edit2,
  GuiControl,,Edit5,
  GuiControl,,Edit8,
  ;MsgBox, % array[1]
}
else if(Command = "Press")
{ 
  array[z] := "Send, " Keys
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
}
else if(Command = "Run")
{
  array[z] := "Run, " Path
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
}
else if(Command = "Search Image")
{
  array[z] := "ImageSearch, Xi , Yi," 0 "," 0 "," A_ScreenWidth "," A_ScreenHeight "," Path
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
}
else if(Command = "Move Mouse")
{
  array[z] := "MouseMove, " X "," Y "," 100
  z+=1
  array[z] := "Sleep, " Delay
  z+=1
}
else
{
t := 1
Loop, % u
{
 if(Command = KArray[t, 2])
{
    field := t
    break
}
else t+=1
}
 array[z] := "Send, " KArray[field, 1]
 z+=1
 array[z] := "Sleep, " Delay
 z+=1
}
Indexxx := array.MaxIndex()
;Loop, % Indexxx
;MsgBox, % array[A_Index]
;ListVars
Gui, Show
return
;--------------------------
CoordGet:
    Gui, Show, Minimize
    CoordMode, ToolTip, Screen
    CoordMode, Mouse, Screen
    Loop {
        MouseGetPos, xx, yy
        ToolTip, %xx% %yy%, 0, 0
    } Until GetKeyState("LButton","P")
    ToolTip ; off
    GuiControl,, X, %xx%
    GuiControl,, Y, %yy%
    Gui, Show
return
;--------------------------
TitleGet:
    Gui, Show, Minimize
    Loop {
        WinGetActiveTitle, wvTitle
        ToolTip, %wvTitle%, 0, 0
    } Until GetKeyState("MButton","P")
    ToolTip ; off
    GuiControl,, wTitle, %wvTitle%
    Gui, Show
return
;-------------------
;MoRe mouse recorder
;-------------------
REC:
ButtonREC:
 Gui, Show, Minimize
  FileDelete, %a_scriptdir%\recording.ini
  Mouse_moves =
  Wheel_up =
  Wheel_down =
  Time_old := A_TickCount
  SetTimer, WatchMouse, Off
  SetTimer, WatchMouse, 10
  SetTimer, WatchMouse, on
return

stop_save:
ButtonSTOP/SAVE:
 Gui, Show
  SetTimer, WatchMouse, Off
  tooltip
Gui, MRG:+owner1
Gui +Disabled
Gui, MRG:Add, Text,, Save as:
Gui, MRG:Add, Edit, vFile
Gui, MRG:Add, Button, y25 x140 w50 h20, OK
Gui, MRG:Show,w220, Mouse Recorder
return  

MRGGuiClose:
MRGGuiEscape:
MRGButtonOK:
GUI, Submit
Fileread, last, %a_scriptdir%\recording.ini
FileAppend, %last%, %a_scriptdir%\%file%.txt
Gui, 1: -Disabled
Gui Destroy
return

ButtonPLAY:
 Gui, Submit, NoHide
Gosub, replay
Return


;-----------------------------------

WatchMouse:
  Time_Index := A_TickCount - Time_old
  MouseGetPos, xpos, ypos, id, Control
  GetKeyState, lButt, LButton
  GetKeyState, mButt, MButton
  GetKeyState, rButt, RButton
  Mouse_Data = %xpos%|%ypos%|%lButt%|%mButt%|%rButt%|%Wheel_up%|%Wheel_down%|%ID%|%Time_Index%`n
  ToolTip, Recording 
 
  If (xpos<>xpos_old OR ypos<>ypos_old OR Wheel_up OR Wheel_down OR lButt<>Lbutt_old OR mButt<>mButt_old OR rButt<>rButt_old)
    {
      FileAppend, %Mouse_data%, %a_scriptdir%\recording.ini
      xpos_old  := xpos
      ypos_old  := ypos
      lButt_old := lButt
      mButt_old := mButt
      rButt_old := rButt
      Wheel_up =
      Wheel_down =
    }
Return

;-----------------------------------

replay:
  FileSelectFile, RowText,,,,*.txt
  FileRead,Mouse_moves, %RowText%
  StringReplace, Mouse_data, Mouse_moves, `n, @, All
  StringSplit, Mouse_data_, Mouse_data , @
  Loop, %Mouse_data_0%
      StringSplit, Mouse_data_%A_Index%_, Mouse_data_%A_Index% ,|
  ;Loop, 2
;{
  Data_Index = 1
  Data_Index_old := 1
  id := Mouse_data_1_8
  WinActivate, ahk_id %id%
  Time_old := A_TickCount
  SetTimer, Replaytimer, Off
  SetTimer, Replaytimer, %Speed%
  SetTimer, Replaytimer, on
;}
Return

;-----------------------------------

replaytimer:
  Time_Index := A_TickCount - Time_old
  Mouse_data_%Data_Index%_9 += 0

  If (Time_Index > Mouse_data_%Data_Index%_9)
    {
      MouseMove, Mouse_data_%Data_Index%_1, Mouse_data_%Data_Index%_2
      lButt := Mouse_data_%Data_Index%_3
      mButt := Mouse_data_%Data_Index%_4
      rButt := Mouse_data_%Data_Index%_5
      wheel_up := Mouse_data_%Data_Index%_6
      wheel_down := Mouse_data_%Data_Index%_7

      If (Mouse_data_%Data_Index_old%_3 <> Mouse_data_%Data_Index%_3)
          MouseClick , Left ,,,,, %lButt%
      If (Mouse_data_%Data_Index_old%_4 <> Mouse_data_%Data_Index%_4)
          MouseClick , middle ,,,,, %mButt%
      If (Mouse_data_%Data_Index_old%_5 <> Mouse_data_%Data_Index%_5)
          MouseClick , Right ,,,,, %rButt%
      If (Mouse_data_%Data_Index%_6)
          MouseClick, WheelUp, , , %wheel_up%       
      If (Mouse_data_%Data_Index%_7)
          MouseClick, Wheeldown, , , %wheel_down%       

      Data_Index_old := Data_Index
      Data_Index += 1
      If (Data_Index = Mouse_data_0)
        {
          SetTimer Replaytimer, Off
          Data_Index = 0
          ToolTip,
        }
    }
;  x := Mouse_data_%Data_Index%_9
;  tooltip %Time_Index%_%A_TickCount% - %Time_old% __%x%
Return
;==================================
esc::ExitApp
f12::Reload

FileExit: 
GuiClose:
ExitApp