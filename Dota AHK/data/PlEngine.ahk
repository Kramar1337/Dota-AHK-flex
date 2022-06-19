#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
DetectHiddenWindows, On
/*
engine.dll - sv_cheats bypass
0x74, 0x00, 0xE8, 0x00, 0x00, 0x00, 0x00, 0x84, 0xC0, 0x75, 0x00, 0xE8
    BYTE Replace[] = { 0xEB };
    if (revert) {
        Globals::sv_cheats_pattern[0] = { 0xEB };
        Replace[0] = 0x74;

Искать: 74 ?? E8 ?? ?? ?? ?? 84 C0 75 ?? E8
Заменить 74 на EB




IDA
Shift + F12
"SV: Cheat command '%s' ignored.\n"
Открыть
Нажать "X" и "Space"
А что дальше я не ебу...


Примерный адресс: 00170728
До:
loc_18017131E:
mov     edx, 4000h
call    r8
test    al, al
jz      short loc_1801713A0
После:
loc_18017131E:
mov     edx, 4000h
call    r8
test    al, al
jmp     short loc_1801713A0





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

	; aPattern := [0x48, 0x8B, 0xCB, 0xFF, 0x50, 0x18, 0x84, 0xC0, 0x74, 0x54, 0x48, 0x8B]
	aPattern := [0x74, "?", 0xE8, "?", "?", "?", "?", 0x84, 0xC0, 0x75, "?", 0xE8]

	; bPattern := [0x48, 0x8B, 0xCB, 0xFF, 0x50, 0x18, 0x84, 0xC0, 0xEB, 0x54, 0x48, 0x8B]
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













