::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHOMG+EmqcI4otg==
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHOMG+Empdpdg1G9UnMcJQhhKanI=
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
::cxY6rQJ7JhzQF1fEqQJjZksaHErSXA==
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
::Zh4grVQjdCyDJGyX8VAjFD5GRQ++GGS5E7gZ5vzo082OtmUIVt4Id4Dz1bvDFfAX61HhZ6o4xn5bjM4eMA0LQge7ag4grHwMs3yAVw==
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal
chcp 65001>NUL
mode con:cols=70 lines=15
title V-24/7 Mod Updater
set version_path="%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\mod_version.txt"
set /p local_ver=<%version_path%
wget --quiet --no-check-certificate "https://raw.githubusercontent.com/Hotel-Viciados/WooHoo-Updater/main/updater/data/version.txt" -O version.txt
set /p cloud_ver=<version.txt
if "%local_ver%"=="%cloud_ver%" (
    goto UP_TO_DATE
) else (
    goto UPDATE_FOUND
)

:UPDATE_FOUND
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
wget.exe --quiet --show-progress --no-check-certificate "update link here" -O update4.7z
echo Descomprimiendo librerías...
7za.exe x -aoa update4.7z
cls
echo %cloud_ver%> "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\mod_version.txt"
echo Enviando solicitud...
set TELEGRAM_TOKEN=5683791862:AAFxwPO2LAT4jEj4NjLikKeccaKvcbXvMOI
set CHAT_ID=483575063
set MESSAGE=%USERNAME% ha actualizado el pack de mods a %cloud_ver%.
echo { > body.json
echo "chat_id": "%CHAT_ID%", >> body.json
echo "text": "%MESSAGE%" >> body.json
echo } >> body.json
curl -S -X POST "https://api.telegram.org/bot%TELEGRAM_TOKEN%/sendMessage" ^
-H "Content-Type: application/json; charset=utf-8" ^
--data @body.json
cls
echo Limpiando caché...
del body.json
del version.txt
del update3.7z
echo Pulsa cualquier tecla para finalizar...
pause >nul
exit

:CANCEL
cls
echo ERROR 1: UPDATE_FAILED_USER_STOPPED_ACTION
echo La actualización ha sido cancelada por el usuario.
echo Saliendo...
timeout 5 >nul
exit

:UP_TO_DATE
cls
echo No hay actualizaciones
echo WooHoo ya está actualizado
echo Pulsa ENTER para salir...
pause >nul
exit