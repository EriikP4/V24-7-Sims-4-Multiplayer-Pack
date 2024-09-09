@echo off
chcp 65001>NUL
setlocal enabledelayedexpansion
title WooHoo Updater
mode con: cols=67 lines=28
echo                                ####                         
echo                                ##++##                       
echo                                 #++++#                      
echo                                ##++++##              ##     
echo                                 ##+++##             ##+#    
echo            ##                  ######    #######  ##++##  
echo           ##+#       ##########        ##+-..--+####++++# 
echo           ##+++#######--.---+###########+-+#+..--####++++#
echo           ##+++++###+-...##-#+##+++#########+-..-#++#++++#
echo           ##+++#####+..--##+#+-#+--+++##--+-...-+#++#+++##
echo            ##+###++##--..--#-.-#+--+##+#+------+#-+#++### 
echo             ####+#++#+---....--#--++#+#########+--######  
echo              ###+++++##+------##+++++#+##++++++++++++###  
echo         #### ####++++++#######+++#+++#+++#++++++++++###   
echo        ##++######+++######+++++#+###+++++##++++++#####   
echo         ##+++######+####+++#####+++++++++++########+##   
echo          ##+++###########+++++++++++++-++++++++++++##    
echo           #+++++#########++++++#++--+---+###++++++##     
echo            ###########+++++++++#####++######+--++##      
echo                 #######+++++++-############---++##       
echo                   ######++++----####++++##+--+###        
echo                     ####+++++----####+++#+--+##          
echo                        ####+------+#####---###           
echo                           ####-----------+##             
echo                              ####+------###              
echo                                  ####+###                
echo                                      ##                  
timeout 2 >nul
cls
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
del installer.exe
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