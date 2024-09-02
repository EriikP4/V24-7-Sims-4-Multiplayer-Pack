::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHLcJ6wvhbZNN
::fBE1pAF6MU+EWHreyHcjLQlHcCGQNWCGIrof/eX+4f6UnngtcMMLXb3nwL2eHPcU71GqcI4otg==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD5GRQ++GGS5E7gZ5vzo09+3hmwpcdADT4DU8ruBbukQ5SU=
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
::cxY6rQJ7JhzQF1fEqQJhZksaHErQXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXrZg==
::ZQ05rAF9IAHYFVzEqQIGek8ZG0SxNWapRoAM7Onv6vjn
::eg0/rx1wNQPfEVWB+kM9LVsJDBSDNm6oCaZR/fj/7v6CsC0=
::fBEirQZwNQPfEVWB+kM9LVsJDBONM2O1CdU=
::cRolqwZ3JBvQF1fEqQIRKw9BTQiLJmq+Cadc5+7y7OOGrg0ZUaISd4vImrCLYNZBvgqzFQ==
::dhA7uBVwLU+EWHGL4Ec8aC1dTw2DOGSpZg==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD5GRQ++GGS5E7gZ5vzo09+3hmwpcdADb4DU0ruBH/UD7kTwcIRj02Jf+A==
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
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
wget --quiet --no-check-certificate "warning url here" -O warning.vbs
start /wait warning.vbs
echo Descargando librerías...
wget --quiet --no-check-certificate "full pack url here" -O fullpack.7z
echo Descomprimiendo librerías...
7za.exe x -y fullpack.7z
del fullpack.7z
goto PWN
:PWN
cls
echo ESTE ARCHIVO ES NECESARIO PARA QUE EL ACTUALIZADOR DETECTE QUE LO HAS INICIADO ALGUNA VEZ, NO ELIMINAR O PODRÍAS PERDER TODOS TUS ARCHIVOS DE LOS SIMS 4 > UPDATER_DATA
goto UPDATER
:UPDATER
cls
echo Obteniendo versiones...
wget --quiet --no-check-certificate "updater url here" -O updater.bat
start updater.bat && exit