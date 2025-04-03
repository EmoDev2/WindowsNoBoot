@echo off
:: Script de personalización de arranque y fondo de inicio

:: Verificar permisos administrativos
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Por favor, ejecuta este script como administrador.
    pause
    exit /b
)

:: Parte 1: Personalizar el fondo de inicio de sesión
echo Reemplazando el fondo de inicio de sesión...
mkdir "C:\Windows\System32\oobe\info\backgrounds" >nul 2>&1
if exist "C:\Users\Gabriel\Downloads\56f3087dc453b0393a485a7ba92665fe08267d66.png" (
    copy "C:\Users\Gabriel\Downloads\56f3087dc453b0393a485a7ba92665fe08267d66.png" "C:\Windows\System32\oobe\info\backgrounds\backgroundDefault.jpg" >nul
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /v OEMBackground /t REG_DWORD /d 1 /f >nul
    echo Fondo de inicio de sesión configurado correctamente.
) else (
    echo Error: No se encontró el archivo de imagen en la ubicación especificada.
    pause
    exit /b
)

:: Parte 2: Modificación de bootres.dll
echo Instrucciones para modificar el arranque manualmente:
echo 1. Abre "C:\Windows\System32\bootres.dll" con una herramienta como Resource Hacker o 7-Zip.
echo 2. Reemplaza las imágenes de arranque por la imagen que deseas mostrar.
echo 3. Guarda el archivo modificado y reemplaza el original en la carpeta "C:\Windows\System32\".
echo Asegúrate de realizar una copia de seguridad antes de realizar cambios.

:: Parte 3: Desactivar la reparación automática de Windows
echo Desactivando la reparación automática y errores de arranque...
bcdedit /set {current} recoveryenabled no >nul
bcdedit /set {current} bootstatuspolicy ignoreallfailures >nul
echo Reparación automática desactivada.

:: Fin del script
echo Personalización completada.
pause
