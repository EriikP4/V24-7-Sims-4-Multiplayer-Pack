::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHOMG+EmqcI4otg==
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHOMG+Empdpdg1G9UnMcJQhhKanI=
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnmoUQMoqerPs1bumL+9e31XgdIIoxEZPiM8NGB5KQhaqeg4IoW9Spn3LIcWP0w==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD5GRQ++GGS5E7gZ5vzo082OtmUIVt4Id4Dz1bvDFfAX61HhZ6o4xn5bjM4eMB9ZahOXex8wqHpHpG2GOMnSugzuKg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJiZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD5GRQ++GGS5E7gZ5vzo082OtmUIVt4Id4Dz1bvDFfAX61HhZ6o4xn5bjM4eMA0KQge7ag4grHwMs3yAVw==
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001>NUL
mode con:cols=70 lines=15
title V-24/7 Mod Updater
set version_path="%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\mod_version.txt"
set /p local_ver=<%version_path%
wget --quiet --no-check-certificate "https://raw.githubusercontent.com/Hotel-Viciados/WooHoo-Updater/main/updater/data/version.txt" -O version.txt
set /p cloud_ver=<version.txt

echo Se encontraron actualizaciones
timeout 2 >nul
echo ---
echo Versión instalada: %local_ver%
echo Versión disponible: %cloud_ver%
echo ---
timeout 2 >nul
choice /C SN /N /M "¿Quieres actualizar? [S/N] >"
if %ErrorLevel%==1 goto UPDATE_ACCEPT
if %ErrorLevel%==2 goto CANCEL
:UPDATE_ACCEPT
cls
echo Descargando librerías...
wget.exe --quiet --show-progress --no-check-certificate "https://www.udrop.com/file/Mj03/Update_v3.7z" -O update3.7z
echo Descomprimiendo librerías...
7za.exe x -aoa update3.7z
cls
echo %cloud_ver%> "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\mod_version.txt"
echo Limpiando caché...
del version.txt
del update3.7z
start /wait happy.vbs
exit

:CANCEL
cls
echo ERROR 1: UPDATE_FAILED_USER_STOPPED_ACTION
echo La actualización ha sido cancelada por el usuario.
echo Saliendo...
timeout 5 >nul
exit


:UP_TO_DATE
echo No hay actualizaciones
echo WooHoo ya está actualizado
echo Pulsa ENTER para salir...
pause >nul
exit