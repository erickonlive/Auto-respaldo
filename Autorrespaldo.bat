@echo off
fn.dll cursor 0
CD D:\
mode con cols=40 lines=20
title RESPALDO USB
fn.dll sprite 19 25 13 "MDM CONTINENTAL"
:CHECK
fn.dll sleep 500
IF NOT EXIST d:\ fn.dll sprite 03 08 0A "Inserte una memoria USB"&goto check
IF %date:~3,2%==01 set mes=ENERO
IF %date:~3,2%==02 set mes=FEBRERO
IF %date:~3,2%==03 set mes=MARZO
IF %date:~3,2%==04 set mes=ABRIL
IF %date:~3,2%==05 set mes=MAYO
IF %date:~3,2%==06 set mes=JUNIO
IF %date:~3,2%==07 set mes=JULIO
IF %date:~3,2%==08 set mes=AGOSTO
IF %date:~3,2%==09 set mes=SEPTIEMBRE
IF %date:~3,2%==10 set mes=OCTUBRE
IF %date:~3,2%==11 set mes=NOVIEMBRE
IF %date:~3,2%==12 set mes=DICIEMBRE
:down
cls
fn.dll sprite 19 25 13 "MDM CONTINENTAL"
fn.DLL SPRITE 19 00 13 "%date:~0,2% DE %mes% DEL %DATE:~6,4%"
fn.dll sprite 00 03 0A "Ejecutando programa de respaldo..."
IF NOT EXIST D:\RESPALDOS\%DATE:~6,4% MD D:\RESPALDOS\%DATE:~6,4% >nul 2>nul
IF NOT EXIST D:\RESPALDOS\%DATE:~6,4%\%MES% MD E:\%DATE:~6,4%\%MES%
IF EXIST D:\RESPALDOS\%DATE:~6,4%\%MES%\"%date:~0,2% DE %mes%"\"%date:~0,2% DE %mes%.rar" (NIRCMD INFOBOX "YA HAY UN RESPALDO DE EL DIA %date:~0,2% DE %mes%~NCHECA QUE LA FECHA ESTE BIEN" "ERROR"&exit) ELSE  (MD D:\RESPALDOS\%DATE:~6,4%\%MES%\"%date:~0,2% DE %mes%" >nul 2>nul)
fn.dll sprite 08 5 0C "Creando archivo de respaldo 1/2"
"%programfiles%"\winrar\winrar.exe -ibck a -ed sis.rar sis\
fn.dll sprite 08 5 0C "Creando archivo de respaldo 2/2"
"%programfiles%"\winrar\winrar.exe -ibck a -ed sis.rar sis\fts2\
fn.dll sprite 09 15 0C "Finalizando..."
move sis.rar D:\RESPALDOS\%DATE:~6,4%\%MES%\"%date:~0,2% DE %mes%"\"%date:~0,2% DE %mes%.rar">nul 2>nul
fn.dll sprite 09 15 0A "Finalizado    "
fn.dll sleep 3000


cls
fn.dll sprite 09 02 0a "Subiendo archivo del %date:~0,2% de %mes%"
fn.dll sprite 10 02 0a "Esto puede tardar unos minutos"
D:\gdrive upload -r "D:\RESPALDOS\%DATE:~6,4%\%MES%\%date:~0,2% DE %mes%\%date:~0,2% DE %mes%.rar" -p "Google folder code"
fn.dll sprite 09 01 0C "El archivo a sido subido"
fn.dll sleep 3000
