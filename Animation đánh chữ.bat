@echo off
chcp 65001 >nul
for /F "delims=#" %%a in ('"prompt #$E# & for %%a in (1) do rem"') do set "Esc=%%a"
echo %Esc%[?25l

((set "text=hello") & (set "vitrivb=1,1")) & call :vanban
((set "text=text") & (set "vitrivb=2,1")) & call :vanban
((set "text=arrrrrrrrrrrrrrrrr") & (set "vitrivb=4,2")) & call :vanban
((set "text=1+1=3") & (set "vitrivb=5,3")) & call :vanban
((set "text=animation đánh chữ") & (set "vitrivb=10,5")) & call :vanban


pause >nul
exit

:vanban
SetLocal EnableDelayedExpansion
for /F "Tokens=1-2 Delims=," %%A in ("%vitrivb%") Do (
 Set "Y=%%A" & Set "X=%%B"
 for /L %%i in (0,1,800) do (
   set "char=!text:~%%i,1!"
   if "!char!"=="" goto :eof
   echo !Esc![!Y!;!X!H!char!
   set /a "X+=1"
   For /L %%d in (1 1 50)Do Call :Delay 2> nul
 )
)
endlocal
rem cre:NHQ627
