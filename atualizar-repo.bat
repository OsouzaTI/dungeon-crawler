@echo off
set /p mensagem=Digite a mensagem de commit: 
git add .
git commit -m "%mensagem%"
git push -u origin main