@echo off
tasklist | find "nome-do-programa.exe" > nul
if errorlevel 1 (
    echo O programa não está em execução.
) else (
    echo O programa está em execução.
)
