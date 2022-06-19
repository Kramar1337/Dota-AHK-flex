#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
DetectHiddenWindows, On
/*
===========================================gameinfo.gi bypass
Вместо хекс редактирования такая жижа "dota\win64\client.dll"
inline BYTE gameinfo_pattern[] = { 0x74, 0x00, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x75, 0x00, 0x83 };
    BYTE Replace[] = { 0xEB } ;
    if (revert) {
        Globals::gameinfo_pattern[0] = { 0xEB };
        Replace[0] = 0x74;





*/
#include %A_ScriptDir%\classMemory.ahk
if (_ClassMemory.__Class != "_ClassMemory")
ExitApp

;===========================================================Запросить админские права
CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) {
    Try {
        If (A_IsCompiled) {
            Run *RunAs "%A_ScriptFullPath%" /restart
        } Else {
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    }
    ExitApp
}
IniRead, VarPID, %A_ScriptDir%\data.ini, Data, VarPID
IniWrite, 0, %A_ScriptDir%\data.ini, Data, VarPID


	; aPattern := [0x39, "?", 0x39, "?", "?", 0x3D, "?", "?", 0x3D]
	
	aPattern := [0x74, "?", 0x44, 0x38, "?", "?", "?", "?", "?", 0x75, "?", 0x83]

	; bPattern := [0x39, 0xEB]
	bPattern := [0xEB]

mem1337 := new _ClassMemory("ahk_pid "VarPID)
address := mem1337.processPatternScan(,, aPattern*)
if address
	{
	statuswr := mem1337.writeBytes(address, bPattern)
	if statuswr
	{
	IniWrite, 1, %A_ScriptDir%\data.ini, Data, PlEngine
	MsgBox,,, OK, 1
	}
	Exitapp
	}
Else
	{
	MsgBox,,, Файл уже прошит или прошивальщик устарел`nНе найден адрес, 1
	Exitapp
	}
Exitapp

*~$End::
Exitapp













