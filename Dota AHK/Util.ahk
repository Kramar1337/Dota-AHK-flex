/*

Тут oBOYi
https://www.wallpaperflare.com/
https://wall.alphacoders.com/


Предварительно установить Dota SDK

Изображение для редактирования
Background-source\panorama\images\backgrounds\custom_background.png 1920-1080p

Путь к компилятору
C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\bin\win64\resourcecompiler.exe

Импорт, сюда переместить исходник "content\dota_addons\custom"
C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\content\dota_addons\custom

Экспорт, тут готовые скомпилированые файлы "game\dota_addons\custom"
C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\dota_addons\custom

Текст батника
set Compiler="C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\bin\win64\resourcecompiler.exe"
set ModSrc="C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\content\dota_addons\custom\*.*"
%Compiler% -vpkincr -i %ModSrc% -f -r
pause





;==================================VBE CE
engine2.dll
00548CF0 0 30 38 98 170 0 AC0

52 17 65 3F 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 86 51 97 29 FF FF FF FF 0D 00 00 00 00 00
0 - видно
рандомные цифры - не видно



__🔗Собрано из следующих материалов:🔗__
| Ссылка | Название | Описание |
| --- | --- | --- |
| [UC](https://www.unknowncheats.me/forum/other-mmorpg-and-strategy/402262-dota-2-visible-enemy-overlay.html) | Dota 2 Visible by Enemy Overlay | Visible by Enemy |
| [Github](https://github.com/skrixx68/Dota2-Overlay-2.0) | Dota2-Overlay-2.0 | Visible by Enemy |
| [Github](https://github.com/Wolf49406/Dota2Patcher) | Dota2Patcher | Patch client.dll(gameinfo.gi, DOTA+) |
| [Github](https://github.com/boscutti939/damods) | Dota 2 Mods | Dota 2 Sound Mods (memes) |




Микро скрипт для Dota2 "Dota AHK Flex"
 - Visible by Enemy (VBE)
 - Установщик VPK
 - Тыквы, мегаубийства, цветная речка, Auto Accept
 - Прошивка "win64\engine2.dll" (sv_cheats)
 - Прошивка "win64\client.dll" (gameinfo.gi, DOTA+)

F8 - Сообщение в консоль
F11 - Авто принятие игры (AHK)
Home - Reload




sv_cheats 1; dota_use_particle_fow 0; fog_enable 0; fow_client_nofiltering 1; dota_camera_distance 1400; r_farz 3000; dota_range_display 2500; cl_dota_unified_tree_hitboxes 0;

bind 9 "dota_camera_distance 1400"; bind 0 "dota_camera_distance 4000"; bind 8 "dota_range_display 0"



; тренировка не видно (22)
; 16 00 00 00 ?? ?? ?? ?? F? 7F 00 00 ?? ?? ?? 0? 00 00 00 00 0? 00 00 00 00 00 00 00 ?0 0? ?? ??
; тренировка Видно (30)
; 1E 00 00 00 ?? ?? ?? ?? F? 7F 00 00 ?? ?? ?? 0? 00 00 00 00 0? 00 00 00 00 00 00 00 ?0 0? ?? ??
; В игре Видно (14) (10 в игре новое значение)
; 0E 00 00 00 ?? ?? ?? ?? F? 7F 00 00 ?? ?? ?? 0? 00 00 00 00 0? 00 00 00 00 00 00 00 ?0 0? ?? ??
; 0A 00 00 00 ?? ?? ?? ?? F? 7F 00 00 ?? ?? ?? 0? 00 00 00 00 0? 00 00 00 00 00 00 00 ?0 0? ?? ??
; В игре НЕВидно (6)
; 06 00 00 00 ?? ?? ?? ?? F? 7F 00 00 ?? ?? ?? 0? 00 00 00 00 0? 00 00 00 00 00 00 00 ?0 0? ?? ??
; 1. создать карту указателей
; 2. отсев 0x170, 0x0, 0x1E4
; [0x0, 0x28, 0x38, 0x98, 0x170, 0x0, 0x1F4]




dota_unit_show_selection_boxes 2
Команда для отображения хитбокса дерева, для работы нужен sv_cheats 1
cl_dota_unified_tree_hitboxes 0
Супер пупер команда для починки хитбоксов тыкв(деревьев), вводить перед каждой игрой
cl_dota_showents			Выгрузить список сущностей в консоль.


*/

AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"


Versiya := "Dota AHK Flex v0.6"
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
DetectHiddenWindows, on
#include data/classMemory.ahk
#include data/gdi.ahk
If !pToken := Gdip_Startup()
Global EditConsole1Var 	;Сделать глобальной чтобы работала в функции
; ====================================================================Запуск от админа
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
OnExit("ExitFunc")








;=====================================безопасность
IniRead, ScWinrenamer, data\data.ini, Settings, ScWinrenamer ; проверка Winrenamer
IniRead, ScRenamer, data\data.ini, Settings, ScRenamer ; проверка Renamera
IniRead, ScHachCh, data\data.ini, Settings, ScHachCh ; проверка ScHachCh


