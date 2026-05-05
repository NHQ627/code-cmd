@echo off
chcp 65001 >nul
for /F "delims=#" %%a in ('"prompt #$E# & for %%a in (1) do rem"') do set "Esc=%%a"
echo %Esc%[?25l

set Khung={37}{1}{1}{65}{10}{╔}{╗}{╚}{╝}{║}{═}{phải}{100}
call :khung

pause >nul
exit

:khung

setlocal enabledelayedexpansion

for /F "Tokens=1-13 Delims={}" %%A in ("%Khung%") Do (
 Set "X=%%B" & Set "Y=%%C" & Set "Xx=%%D" & Set "Yy=%%E" & set "goc1=%%F" & set "goc2=%%G" & set "goc3=%%H" & set "goc4=%%I" & set "khung1=%%J" & set "khung2=%%K" & set "huong=%%L"& set "tocdok=%%M"

 echo %Esc%[%%Am
 set /a "Y2=Yy-1","Y1=Y+1","X2=Xx-1","X1=X+1"

 if /I "!huong!"=="phải" (

  for /L %%a in (!Y1!,1,!Y2!) do (
   echo %Esc%[%%a;!Xx!H!khung1!
  )
  echo %Esc%[!Y!;!Xx!H!goc2!%Esc%[!Yy!;!Xx!H!goc4!

  for /L %%a in (!X2!,-1,!X1!) do (
   echo %Esc%[!Y!;%%aH!khung2!%Esc%[!Yy!;%%aH!khung2!
   For /L %%d in (1,1,%%M)Do Call :Delay 2> nul
  )

  for /L %%a in (!Y1!,1,!Y2!) do (
   echo %Esc%[%%a;!X!H!khung1!
  )
  echo %Esc%[!Y!;!X!H!goc1!%Esc%[!Yy!;!X!H!goc3!

 ) else if /I "!huong!"=="trái" (
  
  for /L %%a in (!Y1!,1,!Y2!) do (
   echo %Esc%[%%a;!X!H!khung1!
  )
  echo %Esc%[!Y!;!X!H!goc1!%Esc%[!Yy!;!X!H!goc3!

  for /L %%a in (!X1!,1,!X2!) do (
   echo %Esc%[!Y!;%%aH!khung2!%Esc%[!Yy!;%%aH!khung2!
   For /L %%d in (1,1,%%M)Do Call :Delay 2> nul
  )

  for /L %%a in (!Y1!,1,!Y2!) do (
   echo %Esc%[%%a;!Xx!H!khung1!
  )
  echo %Esc%[!Y!;!Xx!H!goc2!%Esc%[!Yy!;!Xx!H!goc4!
  
 ) else if /I "!huong!"=="trên" (

  for /L %%a in (!X1!,1,!X2!) do (
   echo %Esc%[!Y!;%%aH!khung2!
  )
  echo %Esc%[!Y!;!X!H!goc1!%Esc%[!Y!;!Xx!H!goc2!

  for /L %%a in (!Y1!,1,!Y2!) do (
   echo %Esc%[%%a;!X!H!khung1!%Esc%[%%a;!Xx!H!khung1!
   For /L %%d in (1,1,%%M)Do Call :Delay 2> nul
  )

  for /L %%a in (!X1!,1,!X2!) do (
   echo %Esc%[!Yy!;%%aH!khung2!
  )
  echo %Esc%[!Yy!;!X!H!goc3!%Esc%[!Yy!;!Xx!H!goc4!

 ) else if /I "!huong!"=="dưới" (

  for /L %%a in (!X1!,1,!X2!) do (
   echo %Esc%[!Yy!;%%aH!khung2!
  )
  echo %Esc%[!Yy!;!X!H!goc3!%Esc%[!Yy!;!Xx!H!goc4!

  for /L %%a in (!Y2!,-1,!Y1!) do (
   echo %Esc%[%%a;!X!H!khung1!%Esc%[%%a;!Xx!H!khung1!
   For /L %%d in (1,1,%%M)Do Call :Delay 2> nul
  )

  for /L %%a in (!X1!,1,!X2!) do (
   echo %Esc%[!Y!;%%aH!khung2!
  )
  echo %Esc%[!Y!;!X!H!goc1!%Esc%[!Y!;!Xx!H!goc2!

 )
)
  goto :eof
endlocal
rem cre:NHQ627
