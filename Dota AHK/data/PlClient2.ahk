#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
DetectHiddenWindows, On
; ===========================================DOTA PLUS
; Вместо хекс редактирования такая жижа "dota\win64\client.dll"
; Регаем поиск в чит энжин
; ‹HX…Й…
; Поиск текста +Кодировочка
; Искать масив байт
; 8B 48 58 85 C9 0F 85 A2 00 00 00 48
; Заменить на
; 8B 48 70 85 C9 0F 85 A2 00 00 00 48
; ===========================================
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

	aPattern := [0x8B, 0x48, 0x58, 0x85, 0xC9, 0x0F, 0x85, 0xA2, 0x00, 0x00, 0x00, 0x48]

	bPattern := [0x8B, 0x48, 0x70, 0x85, 0xC9, 0x0F, 0x85, 0xA2, 0x00, 0x00, 0x00, 0x48]

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













