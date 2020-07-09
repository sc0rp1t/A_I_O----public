:: Batch file to sync Service Sheet folder from shared drive to local desktop
:: by TJK @02/20
:: 
:: updated @07/20
::
:: Longer version with multiple options for syncing
:: Use it with caution 

@echo off
TITLE Sync Service Sheets

set net_folder="\\headoffice\shared\Company Information\Installation & Operating\WI Service Visit Forms & Guides"
echo. 
echo This will sync changes from remote shared folder @ headoffice
echo To your local Computer 
echo "WI Service Visit Forms & Guides >>---> Local\folder" 
echo.
timeout /t 4

if exist %net_folder% (
    goto folder_choice
    ) else (
        goto warning
    )

:warning
echo Only to be run while connected to Company network
echo In the office or via VPN -- use 'CTRL+C' to cancel
echo.
pause
echo.
exit

:folder_choice
echo.
set cwd="%CD%"
echo Which folder would you like to Sync remote content to??
echo.
echo [1] -- Current working Folder 
echo [2] -- C:\WI_Service
echo [3] -- Folder on your Desktop
echo [4] -- Other
echo.
echo [5] -- Cancel/quit
echo.
choice /T 20 /D 1 /N /C:12345 /M "Select (1-5):"%1
if %ERRORLEVEL% ==1 goto ch1
if %ERRORLEVEL% ==2 goto ch2
if %ERRORLEVEL% ==3 goto ch3
if %ERRORLEVEL% ==4 goto ch4
if %ERRORLEVEL% ==5 goto end
if %ERRORLEVEL% ==255 goto ch255

:ch1
echo. 
echo Current working folder selected 
echo "%CD%"
set local_folder="%CD%"
goto sync

:ch2
echo. 
echo C:\WI_Service Selected
echo.
set local_folder=C:\WI_Service
goto sync

:ch3
echo. 
echo Folder on your Desktop will be created and selected for sync.
echo.
set local_folder=%UserProfile%\Desktop\service_sheets\
goto sync

:ch4
echo.
echo Please type a full path to the required folder:
echo -- you can use TAB completion :) -- ::
set /p local_folder=--:
goto sync

::set /p choice=Select (1-4):
::echo.
::if [%choice%]==[] goto warning1
::if [%choice%]==[1] goto
::if [%choice%]==[2] goto
::if [%choice%]==[3] goto
::if [%choice%]==[4] goto
::cls
:ch255
echo.
echo INCORRECT CHOICE, TRY AGAIN
timeout /t 3
goto %folder_choice%
pause



:sync
echo.
echo Syncing ...
echo Please be patient it can take a while. 
echo To cancel at any time hit 'CTRL+C'
echo.
xcopy /d /e /s /y %net_folder% %local_folder%
echo.
echo all done ...
echo.
timeout /t 5
goto end

:end
cls
echo. 
echo Nothing more to do here
echo This will now close 
echo Bye :)
echo .
timeout /t 3
exit