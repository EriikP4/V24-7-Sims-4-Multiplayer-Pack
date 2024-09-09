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
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
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
::Zh4grVQjdCyDJGyX8VAjFD5GRQ++GGS5E7gZ5vzo082OtmUIVt4Id4Dz1bvDFfAX61HhZ6o4xn5bjM4eMBdZahe4ejMhuWpDomGXecKEtm8=
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal
chcp 65001>NUL
mode con:cols=70 lines=15
title V-24/7 Mod Updater b7163
set version_path="%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\mod_version.txt"
set /p local_ver=<%version_path%
wget --quiet --no-check-certificate "https://raw.githubusercontent.com/Hotel-Viciados/WooHoo-Updater/main/updater/data/cloud_version.txt" -O version.txt
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
if "%local_ver%"=="v2" (
    goto v3
)
if "%local_ver%"=="v3" (
    goto v4
)
echo ERROR 404: VERSION_NOT_FOUND
echo No se ha encontrado la versión.
pause
exit

:v3
wget.exe --quiet --show-progress --no-check-certificate "https://www.udrop.com/file/Mj03/Update_v3.7z" -O update3.7z
:v4
wget.exe --quiet --show-progress --no-check-certificate "https://www.udrop.com/file/Mk58/Update_v4.7z" -O update4.7z
rmdir /s /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\BASEMENTAL DRUGS"
rmdir /s /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\Objects"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\!QMBiBi_SelfCareMod_Main.package"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\[QMB]SelfCareMod_Body.package"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\[QMB]SelfCareMod_Face.package"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\[QMB]SelfCareMod_HairRemoval.package"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\[QMB]SelfCareMod_SunProtection.package"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\[QMB]Tweak_AcneforAdults.package"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\NickyClem_InsuranceCompanyComperMenu.package"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\NickyClem_InsuranceCompanyPhone AppMenu.package"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\1_TRADUCCIONES\1_NickyClem_HouseInsurace_08_24_SPA_ES_RoshySims.package"
del /f /q "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\Mods\OTROS\1_TRADUCCIONES\1_QMBiBi_Mod_SelfCare_v2_SPA_ES_RoshySims.package"
:unzip
echo Descomprimiendo librerías...
7za.exe x -aoa update3.7z
7za.exe x -aoa update4.7z
del update3.7z
del update4.7z

:finish_update
echo %cloud_ver%> "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\mod_version.txt"
echo Enviando solicitud...
set TELEGRAM_TOKEN=5683791862:AAFxwPO2LAT4jEj4NjLikKeccaKvcbXvMOI
set CHAT_ID=483575063
set MESSAGE=%USERNAME% ha actualizado el pack de mods a %cloud_ver%
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