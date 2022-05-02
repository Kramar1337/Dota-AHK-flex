#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
DetectHiddenWindows, On
; Регаем поиск в чит энжин
; H‹ЛяP„АtTH‹
; Поиск текста +Кодировочка

; 48 8B CB FF 50 18 84 C0 74 54 48 8B
; Искать масив байт

; 48 8B CB FF 50 18 84 C0 EB 54 48 8B
; Заменить на
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

	aPattern := [0x48, 0x8B, 0xCB, 0xFF, 0x50, 0x18, 0x84, 0xC0, 0x74, 0x54, 0x48, 0x8B]

	bPattern := [0x48, 0x8B, 0xCB, 0xFF, 0x50, 0x18, 0x84, 0xC0, 0xEB, 0x54, 0x48, 0x8B]

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













