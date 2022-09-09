@echo off
Color 0F
Title Snowman v1.0
:Menu
cls
echo.
echo Here are the options:
echo 1.Create a new file
echo 2.Edit an existing file
echo 3.Delete a file
echo 4.Open an existing file
echo 5.Exit
set /p option=
if %option%==1 goto create
if %option%==2 goto edit
if %option%==3 goto delete
if %option%==4 goto open
if %option%==5 exit

:edit
cls
echo Please type the title and extension below
set /p title=
if NOT exist %title% goto not
if exist %title% goto check22

:create
cls
echo Please type the title and extension below
set /p title=
if exist %title% goto exist
goto clear

:exist
echo The file: %title%, already exists. Do you want to edit it y/n?
set /p o=
if %o%==y goto check22
if %o%==Y goto check22
if %o%==n goto Menu
if %o%==N goto Menu

:check22
cls
echo.
type %title%
set /p code=
echo %code% >> %title%
goto check22

:clear
cls
goto create2

:create2
set /p code=
echo %code% >> %title%
goto create2

:open
echo Please type the file you want to open
set /p open=
if NOT exist %open% goto nope
if exist %open% goto check

:nope
echo ERROR: The file %open% does not exist or is not inside the folder with this file
pause
exit

:delete
set /p file=Name of the file to be deleted: 
if NOT exist %file%==goto not
if exist %file%==goto delete2

:delete2
del %file%
echo Delete Succesful!
pause
goto Menu

:not
echo ERROR: The file %file% does not exist or is not inside the folder with this file
pause
exit

:check
echo.
type %open%
echo.
pause
goto Menu