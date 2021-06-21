@echo off

echo.
set /p idea_home=请输入 idea 地址：

echo.

set local=%~dp0

if not exist %idea_home%\app (
  echo.
  echo 不存在文件 %idea_home%\app
  pause >nul
  exit 0
)

if not exist %idea_home%\data (
  mkdir %idea_home%\data
)

rd /q %local%app >nul 2>&1
rd /q %local%data >nul 2>&1

mklink /h /j %local%app %idea_home%\app
mklink /h /j %local%data %idea_home%\data

pause >nul
