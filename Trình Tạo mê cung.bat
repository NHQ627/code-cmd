@echo off
chcp 65001 >nul
title Trình tạo mê cung
for /F "delims=#" %%a in ('"prompt #$E# & for %%a in (1) do rem"') do set "Esc=%%a"

set menu=%Esc%[1;61Ha%Esc%[2;49H◂────────────────────────▸%Esc%[3;48H▴██████████████████████████%Esc%[4;48H│        ██              ██%Esc%[5;48H│██████  ██████  ██████  ██%Esc%[6;48H│██      ██          ██  ██%Esc%[7;48H│██  ██  ██  ██████████  ██  a≤29%Esc%[8;47Hb│██  ██      ██          ██  b≤14%Esc%[9;48H│██  ██████  ██████████  ██  a,b≥1%Esc%[10;48H│██      ██  ██      ██  ██%Esc%[11;48H│██████  ██  ██████  ██  ██%Esc%[12;48H│██      ██          ██  %Esc%[13;48H▾██████████████████████████%Esc%[14;60Haxb%Esc%[16;56H╔══╗   ╔══╗%Esc%[17;56H║  ║ x ║  ║%Esc%[18;56H╚══╝   ╚══╝

<nul set /p ="%menu%"

:seta
set /p a="%Esc%[17;57H"
if "%a%"=="" ( 
 call :reseta
) else (
 if "%a:~0,1%"=="0" (
  call :reseta
 )
)
echo %a%| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 (
 call :reseta
)
if %a% LEQ 29 (
 if %a% GEQ 1 (
  rem
 ) else (
  call :reseta
 )
) else (
 call :reseta
)

:setb
set /p b="%Esc%[17;64H"
if "%b%"=="" ( 
 call :resetb
) else (
 if "%b:~0,1%"=="0" (
  call :resetb
 )
)
echo %b%| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 (
 call :resetb
)
if %b% LEQ 14 (
 if %b% GEQ 1 (
  rem
 ) else (
  call :resetb
 )
) else (
 call :resetb
)

<nul set /p ="%Esc%[?25l"
cls
goto :taomecung

:reseta
set "a="
call :kohople
goto :seta
goto :eof

:resetb
set "b="
call :kohople
goto :setb
goto :eof

:kohople
cls
<nul set /p ="%menu%%Esc%[17;57H%a%%Esc%[17;64H%b%%Esc%[?25l%Esc%[20;55H%Esc%[6m%Esc%[31mKHÔNG HỢP LỆ!%Esc%[0m"
timeout /t 5 >nul
<nul set /p ="%Esc%[?25h%Esc%[20;55H             "
goto :eof

:taomecung

set /a "X=%a%*2+1" & set /a "Y=%b%*2+1"
set /a "S=%X%*%Y%"

setLocal enabledelayedexpansion

for /L %%A in (1,1,%X%) do (
 for /L %%B in (1,1,%Y%) do (
  set "(%%B;%%A)={1}{%%B}{%%A}"
 )
)

set "Chuot=(2;2)" & set /a "gocthoat=%Y%-1"
set "dgthoat=(%gocthoat%;%X%)"
set (2;1)={0}%(2;1):~3,10% & set %dgthoat%={0}!%dgthoat%:~3,10! & set (2;2)={0}%(2;2):~3,10%

set sothutu=0 & set sodiemdadao=0

:xulythongtin


for /F "Tokens=1-3 Delims={}" %%A in ("!%Chuot%!") do (

 set /a "Yc1=%%B+1" & set /a "Yt1=%%B-1" & set /a "Xc1=%%C+1" & set /a "Xt1=%%C-1" & set /a "Yc2=%%B+2" & set /a "Yt2=%%B-2" & set /a "Xc2=%%C+2" & set /a "Xt2=%%C-2"
 set "dg1=(!Yc1!;%%C),(!Yc2!;%%C)" & set "dg2=(!Yt1!;%%C),(!Yt2!;%%C)" & set "dg3=(%%B;!Xc1!),(%%B;!Xc2!)" & set "dg4=(%%B;!Xt1!),(%%B;!Xt2!)"

 for %%D in (dg1 dg2 dg3 dg4) do (
  for /F "Tokens=1-2 Delims=," %%E in ("!%%D!") do (
   set "xetdiem=!%%F!"
   if "!xetdiem:~1,1!"=="1" (
    echo %%D ok !%%D!     
    set /a sothutu+=1
    set list[!sothutu!]=!%%D!
   ) else (
    echo %%D nah !%%D!     
   )
  )
 )

)

:randomlai
set /a r=%random% %% %sothutu%+1

for /F "Tokens=1-2 Delims=," %%A in ("!list[%r%]!") do (
 if "!%%B:~1,1!"=="0" (
  call :xoa
  goto :randomlai
 )
 set %%A={0}!%%A:~3,10! & set %%B={0}!%%B:~3,10! & set Chuot=%%B
 <nul set /p =%Esc%[9;1HCạch được chọn: !list[%r%]!     
 call :xoa
)

set /a sodiemdadao+=1
set /a hoanthanh=(%sodiemdadao%*100)/(%a%*%b%)

<nul set /p ="%Esc%[5;1HDiện tích: %S%     %Esc%[6;1HSố điểm đã đào: %sodiemdadao%     %Esc%[7;1HDanh sách: %sothutu%     %Esc%[8;1HRamdom: %r%     %Esc%[10;1HVị trí chuột: %Chuot%     %Esc%[12;1HHoàn thành:%hoanthanh%%%%Esc%[1;1H"

if "%sothutu%"=="0" (
 goto :done
) else (
 goto :xulythongtin
  :xoa
 for /L %%a in (%r%,1,%sothutu%) do (
  set /a next=%%a+1
  call set "list[%%a]=%%list[!next!]%%"
 )
 set /a sothutu-=1
 goto :eof
)

:done
cls
for /L %%Y in (1,1,%Y%) do (
 for /L %%X in (1,1,%X%) do (

  call set "tuong=%%(%%Y;%%X)%%"

  if "!tuong:~1,1!"=="1" (
   set "char=█"
  ) else (
   set "char=⠀"
  )
  <nul set /p ="!char!!char!"
 )
 echo.
)

pause >nul

rem cre:NHQ627