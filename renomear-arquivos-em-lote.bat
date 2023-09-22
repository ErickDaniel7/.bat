@echo off
setlocal enabledelayedexpansion
set extensao=.txt
for %%f in (*%extensao%) do (
    set nome=%%~nf
    ren "%%f" "!nome!_novo%extensao%"
)
