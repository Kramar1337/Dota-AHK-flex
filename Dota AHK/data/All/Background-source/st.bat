set Compiler="C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\bin\win64\resourcecompiler.exe"
set ModSrc="C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\content\dota_addons\custom\*.*"
%Compiler% -vpkincr -i %ModSrc% -f -r
pause
