::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHLcJ6wvhbZNN
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHPcU71GqcI4otg==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD5GRQ++GGS5E7gZ5vzo082OtmUIVt4JKtuWjfm9Ke0ApxGpWIMhwnNKlMoVCQkVThOoZTMyoHxRoluMOc6IjzjuRWCG6QU5GGoU
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
::cxY6rQJ7JhzQF1fEqQJhZkkaH0rTXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlDMbiXpZg==
::ZQ05rAF9IAHYFVzEqQIHJxR8QwvCEWq0B7IZ+og=
::eg0/rx1wNQPfEVWB+kM9LVsJDBONM2O1CYoJ+Oz6+++Vwg==
::fBEirQZwNQPfEVWB+kM9LVsJDBLQaDyFC7oY+On45NWSskkcQOctGA==
::cRolqwZ3JBvQF1fEqQIRKw9BTQiLJmq+Cadc7O274uWDsQ0SUus8cY7XmrCLYNZeuBGrIvY=
::dhA7uBVwLU+EWHGL4Ec8aC1dTw2DOGSpZg==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001>NUL
IF EXIST "UPDATER_DATA" (
    GOTO UPDATER
) ELSE (
    GOTO INIT
)

:INIT
echo Parece que esta es la primera vez que ejecutas este programa.
echo ¡¡LEE ATENTAMENTE!!
echo Pulsa 1 si es la primera vez que vas a jugar al Multijugador
echo Pulsa 2 si ya has jugado al menos UNA VEZ al Multijugador
choice /C SN /N /M "1/2 >"
if %ErrorLevel%==1 goto FIRST_TIME
if %ErrorLevel%==2 goto PWN
:FIRST_TIME
cls
wget --quiet --no-check-certificate "https://raw.githubusercontent.com/EriikP4/WooHoo-Updater/main/first_init/warning.vbs" -O warning.vbs
start /wait warning.vbs
echo Descargando librerías...
wget --quiet --no-check-certificate "https://www.udrop.com/file/MhB2/Full_Pack.7z" -O fullpack.7z
wget --quiet --no-check-certificate "https://www.udrop.com/file/MhBa/Update_v1.7z" -O update1.7z
wget --quiet --no-check-certificate "https://www.udrop.com/file/MhBb/Update_v2.7z" -O update2.7z
echo Descomprimiendo librerías...
7za.exe x -y fullpack.7z
7za.exe x -y update1.7z
7za.exe x -y update2.7z
echo v2 > "%USERPROFILE%\Electronic Arts\Los Sims 4\mod_version.txt"
del fullpack.7z
del update1.7z
del update2.7z
goto PWN
:PWN
cls
echo ESTE ARCHIVO ES NECESARIO PARA QUE EL ACTUALIZADOR DETECTE QUE LO HAS INICIADO ALGUNA VEZ, NO ELIMINAR O PODRÍAS PERDER TODOS TUS ARCHIVOS DE LOS SIMS 4 > UPDATER_DATA
goto UPDATER
:UPDATER
cls
echo Obteniendo versiones...
wget --quiet --no-check-certificate "updater url here" -O updater.bat
wget --quiet --no-check-certificate "version url here" -O version.txt
echo Actualizador iniciado
start /wait updater.exe
exit