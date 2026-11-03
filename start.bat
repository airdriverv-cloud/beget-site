@echo off
cd /d "%~dp0"
if not exist img mkdir img
call :get img\lady.jpg "https://commons.wikimedia.org/wiki/Special:FilePath/Lady_does_Tai_Chi.jpg"
call :get img\stoyka.jpg "https://commons.wikimedia.org/wiki/Special:FilePath/Elderly_Shanghai_woman_practices_tai_chi.jpg"
call :get img\grud.jpg "https://commons.wikimedia.org/wiki/Special:FilePath/Tai_Chi_fans.jpg"
call :get img\povorot.jpg "https://commons.wikimedia.org/wiki/Special:FilePath/Dancer_in_the_park_(6217801980).jpg"
call :get img\dyhanie.jpg "https://commons.wikimedia.org/wiki/Special:FilePath/Seated_Tai_Chi.jpg"
echo.
echo Сайт: http://127.0.0.1:8080
echo Остановить сервер: Ctrl+C
echo.
where py >nul 2>&1 && py -m http.server 8080 && goto :eof
where python >nul 2>&1 && python -m http.server 8080 && goto :eof
echo Не найден Python. Установите Python 3 и запустите start.bat снова.
pause
goto :eof
:get
if exist %1 goto :eof
echo Скачиваю %1
curl -L -A "qigong-site/1.0" -o %1 %2
goto :eof