If ScHachCh
{
FileRead, FileReadOutputVar1, %A_ScriptFullPath%
Random, rand1488, 20, 30
password := gen_password(rand1488)
1RepFile1 = AntiVACHashChanger:="\w*"
2RepFile2 = AntiVACHashChanger:="%password%%password%%password%%password%"
RegExRepFile1 := RegExReplace(FileReadOutputVar1, 1RepFile1, 2RepFile2)
FileEncoding UTF-8
FileDelete, %A_ScriptFullPath%
FileAppend, %RegExRepFile1%, %A_ScriptFullPath%
}
If ScRenamer
{
Random, rand1488, 10, 14
password := gen_password(rand1488)										;вызов функции в переменную (длина)
SplitPath, A_ScriptFullPath,,, 2z2ext,, 	;извлечь из строки расширение
FileMove, %A_ScriptFullPath%, %A_ScriptDir%\%password%.%2z2ext%
savereloadvar = %A_ScriptDir%\%password%.%2z2ext%
}











; ====================================================================Ввод данных в консоль, начало
Loop, read, data\ConsoleVar.txt
{
    Loop, parse, A_LoopReadLine, `n
    {
		EditConsole1Var := EditConsole1Var A_LoopField "`n"
    }
}
; ====================================================================

IniRead, ONregreadDir, data\data.ini, Settings, ONregreadDir ; поиск папки в реестре
IniRead, DirGame, data\data.ini, Settings, DirGame
IniRead, OutputVarGetTime, data\data.ini, Settings, OutputVarGetTime
IniRead, OutputVarGetTime2, data\data.ini, Settings, OutputVarGetTime2
Global VBEVar
IniRead, VBEVar, data\data.ini, Settings, VBEVar


