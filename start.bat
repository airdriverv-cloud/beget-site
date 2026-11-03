@echo off
cd /d "%~dp0"
echo.
echo Сайт: http://127.0.0.1:8080
echo Остановить сервер: Ctrl+C
echo.
where py >nul 2>&1 && py -m http.server 8080 && goto :eof
where python >nul 2>&1 && python -m http.server 8080 && goto :eof
echo Не найден Python. Установите Python 3 и запустите start.bat снова.
pause
