@echo off
:menu1
del /s /f discosduros85.txt
del /s /f restaurardisco85.txt 
mode con cols=85 lines=50
title RME - USB v2.0 By J.Calvo  PC: %computername%   Usuario: %username% 
cls
color F
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::
echo     RESTAURADOR DE MEMORIAS EXTRAIBLES USB v2.0  
echo     By JCalvo
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
echo Inserte su memoria USB y presione cualquier tecla para continuar.
echo.
echo.
echo.
pause
cls
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::
echo     RESTAURADOR DE MEMORIAS EXTRAIBLES USB v2.0  
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo 1- Restaurar memoria extraible USB (Modo Rapido)
echo.
echo 2- Restaurar memoria extraible USB (Modo Lento)
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo 3- Limpiar USB 
echo.
echo Si no funciona la opcion 1 o 2, ejecutar la opcion 3
echo y luego volver a ejecutar la opcion 1 o 2.
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo 4- Salir
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::
set /p "calvo=>"

if %calvo%== 1 goto restusbr
if %calvo%== 2 goto restusbl
if %calvo%== 3 goto limusb
if %calvo%== 4 goto salir

if not %calvo% == 1 goto error
if not %calvo% == 2 goto error
if not %calvo% == 3 goto error
if not %calvo% == 4 goto error

:limusb
cls
echo list volume >>  discosduros85.txt
echo list disk >> discosduros85.txt
@echo on
diskpart -s discosduros85.txt
@echo off
echo.
echo.
echo.
echo :::::: LIMPIAR USB ::::::
echo.
echo.
echo IMPORTANTE: El numero 0 suele ser el disco local C:
echo.
echo Numero del Disco?
echo.
set /p "numdisc=>"
echo.
echo.
echo La unidad de memoria seleccionada perdera todos los archivos y carpetas que contiene.
echo.
echo. Compruebe que a rellenado bien los campos y no hay ninguna equivocacion.
echo.
echo Seguro que quiere seguir con el proceso (si/no)?
echo.
set /p "preg=>"

if %preg% == si goto limini
if %preg% == no goto no1 
if %preg% == s goto limini
if %preg% == n goto no1 
if %preg% == Si goto limini
if %preg% == No goto no1

if not %preg% == si goto error
if not %preg% == no goto error
if not %preg% == s goto error
if not %preg% == n goto error
if not %preg% == Si goto error
if not %preg% == No goto error

:limini
cls
echo.
echo :::::: INICIANDO LIMPIEZA USB ::::::
echo.
echo.
ping localhost -n 3 >nul
echo.
echo list disk >> restaurardisco85.txt
echo select disk %numdisc% >> restaurardisco85.txt
echo clean >> restaurardisco85.txt
echo.
diskpart -s restaurardisco85.txt
echo.
cls
echo.
echo :::::: LIMPIEZA USB FINALIZADA CON EXITO ::::::
echo.
ping localhost -n 3 >nul
del /s /f discosduros85.txt
del /s /f restaurardisco85.txt 
goto salir

:restusbl
cls
echo list volume >>  discosduros85.txt
echo list disk >> discosduros85.txt
@echo on
diskpart -s discosduros85.txt
@echo off
echo.
echo.
echo.
echo :::::: RESTAURACION MODO LENTO ::::::
echo.
echo.
echo IMPORTANTE: El numero 0 suele ser el disco local C:
echo.
echo Numero del Disco?
echo.
set /p "numdisc=>"
echo.
echo Formato de la memoria (FAT32/NTFS)?
echo.
set /p "formdisc=>"
echo.
echo Nombre que desea asignar a la unidad?
echo.
set /p "nomusb=>"
echo.
echo IMPORTANTE: La letra C es la que suele estar asignada al disco local.
echo y la letra D suele estar asignada al CD-ROM/DVD.
echo.
echo Letra que quiere asignarle a la unidad de memoria?
echo.
set /p "letmemor=>"
echo.
echo.
echo La unidad de memoria seleccionada perdera todos los archivos y carpetas que contiene.
echo.
echo. Compruebe que a rellenado bien los campos y no hay ninguna equivocacion.
echo.
echo Seguro que quiere seguir con el proceso (si/no)?
echo.
set /p "preg=>"

