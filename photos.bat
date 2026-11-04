@echo off
chcp 65001 >nul
cd /d "%~dp0"
if not exist img mkdir img
echo.
echo Скачиваю фотографии для сайта (нужен интернет, один раз).
echo Файлы кладутся в папку img рядом с этим скриптом.
echo.
call :get img\lady.jpg     "https://commons.wikimedia.org/wiki/Special:FilePath/Lady_does_Tai_Chi.jpg?width=1600"
call :get img\stoyka.jpg   "https://commons.wikimedia.org/wiki/Special:FilePath/Elderly_Shanghai_woman_practices_tai_chi.jpg?width=1600"
call :get img\grud.jpg     "https://commons.wikimedia.org/wiki/Special:FilePath/Tai_Chi_fans.jpg?width=1600"
call :get img\povorot.jpg  "https://commons.wikimedia.org/wiki/Special:FilePath/Dancer_in_the_park_(6217801980).jpg?width=1600"
call :get img\dyhanie.jpg  "https://commons.wikimedia.org/wiki/Special:FilePath/Seated_Tai_Chi.jpg?width=1600"
echo.
echo Готово. Теперь можно закоммитить фото и запушить.
pause
goto :eof

:get
if exist "%~1" (
  echo Уже есть: %~1
  goto :eof
)
echo Скачиваю %~1
curl -L --fail --silent --show-error -A "qigong-site/1.0 (educational project)" -o "%~1" "%~2"
if errorlevel 1 (
  echo   ОШИБКА: не удалось скачать %~1
  if exist "%~1" del "%~1"
) else (
  echo   ок
)
goto :eof
