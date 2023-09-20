@echo off
echo Informações do PC:
echo.
echo Nome do computador: %COMPUTERNAME%
echo Sistema operacional: %OS%
echo Arquitetura do processador: %PROCESSOR_ARCHITECTURE%
echo Número de processadores: %NUMBER_OF_PROCESSORS%
echo.
echo Informações de rede:
echo.
ipconfig | findstr /i "IPv4"
echo.
echo Informações do sistema:
echo.
systeminfo | findstr /B /C:"Nome do sistema operacional:" /C:"Fabricante do sistema:" /C:"Modelo do sistema:" /C:"Tipo de sistema:" /C:"Memória física disponível para sistema:"
echo.
echo Informações do usuário:
echo.
echo Nome do usuário: %USERNAME%
echo Pasta do usuário: %USERPROFILE%
echo.
echo Lista de programas instalados:
echo.
wmic product get name, version
echo.
echo Lista de processos em execução:
echo.
tasklist
pause >nul
