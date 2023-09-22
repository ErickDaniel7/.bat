@echo off
set pasta=C:\Caminho\Para\Os\Arquivos
set zip=C:\Caminho\Para\Arquivo.zip
powershell Compress-Archive -Path %pasta% -DestinationPath %zip%
