::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHLcJ6wvhbZNN
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHPcS+Evte5FjwHhJ+A==
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHPcU71GqcI4otg==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD5GRQ++GGS5E7gZ5vzo082OtmUIVt4Id4Dz1bvDFfAX61HhZ6or32hJjPQFAhJMQiWkYSc7piBLtWvl
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
::ZQ05rAF9IAHYFVzEqQIHJxR8QwvCCXu+B6EZ+og=
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHGL4Ec8aC1dTw2DOGSpZg==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD5GRQ++GGS5E7gZ5vzo09+3hmwpcdADS6rv74TOCc4nz3fKVLoRwXVVkMQDMw5IehO/ax16rHZH1g==
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001>NUL
setlocal enabledelayedexpansion
title WooHoo Updater
mode con:cols=70 lines=15
IF EXIST "UPDATER_DATA" (
    GOTO UPDATER
) ELSE (
    GOTO INIT
)

:INIT
echo Parece que esta es la primera vez que ejecutas este programa.
echo LEE ATENTAMENTE
echo Pulsa 1 si es la primera vez que vas a jugar al Multijugador
echo Pulsa 2 si ya has jugado al menos UNA VEZ al Multijugador
choice /C 12 /N /M "Elige una opción >"
if %ErrorLevel%==1 goto FIRST_TIME
if %ErrorLevel%==2 goto PWN
:FIRST_TIME
cls
start /wait warning.vbs
ren "Los Sims 4" "Los Sims 4_gold"
echo Descargando librerías...
wget.exe --quiet --show-progress --no-check-certificate "https://www.udrop.com/file/MhB2/Full_Pack.7z" -O fullpack.7z
wget.exe --quiet --show-progress --no-check-certificate "https://www.udrop.com/file/MhBa/Update_v1.7z" -O update1.7z
wget.exe --quiet --show-progress --no-check-certificate "https://www.udrop.com/file/MhBb/Update_v2.7z" -O update2.7z
echo Descomprimiendo librerías...
7za.exe x -aoa -slt icons.7z
7za.exe x -aoa -slt fullpack.7z
7za.exe x -aoa -slt update1.7z
7za.exe x -aoa -slt update2.7z
del fullpack.7z
del update1.7z
del update2.7z
goto PWN
:PWN
cls
echo ESTE ARCHIVO ES NECESARIO PARA QUE EL ACTUALIZADOR DETECTE QUE LO HAS INICIADO ALGUNA VEZ, NO ELIMINAR O PODRÍAS PERDER TODOS TUS ARCHIVOS DE LOS SIMS 4 > UPDATER_DATA
echo v2> "%USERPROFILE%\Documents\Electronic Arts\Los Sims 4\mod_version.txt"
del icons.7z
goto UPDATER
:UPDATER
cls
echo Obteniendo datos...
wget --quiet --no-check-certificate "https://github.com/Hotel-Viciados/WooHoo-Updater/raw/main/updater/latest/updater.exe" -O updater.exe
echo Actualizador iniciado
start /wait updater.exe
del updater.exe
del .wget-hsts >nul
exit