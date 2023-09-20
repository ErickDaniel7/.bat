@echo off

echo Limpando arquivos temporários...
del /s /q "C:\Windows\Temp\*.*"
del /s /q "C:\Users\PC-007\AppData\Local\Temp\*.*"
echo.

echo Excluindo arquivos de prefetch...
del /s /q "C:\Windows\Prefetch\*.*"
echo.

echo Desativando efeitos visuais...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo.

echo Desativando serviços desnecessários...
sc config "Fax" start= disabled
sc config "PrintSpooler" start= disabled
sc config "RemoteRegistry" start= disabled
echo.

echo Limpando cache DNS...
ipconfig /flushdns
echo.

echo Reiniciando serviço de Segurança do Windows...
net stop wscsvc
net start wscsvc
echo.

echo Realizando verificação de integridade do sistema...
sfc /scannow
echo.

echo Reiniciando serviço de Windows Update...
net stop wuauserv
net start wuauserv
echo.

echo Desativando inicialização automática de programas...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Skype" /t REG_BINARY /d 08000000000000000200000000000000000000000000000000000000000000000000000000000000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "OneDrive" /t REG_BINARY /d 08000000000000000200000000000000000000000000000000000000000000000000000000000000 /f
echo.

echo Realizando limpeza do registro...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Java Update" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Adobe Reader Speed Launcher" /f
echo.

echo Desligando serviços desnecessários...
net stop "AdobeARMservice"
net stop "AdobeFlashPlayerUpdateSvc"
net stop "Apple Mobile Device Service"
echo.

echo Desfragmentando unidades de disco...
defrag /C /H /V
echo.

echo Liberando espaço em disco...
cleanmgr /sagerun:1
echo.

echo Reiniciando serviço de Áudio...
net stop audiosrv
net start audiosrv
echo.

echo Reiniciando serviço de Impressão Spooler...
net stop spooler
net start spooler
echo.

echo Otimização de desempenho concluída.
pause
