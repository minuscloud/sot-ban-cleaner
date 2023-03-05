@echo off
cls
goto check_Permissions
:check_Permissions  
    net session >nul 2>&1
    if NOT %errorLevel% == 0 (
         echo [31mError: Restart with admin permissions.[0m
         pause >nul
    )
echo [36mwelcome to sea of thieves tracer cleaner made by cloud[0m
echo.
echo [31mmake sure to logout of your microsoft store account[0m
echo.
echo [31mif you logged out press a random KEY to continue[0m
echo.
pause
echo [31mstarting to clean xbox registry...[0m
timeout /t 5 /nobreak >nul
reg delete "HKEY_CURRENT_USER\Software\Microsoft\IdentityCRL" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OneSettings\xbox" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Microsoft\IdentityCRL" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\XboxLive" /f
echo [32mdone cleaning xbox registry[0m
echo.
echo [31mstarting to clean microsoft tokens...[0m
timeout /t 5 /nobreak >nul
cmdkey.exe /list > "%TEMP%\List.txt"
findstr.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO cmdkey.exe /delete:%%H
del "%TEMP%\List.txt" /s /f /q
del "%TEMP%\tokensonly.txt" /s /f /q
echo [32mdone cleaning microsoft tokens[0m
echo.
echo [33mCleaned Traces. TODO: Create a new steam account and buy sea of thieves again after that create a new microsoft account and you can play the game again.[0m
timeout /t 8 /nobreak >nul
echo.
echo [41mFinished. If you read everything, press a random KEY to restart your computer[0m
start https://github.com/cloudfps
pause
echo.
echo [42mrestarting your pc in 5...[0m
@timeout /t 1 /nobreak >nul
echo [42mrestarting your pc in 4...[0m
@timeout /t 1 /nobreak >nul
echo [42mrestarting your pc in 3...[0m
@timeout /t 1 /nobreak >nul
echo [42mrestarting your pc in 2...[0m
@timeout /t 1 /nobreak >nul
echo [42mrestarting your pc in 1...[0m
@timeout /t 1 /nobreak >nul
shutdown -r -t 0
pause >nul