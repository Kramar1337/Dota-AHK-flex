#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
DetectHiddenWindows, On
; ===========================================gameinfo.gi bypass
; Вместо хекс редактирования такая жижа "dota\win64\client.dll"
; Регаем поиск в чит энжин
; л9Ђ=?G=
; Искать это
; t9Ђ=пH=
; Заменить на это
; л9Ђ=пH=
; Поиск текста +Кодировочка
; Искать масив байт

; Новый 210250 строка

; 00 ?? 39 80 3D ?? ?? 3D 02 00
; 00 74 39 80 3D EF 48 3D 02 00 75 30 83
; 00 EB 39 80 3D EF 48 3D 02 00 75 30 83

; Стаырый
; 74 39 80 3D 3F 47 3D 02 00 75 30 83
; EB 39 80 3D 3F 47 3D 02 00 75 30 83
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

	aPattern := [0x00, "?", 0x39, 0x80, 0x3D, "?", "?", 0x3D, 0x02, 0x00]

	bPattern := [0x00, 0xEB]

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