if %preg% == si goto resini
if %preg% == no goto no1 
if %preg% == s goto resini
if %preg% == n goto no1 
if %preg% == Si goto resini
if %preg% == No goto no1

if not %preg% == si goto error
if not %preg% == no goto error
if not %preg% == s goto error
if not %preg% == n goto error
if not %preg% == Si goto error
if not %preg% == No goto error

:resini
cls
echo.
echo :::::: INICIANDO RESTAURACION ::::::
echo.
echo.
ping localhost -n 3 >nul
echo.
echo list disk >> restaurardisco85.txt
echo select disk %numdisc% >> restaurardisco85.txt
echo clean >> restaurardisco85.txt
echo create partition primary >> restaurardisco85.txt
echo select partition 1 >> restaurardisco85.txt
echo active >> restaurardisco85.txt
echo format fs=%formdisc% label="%nomusb%" >> restaurardisco85.txt
echo assign letter="%letmemor%" >> restaurardisco85.txt
echo exit >> restaurardisco85.txt
echo.
diskpart -s restaurardisco85.txt
echo.
cls
echo.
echo :::::: RESTAURACION FINALIZADA CON EXITO ::::::
echo.
ping localhost -n 3 >nul
del /s /f discosduros85.txt
del /s /f restaurardisco85.txt 
goto salir

:restusbr
cls
echo list volume >>  discosduros85.txt
echo list disk >> discosduros85.txt
@echo on
diskpart -s discosduros85.txt
@echo off
echo.
echo.
echo.
echo :::::: RESTAURACION MODO RAPIDO ::::::
echo.
echo.
echo IMPORTANTE: El numero 0 suele ser el disco local C:
echo.
echo Numero del Disco?
echo.
set /p "numdisc=>"
echo.
echo Formato de la memoria (FAT32/NTFS)?
echo.
set /p "formdisc=>"
echo.
echo Nombre que desea asignar a la unidad?
echo.
set /p "nomusb=>"
echo.
echo IMPORTANTE: La letra C es la que suele estar asignada al disco local.
echo y la letra D suele estar asignada al CD-ROM/DVD.
echo.
echo Letra que quiere asignarle a la unidad de memoria?
echo.
set /p "letmemor=>"
echo.
echo.
echo La unidad de memoria seleccionada perdera todos los archivos y carpetas que contiene.
echo.
echo Compruebe que a rellenado bien los campos y no hay ninguna equivocacion.
echo.
echo Seguro que quiere seguir con el proceso (si/no)?
echo.
set /p "preg=>"

if %preg% == si goto resinir
if %preg% == no goto no1 
if %preg% == s goto resinir
if %preg% == n goto no1 
if %preg% == Si goto resinir
if %preg% == No goto no1

if not %preg% == si goto error
if not %preg% == no goto error
if not %preg% == s goto error
if not %preg% == n goto error
if not %preg% == Si goto error
if not %preg% == No goto error


:resinir
cls
echo.
echo :::::: INICIANDO RESTAURACION ::::::
echo.
echo.
ping localhost -n 3 >nul
echo.
echo list disk >> restaurardisco85.txt
echo select disk %numdisc% >> restaurardisco85.txt
echo clean >> restaurardisco85.txt
echo create partition primary >> restaurardisco85.txt
echo select partition 1 >> restaurardisco85.txt
echo active >> restaurardisco85.txt
echo format fs=%formdisc% label="%nomusb%" quick >> restaurardisco85.txt
echo assign letter="%letmemor%" >> restaurardisco85.txt
echo exit >> restaurardisco85.txt
echo.
diskpart -s restaurardisco85.txt
echo.
cls
echo.
echo :::::: RESTAURACION FINALIZADA CON EXITO ::::::
echo.
ping localhost -n 3 >nul
del /s /f discosduros85.txt
del /s /f restaurardisco85.txt 
goto salir

:error
cls
echo.
echo ERROR
echo.
ping localhost -n 2 >nul
goto menu1

:no1
cls
echo.
echo ACCION CANCELADA
echo.
ping localhost -n 2 >nul
goto menu1

:salir
cls
echo.
echo Bye bye %username%
echo.
ping localhost -n 3 >nul
exit

end
