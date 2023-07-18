@echo off
color 0a
cd ..
echo BUILDING GAME
haxelib run lime build android -release
echo.
echo done.
pause