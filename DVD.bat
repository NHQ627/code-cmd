@echo off
chcp 65001 >nul
title DVD
mode 120,30
for /F "delims=#" %%a in ('"prompt #$E# & for %%a in (1) do rem"') do set "Esc=%%a"
echo %Esc%[?25l

set /a X=(%random% %% 106+1) & set /a Y=(%random% %% 27+1) & set /a TTX=(%random% %% 2+1)*10+(%random% %% 2+1) & set /a TTY=(%random% %% 2+1)*10+(%random% %% 2+1) & set /a mau=%random% %% 7+31
set /a Y1=%Y%+1 & set /a Y2=%Y%+2 & set /a Y3=%Y%+3 & set /a Y4=%Y%+4 & set /a X1=%X%+1

if %TTX:~0,1%==1 (
 set "TTX=+"
) else (
 if %TTX:~0,1%==2 (
  set "TTX=-"
 )
)

if %TTY:~1,1%==1 (
 set "TTY=+"
) else (
 if %TTY:~1,1%==2 (
  set "TTY=-"
 )
)

:thieplaplai

if %X1%==106 (
 set "TTX=-"
 call :mau
) else if %X1%==1 (
 set "TTX=+"
 call :mau
)

if %Y3%==30 (
 set "TTY=-"
 call :mau
) else if %Y1%==1 (
 set "TTY=+"
 call :mau
)

:tiep

set /a X%TTX%=1 & set /a X1%TTX%=1 & set /a Y%TTY%=1 & set /a Y1%TTY%=1 & set /a Y2%TTY%=1 & set /a Y3%TTY%=1 & set /a Y4%TTY%=1

<nul set /p ="%Esc%[%mau%m%Esc%[%Y%;%X%H                 %Esc%[%Y1%;%X%H                 %Esc%[%Y2%;%X%H                 %Esc%[%Y3%;%X%H                 %Esc%[%Y4%;%X%H                 %Esc%[%Y1%;%X1%H█▀▀▄▐▌  ▐▌█▀▀▄ %Esc%[%Y2%;%X1%H█  ▐▌█▁▁█ █  ▐▌%Esc%[%Y3%;%X1%H█▄▄▀  ▜▛  █▄▄▀ "

For /L %%d in (1 1 110)Do Call :Delay 2> nul

goto :thieplaplai

:mau

set maucu=%mau%

set /a mau=%random% %% 7+31

if %mau%==%maucu% (
 goto :mau
)

goto :eof

pause
rem cre:NHQ627