If (ONregreadDir == 1) ; Если в конфиге путь к игре реестр вкл, то:
{

RegRead, 1337DirVar, HKEY_CURRENT_USER, SOFTWARE\Classes\dota2\Shell\Open\Command
SplitPath, 1337DirVar,, dirvarget1
RegExRepFilevar1 := RegExReplace(dirvarget1, """", "") 	;Убрать кавычки
RegExRepFilevar2 := RegExReplace(RegExRepFilevar1, "/", "\") 	;Выровнять путь сменить слеши
DirVarGensh := RegExReplace(RegExRepFilevar2, "\\steamapps\\common\\dota 2 beta\\game\\bin\\win64", "") 	;Убрать путь
if (DirVarGensh == "")
{
	RegRead, DirVarGensh, HKEY_CURRENT_USER, Software\Valve\Steam, SteamPath
	DirVarGensh := RegExReplace(DirVarGensh, "/", "\") 	;Выровнять путь сменить слеши
}
	; RegRead, DirVarGensh, HKEY_CURRENT_USER, Software\Valve\Steam, SteamPath
	; DirVarGensh := RegExReplace(DirVarGensh, "/", "\") 	;Выровнять путь сменить слеши
}
If (ONregreadDir == 0)
{
DirVarGensh = %DirGame%
}


Menu,Tray, Icon, data\icon.ico, ,1
Menu,Tray, NoStandard
Menu,Tray, DeleteAll
Menu,Tray, add, Settings, MetkaMenu1
Menu,Tray, Icon, Settings, imageres.dll, 110, 16
Menu,Tray, Default , Settings
; Menu,Tray, add
Menu,Tray, add
Menu,Tray, add, Up offsets, MetkaMenu2
Menu,Tray, Icon, Up offsets, shell32.dll, 136, 16
; Menu,Tray, add
; Menu,Tray, add
Menu,Tray, add, BKG generator, MetkaMenu3
Menu,Tray, Icon, BKG generator, shell32.dll, 116, 16
; Menu,Tray, add
; Menu,Tray, add
Menu,Tray, add, Exit, MetkaMenu0
Menu,Tray, Icon, Exit, shell32.dll, 28, 16

;=======================Путь к папке с игрой
Gui, 1: Add, GroupBox, x8 y8 w184 h71, Путь к папке с игрой
Gui, 1: Add, CheckBox, vONregreadDir gCheckboxRegDirG x16 y24 w120 h23 Checked%ONregreadDir%, Автопуть с реестра
Gui, 1: Add, Edit, x16 y48 w120 h21 vEditDir +Disabled, %DirVarGensh%
Gui, 1: Add, Button, ggameway x144 y48 w41 h23, Edit

;=======================Установщик паков
Gui, 1: Add, GroupBox, x200 y8 w184 h71, Установщик VPK
Gui, 1: Add, Button, gButtonGinfoVpkIns x208 y48 w41 h23, Ginfo
Gui, 1: Add, Button, gButtonTreeInstal x272 y48 w41 h23, Ltime
Gui, 1: Add, Button, gButtonTreeUninstal x336 y48 w41 h23, Del
;=======================client.dll
Gui, 1: Add, GroupBox, x8 y80 w376 h55, Статус client.dll (Gameinfo и DotaP)
Gui, 1: Add, Text, vTxtText2 x60 y104 w120 h23 +0x200
Gui, 1: Add, Button, gButtonGameinfoFlash x208 y104 w41 h23, Ginfo
Gui, 1: Add, Button, gButtonDotaPlusFlash x272 y104 w41 h23, DotaP
Gui, 1: Add, Button, gButtonDelDotaPlusGameinfoFlash x336 y104 w41 h23, Del

;=======================engine2.dll
Gui, 1: Add, GroupBox, x8 y136 w376 h55, Статус engine2.dll (sv_cheats)
Gui, 1: Add, Button, gButtonFlash x272 y160 w41 h23, Patch
Gui, 1: Add, Button, gButtonDelFlash x336 y160 w41 h23, Del
Gui, 1: Add, Text, vTxtText1 x60 y160 w120 h23 +0x200
;=======================Прочее
Gui, 1: Add, GroupBox, x8 y192 w376 h169, Сообщение в консоль
Gui, 1: Add, Edit, x16 y208 w361 h144 vEditConsole1Var, %EditConsole1Var%
; Gui, 1: Add, Text, x16 y368 w260 h23 +0x200, F8 - Сообщение для консоли, F11 - AutoAccepter
Gui, 1: Add, Button, gLabelHideGui1 x304 y368 w80 h23, Hide in tray

Gui, 1: Add, CheckBox, vVBEVar gVBElabelC x16 y368 w155 h23 Checked%VBEVar%, Visible by Enemy (External)


if (ScWinrenamer = 1)
{
Random, rand1488, 33, 35
password := gen_password(rand1488)	
Gui, 1: Show, w392 h400, %password%
}
Else
{
Gui, 1: Show, w392 h400, %Versiya%
}

Gui, 1: Submit, NoHide
SteamPath := EditDir



FileGetTime, GetOutputVarGetTime2, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
{
	Gui, 1: Add, Picture, vMyPicture2 x17 y96 w37 h36 0x6 +Icon278, shell32.dll 	;восклицательный знак
	GuiControl,1:, TxtText2, Непонятный статус
}
Else
{
	if (GetOutputVarGetTime2 = OutputVarGetTime2) 	;если дата совподает то сменить значек
	{
		Gui, 1: Add, Picture, vMyPicture2 x17 y96 w37 h36 0x6 +Icon297, shell32.dll 	;зеленая галочка
		GuiControl,1:, TxtText2, Файл прошит
	}
	Else
	{
		if (OutputVarGetTime2 = "ERROR") or (OutputVarGetTime2 = "") 	;если дата с .ini пустая
		{
		Gui, 1: Add, Picture, vMyPicture2 x17 y96 w37 h36 0x6 +Icon278, shell32.dll 	;восклицательный знак
		GuiControl,1:, TxtText2, Непонятный статус
		}
		Else
		{
		Gui, 1: Add, Picture, vMyPicture2 x17 y96 w37 h36 0x6 +Icon132, shell32.dll 	;красный крестик
		GuiControl,1:, TxtText2, Требуется прошивка
		}
	}
}

FileGetTime, GetOutputVarGetTime, %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\engine2.dll
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\engine2.dll
{
	Gui, 1: Add, Picture, vMyPicture x17 y151 w39 h38 0x6 +Icon278, shell32.dll 	;восклицательный знак
	GuiControl,1:, TxtText1, Непонятный статус
}
Else
{
	if (GetOutputVarGetTime = OutputVarGetTime) 	;если дата совподает то сменить значек
	{
		Gui, 1: Add, Picture, vMyPicture x17 y151 w39 h38 0x6 +Icon297, shell32.dll 	;зеленая галочка
		GuiControl,1:, TxtText1, Файл прошит
	}
	Else
	{
		if (OutputVarGetTime = "ERROR") or (OutputVarGetTime = "") 	;если дата с .ini пустая
		{
		Gui, 1: Add, Picture, vMyPicture x17 y151 w39 h38 0x6 +Icon278, shell32.dll 	;восклицательный знак
		GuiControl,1:, TxtText1, Непонятный статус
		}
		Else
		{
		Gui, 1: Add, Picture, vMyPicture x17 y151 w39 h38 0x6 +Icon132, shell32.dll 	;красный крестик
		GuiControl,1:, TxtText1, Требуется прошивка
		}
	}
}










;==================================================Конец графической шапки и всего прочего, начинается VBE

Width :=A_ScreenWidth, Height := A_ScreenHeight
Gui, 2: new, +hwndguiId
Gui, 2: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs +Disabled

if (ScWinrenamer = 1)
{
Random, rand1488, 33, 35
password := gen_password(rand1488)	
Gui, 2: Show, NA, %password%
}
Else
{
Gui, 2: Show, NA
}
WinSet,ExStyle,^0x20
guiId+=0

hwnd1 := WinExist() ; Получите дескриптор этого окна, которое мы создали, чтобы обновить его позже
hbm := CreateDIBSection(Width, Height) ; Создайте растровое изображение gdi с шириной и высотой того, что мы собираемся нарисовать в нем. Это вся область рисования для всего
hdc := CreateCompatibleDC() ; Получите контекст устройства, совместимый с экраном
obm := SelectObject(hdc, hbm) ; Выберите растровое изображение в контексте устройства
G := Gdip_GraphicsFromHDC(hdc) ; Получить указатель на графику растрового изображения для использования с функциями рисования
Gdip_SetSmoothingMode(G, 4) ; Установите режим сглаживания на antialias = 4, чтобы формы выглядели более гладкими (используется только для векторного рисования и заливки)
; Обновите указанное окно, которое мы создали (hwnd1), с помощью дескриптора нашего растрового изображения (hdc), указав x, y, w, h, которое мы хотим разместить на нашем экране. Ширина и Высота, указанные ранее
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)




;переменные для редактирования памяти
	gameEXE:="ahk_exe dota2.exe"
	; gameDLL:="engine2.dll"
	; gameAddress:= "0x0052A680"
	; Offsets228 := [0x0, 0xD0, 0x170, 0x0, 0x5B0, 0x198, 0xE04] 	;+14 для сентрей
	IniRead, gameDLL, data\offsets.ini, Settings, DLL
	IniRead, gameAddress, data\offsets.ini, Settings, Address
	IniRead, Offsets228, data\offsets.ini, Settings, Offset
	Offsets228 := StrSplit(Offsets228, A_Space)
	
	;============Авто принятие игры (AHK)
	IniRead, AseptarKey, data\data.ini, Settings, AseptarKey
	Hotkey, *~%AseptarKey%, Metkakey_AseptarKey, on
	
	;============Сообщение в консоль
	IniRead, ConsoleSayAhk, data\data.ini, Settings, ConsoleSayAhk
	Hotkey, *~%ConsoleSayAhk%, Metkakey_ConsoleSayAhk, on


if !(VBEVar)
Return

	StartLabelStart:
	sleep 300
	1337flex := new _ClassMemory(gameEXE)
	baseAddress := 1337flex.getModuleBaseAddress(gameDLL)

	Goto StartLabel

StartLabel:
tooggletest1 = 0
Toggle:=1
While(Toggle)
{
	sleep 50
	ValueVis1337 := 1337flex.read(baseAddress + gameAddress, "UInt", Offsets228*)
	if (ValueVis1337 == "" )
	{
		Gdip_GraphicsClear(G) 	;очистить
		UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)
		Goto StartLabelStart
	}

	if ValueVis1337 > 0
	{
		Gosub goGreen1
	}
	Else
	{
		Gosub goRed1
	}
	
Gui, 1: Submit, NoHide
if !(VBEVar)
Toggle = 0

}
Return

AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"



VBElabelC:
Gui, 1: Submit, NoHide
if VBEVar
{
Goto StartLabelStart
}
Else
{
Toggle := 0
Gdip_GraphicsClear(G) 	;очистить
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)
}
Return



;=======================================бекграунд генератор
MetkaMenu3:
; получить путь к папке доты
Gui, 1: Submit, NoHide
SteamPath := EditDir
; проверка, компилятор на месте?
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\resourcecompiler.exe
{
	MsgBox Не найден "resourcecompiler.exe" по пути:`n`n%SteamPath%\steamapps\common\dota 2 beta\game\bin\win64`n`nНеправильно указан путь или не установлен Dota 2 - Tools
	Return
}
; Выбрать PNG файл
SelectedFileVar1 =
FileSelectFile, SelectedFileVar1, 3, ,PNG File, PNG File (*.png)
if (SelectedFileVar1 = "")
    Return
FileCopy, %SelectedFileVar1%, %A_ScriptDir%\data\All\Background-source\panorama\images\backgrounds\custom_background.png, 1
; Создать папку krambooba1337custom
FileCreateDir, %SteamPath%\steamapps\common\dota 2 beta\content\dota_addons\krambooba1337custom
FileCreateDir, %SteamPath%\steamapps\common\dota 2 beta\content\dota_addons\krambooba1337custom\panorama
; Копировать "panorama" из папки с скриптом в папку доты
FileCopyDir, %A_ScriptDir%\data\All\Background-source\panorama, %SteamPath%\steamapps\common\dota 2 beta\content\dota_addons\krambooba1337custom\panorama, 1
;Компилировать файлы
varcmd =
(
"%SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\resourcecompiler.exe" -vpkincr -i "%SteamPath%\steamapps\common\dota 2 beta\content\dota_addons\krambooba1337custom\*.*" -f -r & Exit
)
RunWait, cmd /k "%varcmd%"
;Копирование файлов из папки доты в папку скрипта
DirVarGen1=%A_Now%
FileCreateDir, %A_ScriptDir%\data\All\Background-sGen%DirVarGen1%
FileCreateDir, %A_ScriptDir%\data\All\Background-sGen%DirVarGen1%\panorama
FileCopyDir, %SteamPath%\steamapps\common\dota 2 beta\game\dota_addons\krambooba1337custom\panorama, %A_ScriptDir%\data\All\Background-sGen%DirVarGen1%\panorama, 1
; Очистить папку импорта
FileRemoveDir, %SteamPath%\steamapps\common\dota 2 beta\content\dota_addons\krambooba1337custom, 1
; Очистить папку экспорта
FileRemoveDir, %SteamPath%\steamapps\common\dota 2 beta\game\dota_addons\krambooba1337custom, 1
MsgBox 0x1, ,Переместить в "data\pak09_dir" и упаковать в VPK?
IfMsgBox OK, {
; Переместить в копировать файлы в pak09_dir
FileCopyDir, %A_ScriptDir%\data\All\Background-sGen%DirVarGen1%\panorama, %A_ScriptDir%\data\pak09_dir\panorama, 1
; Удалить Background-sGen%DirVarGen1%
FileRemoveDir, %A_ScriptDir%\data\All\Background-sGen%DirVarGen1%, 1
; Упаковать в pak09_dir, +Кодировочка ютф-8 "chcp 65001"
varcmd322 =
(
chcp 65001 & cd %A_ScriptDir%\data\ & vpk.exe pak09_dir & Exit
)
RunWait, cmd /k "%varcmd322%"
Return
} Else IfMsgBox Cancel, {
Run, %A_ScriptDir%\data\All\Background-sGen%DirVarGen1%
Return
}
Return


AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"





;============================================обновлятор
MetkaMenu2:
	FileCreateDir, update
	URLDownloadToFile, https://raw.githubusercontent.com/Kramar1337/Dota-AHK-flex/main/Dota`%20AHK/data/offsets.ini, update\offsets.ini

	IniRead, gameDLL, update\offsets.ini, Settings, DLL
	if !(gameDLL = "ERROR")
IniWrite, %gameDLL%, data\offsets.ini, Settings, DLL
	IniRead, gameAddress, update\offsets.ini, Settings, Address
	if !(gameAddress = "ERROR")
IniWrite, %gameAddress%, data\offsets.ini, Settings, Address
	IniRead, Offsets228, update\offsets.ini, Settings, Offset
	if !(Offsets228 = "ERROR")
IniWrite, %Offsets228%, data\offsets.ini, Settings, Offset


	FileRemoveDir, update, 1
	MsgBox,,, DLL=%gameDLL%`nAddress=%gameAddress%`nOffset=%Offsets228%, 2
	
	If ScRenamer
	{
	run %savereloadvar%
	exitapp
	return
	}
	
	Reload
Return






;============================================Начало прошивальщика dota\win64\client.dll (Прошить) gameinfo.gi bypass
ButtonGameinfoFlash:
Gui, 1: Submit, NoHide
IfWinExist AHK_exe dota2.exe
{
	MsgBox Обнаружен запущенный процес dota2.exe`nНельзя шить файлы пока запущена игра!!!`nЗакрывай игру
	Return
}
SteamPath := EditDir 	;переподать путь
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
{
	MsgBox Не найден файл "client.dll" по пути:`n`n%SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64`n`nНеправильно указан путь или файл удален
	Return
}
VarPID:=DllCall("GetCurrentProcessId")
IniWrite, %VarPID%, %A_ScriptDir%\data\data.ini, Data, VarPID
IniWrite, 0, %A_ScriptDir%\data\data.ini, Data, PlEngine
FileRead, FileReadOutputVarEngine1, *C %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
RunWait, *RunAs "%A_ScriptDir%\data\PlClient1.ahk"
IniRead, PlEngine, %A_ScriptDir%\data\data.ini, Data, PlEngine
if PlEngine
	{
	FileAppend, %FileReadOutputVarEngine1%, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
	IniWrite, 0, %A_ScriptDir%\data\data.ini, Data, PlEngine
		Gui, 1: Submit, NoHide
		SteamPath := EditDir
		FileGetTime, GetOutputVarGetTime2, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
		IniWrite, %GetOutputVarGetTime2%, %A_ScriptDir%\data\data.ini, Settings, OutputVarGetTime2
			GuiControl,1:, hide, MyPicture2
			GuiControl,1:, MyPicture2, *Icon297, shell32.dll
			GuiControl,1:, show, MyPicture2
			GuiControl,1:, TxtText2, Файл прошит
	}
Return

;============================================Начало прошивальщика dota\win64\client.dll (Прошить) DotaPlus
ButtonDotaPlusFlash:
Gui, 1: Submit, NoHide
IfWinExist AHK_exe dota2.exe
{
	MsgBox Обнаружен запущенный процес dota2.exe`nНельзя шить файлы пока запущена игра!!!`nЗакрывай игру
	Return
}
SteamPath := EditDir 	;переподать путь
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
{
	MsgBox Не найден файл "client.dll" по пути:`n`n%SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64`n`nНеправильно указан путь или файл удален
	Return
}
VarPID:=DllCall("GetCurrentProcessId")
IniWrite, %VarPID%, %A_ScriptDir%\data\data.ini, Data, VarPID
IniWrite, 0, %A_ScriptDir%\data\data.ini, Data, PlEngine
FileRead, FileReadOutputVarEngine1, *C %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
RunWait, *RunAs "%A_ScriptDir%\data\PlClient2.ahk"
IniRead, PlEngine, %A_ScriptDir%\data\data.ini, Data, PlEngine
if PlEngine
	{
	FileAppend, %FileReadOutputVarEngine1%, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
	IniWrite, 0, %A_ScriptDir%\data\data.ini, Data, PlEngine
		Gui, 1: Submit, NoHide
		SteamPath := EditDir
		FileGetTime, GetOutputVarGetTime2, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
		IniWrite, %GetOutputVarGetTime2%, %A_ScriptDir%\data\data.ini, Settings, OutputVarGetTime2
			GuiControl,1:, hide, MyPicture2
			GuiControl,1:, MyPicture2, *Icon297, shell32.dll
			GuiControl,1:, show, MyPicture2
			GuiControl,1:, TxtText2, Файл прошит
	}
Return





;============================================Удалить файл dota\win64\client.dll
ButtonDelDotaPlusGameinfoFlash:
Gui, 1: Submit, NoHide
IfWinExist AHK_exe dota2.exe
{
	MsgBox Обнаружен запущенный процес dota2.exe`nНельзя трогать файлы пока запущена игра!!!`nЗакрывай игру
	Return
}
SteamPath := EditDir 	;переподать путь
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
{
	MsgBox Не найден файл "client.dll" по пути:`n`n%SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64`n`nНеправильно указан путь или файл удален
	Return
}
MsgBox 0x1, Удалить файл client.dll, Нормального способа починить файл я не сделал и единственный вариант это удалить файл и проверить целосность кеша`n`nУдалить файл client.dll?
IfMsgBox OK, {
FileDelete, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\dota\bin\win64\client.dll
MsgBox,,, OK, 1
Else
MsgBox,,, Error, 1
Return
} Else IfMsgBox Cancel, {
Return
}
Return





;============================================Установить паки Ginfo (Ginfo)
ButtonGinfoVpkIns:
Gui, 1: Submit, NoHide
SteamPath := EditDir 	;переподать путь
IfWinExist AHK_exe dota2.exe
{
	MsgBox Обнаружен запущенный процес dota2.exe`nНельзя трогать файлы пока запущена игра!!!`nЗакрывай игру
	Return
}
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
{
	MsgBox Не найден файл "gameinfo.gi" по пути:`n`n%SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi`n`nНеправильно указан путь или файл удален
	Return
}
IfNotExist, %A_ScriptDir%\data\pak09_dir.vpk
{
	MsgBox Не найден файл "pak09_dir.vpk"`nНеобходимо создать vpk файл. 1337Create vpk.bat
	Return
}

UninInstall = 1 	;1 - Установить тыквы, 0 - Удалить тыквы
FileRead, PumPlus, data\PumPlus.txt
FileRead, PumMinus, data\PumMinus.txt
if UninInstall
{
	; Копировали файл в папку с игрой
	FileCreateDir, %SteamPath%\steamapps\common\dota 2 beta\game\D2Cmods 	;Создаем папку для хранения пака D2Cmods
	FileCopy, data\pak09_dir.vpk, %SteamPath%\steamapps\common\dota 2 beta\game\D2Cmods, 1 	;Копировать файл pak09_dir.vpk в папку с игрой
	; Копировать содержимое gameinfo.gi и изменить его
	FileRead, FileReadOutputVar1, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
	FileReadOutputVar1 := RegExReplace(FileReadOutputVar1, "m)^.*(These are optional)([\s\S]*)(first in the list.)", PumPlus)
}
Else
{
	FileRead, FileReadOutputVar1, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
	FileReadOutputVar1 := RegExReplace(FileReadOutputVar1, "m)^.*(These are optional)([\s\S]*)(first in the list.)", PumMinus)
	FileDelete, %SteamPath%\steamapps\common\dota 2 beta\game\D2Cmods\pak09_dir.vpk
}
FileEncoding
FileDelete, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi 	;заменить на %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
FileAppend, %FileReadOutputVar1%, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
MsgBox,,, OK, 1
Return





;===============================================================VBE
goGreen1:
IfWinActive, Dota 2
{
Gdip_GraphicsClear(G) 	;очистить
Font = Arial
Options = x0p y5p Centre cbb15ff00 r3 s55 Bold
Gdip_TextToGraphics(G, "No", Options, Font, Width, Height)
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)
}
IfWinNotActive, Dota 2
{
Gdip_GraphicsClear(G) 	;очистить
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)
}
Return
goRed1:
IfWinActive, Dota 2
{
Gdip_GraphicsClear(G) 	;очистить
Font = Arial
Options = x0p y5p Centre cbbff0000 r3 s55 Bold
Gdip_TextToGraphics(G, "Vis", Options, Font, Width, Height)
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)
}
IfWinNotActive, Dota 2
{
Gdip_GraphicsClear(G) 	;очистить
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)
}
Return


MetkaMenu1:
Gui, 1: Show
Return

LabelHideGui1:
Gui, 1: Cancel
Return
;===============================================================Отправить сообщение
Metkakey_ConsoleSayAhk:
	Sleep 1
	IfWinNotActive, Dota 2
	Return
	Gui, 1: Submit, NoHide
	loop, parse, EditConsole1Var, `n, `r
	{
		Total:=a_index
	}
	if (Total > 21)
	{
		MsgBox Сработала защита.`nНельзя использовать больше 20 строк.`nЭто ограничение можно убрать в исходнике
		Return
	}
	ConsoleComandCl =
    Loop, parse, EditConsole1Var, `n
    {
		if (A_LoopField)
		{
		ConsoleComandCl := ConsoleComandCl A_LoopField "`; "
		; Sleep 150
		; SendInput %A_LoopField%
		; sleep 1
		; SendInput {Enter}
		}
	
    }
	Clipboard =
	Sleep 1
	Clipboard = %ConsoleComandCl%
	Sleep 1
	SendInput ^v
	Sleep 100
	SendInput {Enter}
	Sleep 1
	Clipboard =
Return

;===============================================================Автоприниматель игры(автоасептар)
Metkakey_AseptarKey:
x1asept:=A_ScreenWidth*.5
y1asept:=A_ScreenHeight*.4907
toggleAseps:=!toggleAseps
    if (toggleAseps) {
        SetTimer, Accepter1, on
    } else {
		ToolTip
        SetTImer, Accepter1, Off
    }
return

Accepter1:
MouseMove,x1asept,y1asept
sleep 100
Click
ToolTip, Dota2 Accepter is active`nPress F11 to deactivate
sleep 5000
return



;============================================Установить тыквы (Установить)
ButtonTreeInstal:
Gui, 1: Submit, NoHide
SteamPath := EditDir 	;переподать путь
IfWinExist AHK_exe dota2.exe
{
	MsgBox Обнаружен запущенный процес dota2.exe`nНельзя трогать файлы пока запущена игра!!!`nЗакрывай игру
	Return
}
IfNotExist, %A_ScriptDir%\data\pak09_dir.vpk
{
	MsgBox Не найден файл "pak09_dir.vpk"`nНеобходимо создать vpk файл. 1337Create vpk.bat
	Return
}

IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\dota_russian
{
	MsgBox Перед установкой необходимо установить русскую озвучку`nНе найдена папка`n%SteamPath%\steamapps\common\dota 2 beta\game\dota_russian
	Return
}

FileCopy, data\pak09_dir.vpk, %SteamPath%\steamapps\common\dota 2 beta\game\dota_russian, 1 	;Копировать файл pak09_dir.vpk в папку с игрой

MsgBox,,, OK, 1
Return


;============================================Удалить тыквы (Удалить)
ButtonTreeUninstal:
Gui, 1: Submit, NoHide
SteamPath := EditDir 	;переподать путь
IfWinExist AHK_exe dota2.exe
{
	MsgBox Обнаружен запущенный процес dota2.exe`nНельзя трогать файлы пока запущена игра!!!`nЗакрывай игру
	Return
}
FileDelete, %SteamPath%\steamapps\common\dota 2 beta\game\dota_russian\pak09_dir.vpk

Gui, 1: Submit, NoHide
SteamPath := EditDir 	;переподать путь
IfWinExist AHK_exe dota2.exe
{
	MsgBox Обнаружен запущенный процес dota2.exe`nНельзя трогать файлы пока запущена игра!!!`nЗакрывай игру
	Return
}
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
{
	MsgBox Не найден файл "gameinfo.gi" по пути:`n`n%SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi`n`nНеправильно указан путь или файл удален
	Return
}
UninInstall = 0 	;1 - Установить тыквы, 0 - Удалить тыквы
FileRead, PumPlus, data\PumPlus.txt
FileRead, PumMinus, data\PumMinus.txt
if UninInstall
{
	; Копировали файл в папку с игрой
	FileCreateDir, %SteamPath%\steamapps\common\dota 2 beta\game\D2Cmods 	;Создаем папку для хранения пака D2Cmods
	FileCopy, data\pak09_dir.vpk, %SteamPath%\steamapps\common\dota 2 beta\game\D2Cmods, 1 	;Копировать файл pak09_dir.vpk в папку с игрой
	; Копировать содержимое gameinfo.gi и изменить его
	FileRead, FileReadOutputVar1, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
	FileReadOutputVar1 := RegExReplace(FileReadOutputVar1, "m)^.*(These are optional)([\s\S]*)(first in the list.)", PumPlus)
}
Else
{
	FileRead, FileReadOutputVar1, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
	FileReadOutputVar1 := RegExReplace(FileReadOutputVar1, "m)^.*(These are optional)([\s\S]*)(first in the list.)", PumMinus)
	FileDelete, %SteamPath%\steamapps\common\dota 2 beta\game\D2Cmods\pak09_dir.vpk
}
FileEncoding
FileDelete, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi 	;заменить на %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
FileAppend, %FileReadOutputVar1%, %SteamPath%\steamapps\common\dota 2 beta\game\dota\gameinfo.gi
MsgBox,,, OK, 1
Return



;============================================Удалить файл engine2.dll (Del engine2.dll)
ButtonDelFlash:
Gui, 1: Submit, NoHide
IfWinExist AHK_exe dota2.exe
{
	MsgBox Обнаружен запущенный процес dota2.exe`nНельзя трогать файлы пока запущена игра!!!`nЗакрывай игру
	Return
}
SteamPath := EditDir 	;переподать путь
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\engine2.dll
{
	MsgBox Не найден файл "engine2.dll" по пути:`n`n%SteamPath%\steamapps\common\dota 2 beta\game\bin\win64`n`nНеправильно указан путь или файл удален
	Return
}
MsgBox 0x1, Удалить файл engine2.dll, Нормального способа починить файл я не сделал и единственный вариант это удалить файл и проверить целосность кеша`n`nУдалить файл engine2.dll?
IfMsgBox OK, {
FileDelete, %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\engine2.dll
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\engine2.dll
MsgBox,,, OK, 1
Else
MsgBox,,, Error, 1
Return
} Else IfMsgBox Cancel, {
Return
}
Return




;============================================Начало прошивальщика (Прошить)
ButtonFlash:
Gui, 1: Submit, NoHide
IfWinExist AHK_exe dota2.exe
{
	MsgBox Обнаружен запущенный процес dota2.exe`nНельзя шить файлы пока запущена игра!!!`nЗакрывай игру
	Return
}
SteamPath := EditDir 	;переподать путь
IfNotExist, %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\engine2.dll
{
	MsgBox Не найден файл "engine2.dll" по пути:`n`n%SteamPath%\steamapps\common\dota 2 beta\game\bin\win64`n`nНеправильно указан путь или файл удален
	Return
}
VarPID:=DllCall("GetCurrentProcessId")
IniWrite, %VarPID%, %A_ScriptDir%\data\data.ini, Data, VarPID
IniWrite, 0, %A_ScriptDir%\data\data.ini, Data, PlEngine
FileRead, FileReadOutputVarEngine1, *C %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\engine2.dll
RunWait, *RunAs "%A_ScriptDir%\data\PlEngine.ahk"
IniRead, PlEngine, %A_ScriptDir%\data\data.ini, Data, PlEngine
if PlEngine
	{
	FileAppend, %FileReadOutputVarEngine1%, %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\engine2.dll
	IniWrite, 0, %A_ScriptDir%\data\data.ini, Data, PlEngine
		Gui, 1: Submit, NoHide
		SteamPath := EditDir
		FileGetTime, GetOutputVarGetTime, %SteamPath%\steamapps\common\dota 2 beta\game\bin\win64\engine2.dll
		IniWrite, %GetOutputVarGetTime%, %A_ScriptDir%\data\data.ini, Settings, OutputVarGetTime
			GuiControl,1:, hide, MyPicture
			GuiControl,1:, MyPicture, *Icon297, shell32.dll
			GuiControl,1:, show, MyPicture
			GuiControl,1:, TxtText1, Файл прошит
	}
Return


;============================================Указать путь к игре (Edit)
gameway:
if (ONregreadDir == 0)
{
	FileSelectFolder, DirVar228,::{20d04fe0-3aea-1069-a2d8-08002b30309d},3,Путь к папке с игрой `nПример "C:\Program Files (x86)\Steam"
	if DirVar228 !=
	{
		GuiControl,1:, EditDir, %DirVar228%
		Gui, 1: Submit, NoHide
		IniWrite, %DirVar228%, data\data.ini, Settings, DirGame
	}
}
Return
; ==============================================Автопуть с реестра
CheckboxRegDirG:
Gui, 1: Submit, nohide
If (ONregreadDir == 1) ; Если в конфиге путь к игре реестр вкл, то:
{
	;=====================Реестр расположение папки с игрой
	; RegRead, DirVarGensh, HKEY_CURRENT_USER, Software\Valve\Steam, SteamPath
	; DirVarGensh := RegExReplace(DirVarGensh, "/", "\") 	;Выровнять путь сменить слеши
RegRead, 1337DirVar, HKEY_CURRENT_USER, SOFTWARE\Classes\dota2\Shell\Open\Command
SplitPath, 1337DirVar,, dirvarget1
RegExRepFilevar1 := RegExReplace(dirvarget1, """", "") 	;Убрать кавычки
RegExRepFilevar2 := RegExReplace(RegExRepFilevar1, "/", "\") 	;Выровнять путь сменить слеши
DirVarGensh := RegExReplace(RegExRepFilevar2, "\\steamapps\\common\\dota 2 beta\\game\\bin\\win64", "") 	;Убрать путь

if (DirVarGensh == "")
{
	RegRead, DirVarGensh, HKEY_CURRENT_USER, Software\Valve\Steam, SteamPath
	DirVarGensh := RegExReplace(DirVarGensh, "/", "\") 	;Выровнять путь сменить слеши
}
	
	GuiControl,1:, EditDir, %DirVarGensh%
	IniWrite, 1, data\data.ini, Settings, ONregreadDir
}
If (ONregreadDir == 0) ; Если в конфиге путь к игре реестр вкл, то:
{
	IniRead, DirGame, data\data.ini, Settings, DirGame
	GuiControl,1:, EditDir, %DirGame%
	IniWrite, 0, data\data.ini, Settings, ONregreadDir
}
Return


	
;======================================================функция рандома
gen_password(length = 8)																;начало фукции длина пароля по дефолту 8
{																						
	possible = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890			;переменная с символами
	StringLen, max, possible															;сколько символов в переменной
	if length > %max%																	;если длина пароля больше переменной то выйти
	{																					
		MsgBox, Длина должна быть меньше количества возможных символов.				
		Exit, 40																		
	}																					
	Loop																				;начало петли
	{																					
		Random, rand, 1, max															;зарандомить от 1 до %число символов в переменной %possible%%
		StringMid, char, possible, rand, 1												;извлеч из %possible%(наши символы), номер символа %rand%, кол-во 1, в %char%
		IfNotInString, password, %char%													;повторился ли символ %password% и %char%
		{																				
			password = %password%%char%													;склеить то что было и новый символ
			if StrLen(password) >= length												;если длина строки %password% больше или равна длине %length%
				break																	;выйти из петли
		}																				
	}																					
	return password																		;вернуть сгенерированое значение в переменную
}


GuiEscape:
GuiClose:
    ExitApp
	
*~$Home::
	If ScRenamer
	{
	run %savereloadvar%
	exitapp
	return
	}
Reload
Return


AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"


;===============================================================Функция выхода из скрипта
MetkaMenu0:
ExitApp
Return
ExitFunc(ExitReason, ExitCode)
{
Gdip_DeletePen(pPen) ; Delete the brush as it is no longer needed and wastes memory
SelectObject(hdc, obm) ; Select the object back into the hdc
DeleteObject(hbm) ; Now the bitmap may be deleted
DeleteDC(hdc) ; Also the device context related to the bitmap may be deleted
Gdip_DeleteGraphics(G) ; The graphics may now be deleted
Gdip_Shutdown(pToken)
Gui, 1: Submit, NoHide
IniWrite, %VBEVar%, %A_ScriptDir%\data\data.ini, Settings, VBEVar
FileSetAttrib, -R, data\ConsoleVar.txt
FileDelete, data\ConsoleVar.txt
FileAppend, %EditConsole1Var%, data\ConsoleVar.txt
}



