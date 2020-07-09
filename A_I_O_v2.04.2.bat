:: All In One batch file mainly used for Astro Xray Machines
:: by TJK 
:: update 07/07/20
::  - added diag data clean 
::  - cleanup for the code 
::  - some other fixes 
::

cls
@echo off
TITLE %~n0
MODE CON: LINES=43 COLS=130

:: set global variables

set diagnostic="%ProgramFiles%\DiagDoc\AstroDiagnostic.exe"
set xkeys="%ProgramFiles%\Xray Client\XKeys.exe"
set IOcontrol="%ProgramFiles%\Xray Client\IOcontrol.exe"
set shutd="%ProgramFiles%\Xray Client\Shutdown.exe"
set xrayc="%ProgramFiles%\Xray Client\XrayClient.exe"
set xray_F="%ProgramFiles%\Xray Client"
set diag_F="%ProgramFiles%\DiagDoc"
set diag_data_F="%ProgramFiles%\DiagDoc\DataLog"
set Second_F="%ProgramFiles%\Secondview"
set max_data_F="C:\Documents and Settings\All Users\Application Data\National Instruments\MAX\Data\"
set max_data_dic="C:\Documents and Settings\All Users\Application Data\National Instruments\MAX\Data Dictionaries\"
set startfolder="C:\Documents and Settings\Astrophysics Inc\Start Menu\Programs\Startup"
set service_log="C:\WI_Service\service_log.log"
set service_F="C:\WI_Service\"

if exist "%service_F%" (
	goto start
	) else (
    goto pre_start
    )

:pre_start
cls
color 0C
echo.
echo %service_F% doesn't exist !!
echo.
set /p Q1=Would you like to create this folder ? (Y/N) : 
if /I [%Q1%]==[Y] goto Q1_y
if /I [%Q1%]==[N] goto Q1_n
if /I [%Q1%]==[] goto pre_start

cls
echo.
echo INCORRECT CHOICE, TRY AGAIN !!
timeout /t 3
goto pre_start
echo.

:Q1_y
mkdir "%service_F%"
	echo ^<^<-- service_log created @ %date_now% by A_I_O --------------------  >> %service_log%
	echo -------------------------------------------------------------------^>^> >> %service_log%
	echo Folder { %service_F% } has been created
	echo.
	copy %0 %service_F%\
	pause
	cd %service_F%
	CALL %%0
	exit

:Q1_n
goto start


:start
cls
echo.
color 0A
echo.
echo 				  __   __    __      __  __ _     __   __ _  ____
echo 				 / _\ (  )  (  )    (  )(  ( \   /  \ (  ( \(  __)
echo 				/    \/ (_/\/ (_/\   )( /    /  (  O )/    / ) _)
echo 				\_/\_/\____/\____/  (__)\_)__)   \__/ \_)__)(____)			enjoy :)
echo.
echo                  oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
echo                oo------------------------------------------------------------------------oo
echo               oo                                                                          oo
echo               oo   [1]  Change network settings                                           oo
echo               oo   [2]  Clean SQL Log file "Shrink database log master"                   oo
echo               oo   [3]  Kill Tasks                                                        oo
echo               oo   [4]  Start Tasks                                                       oo
echo               oo   [5}  File backup options                                               oo
echo               oo   [6]  Delay Start to startup folder                                     oo
echo               oo   [7]  Archive Cleaning Utility to startup folder (35 days)              oo
echo               oo   [8]  No communication patch                                            oo
echo               oo   [9]  Rename xray client folder                                         oo
echo               oo   [10] Restore Admin password to default (1111)                          oo  IoooooooooooooooooI
echo               oo   [11] Clean Diagnostics Log files                                       oo  Ioooo A_I_O.BAT ooI
echo               oo   [12] Lite.tbl replacement                                              oo  Iooo created oooooI
echo               oo   [--]                                                                   oo  Ioooo by oooooooooI
echo               oo                                                                          oo  Ioooo   TOM   ooooI
echo               oo   [97] Update Service Log                                                oo  IoooooooooooooooooI
echo               oo   [98] Reboot / Logout from Windows                                      oo  Ioooooooooov2.04ooI
echo               oo   [99] Quit                                                              oo  TTT     TTT     TTT
echo   OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
echo   OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
echo   OO          OO               OOOO                OOOO                OOOO               OO          OO          OO
echo.
echo                         Today is %currentdate%
echo.
echo.
set /p choice=:                  Please choose required option 1-99: 
echo.
echo.
if [%choice%]==[99] goto quit
if [%choice%]==[] goto done
if [%choice%]==[1] goto Network
if [%choice%]==[2] goto Clean_sql
if [%choice%]==[3] goto Kill_tasks
if [%choice%]==[4] goto Start_tasks
if [%choice%]==[5] goto Backup_opt
if [%choice%]==[6] goto Delay_start
if [%choice%]==[7] goto Archive_clean
if [%choice%]==[8] goto No_comm
if [%choice%]==[9] goto Rename_xray
if [%choice%]==[10] goto Restore_pass
if [%choice%]==[11] goto Diag_Clean
if [%choice%]==[12] goto Light_tbl
if [%choice%]==[13] goto Boom
if [%choice%]==[14] goto done
if [%choice%]==[15] goto Future1
if [%choice%]==[16] goto Future2
if [%choice%]==[97] goto Service_log
if [%choice%]==[98] goto Reboot_logout
if [%choice%]==[66] goto extra1
cls
echo.
echo INCORRECT CHOICE, TRY AGAIN
goto done
echo.


:Network
cls
echo.
color 0A
echo.
echo 				  __   __    __      __  __ _     __   __ _  ____
echo 				 / _\ (  )  (  )    (  )(  ( \   /  \ (  ( \(  __)
echo 				/    \/ (_/\/ (_/\   )( /    /  (  O )/    / ) _)
echo 				\_/\_/\____/\____/  (__)\_)__)   \__/ \_)__)(____)			enjoy :)
echo.
echo "             _  _  ____  ____  _    _  _____  ____  _  _    ___  ____  ____  ____  _  _  ___  ___                 "
echo "            ( \( )( ___)(_  _)( \/\/ )(  _  )(  _ \( )/ )  / __)( ___)(_  _)(_  _)( \( )/ __)/ __)                "
echo "             )  (  )__)   )(   )    (  )(_)(  )   / )  (   \__ \ )__)   )(   _)(_  )  (( (_-.\__ \                "
echo "            (_)\_)(____) (__) (__/\__)(_____)(_)\_)(_)\_)  (___/(____) (__) (____)(_)\_)\___/(___/                "
echo.
echo                 oo......................................................................oo
echo               oo                                                                          oo
echo               oo   [1]  Change network to static IP address, mask, and DNS Server(s)      oo
echo               oo   [2]  Change network to DHCP network configuration                      oo
echo               oo   [3]  Change network to MASTER configuration                            oo
echo               oo   [4]  Change network to SLAVE configuration                             oo
echo               oo                                                                          oo
echo               oo   [5]  Go back to main screen                                            oo
echo                 oo......................................................................oo
echo.
echo.
echo.
set /p network_set=:                  Please choose required option 1-5: 
if [%network_set%]==[1] goto Static
if [%network_set%]==[2] goto DHCP
if [%network_set%]==[3] goto MASTER
if [%network_set%]==[4] goto SLAVE
if [%network_set%]==[5] goto done
if [%network_set%]==[] goto Network
cls
echo.
echo INCORRECT CHOICE, TRY AGAIN
goto Network
echo.


:Static
cls
color 1F
:: *User input IP Address, Subnet Mask, and Gateway Addresses*
echo.
set /P Addy=IP Address:
set /P Sub_Mask=Subnet Mask:
set /P GW=Gateway IP Address:

:: *Get DNS Servers*
set /P DNS_1=Primary DNS Server:
set /P DNS_2=Secondary DNS Server:

:: *Set IP, Subnet Mask, and Gateway Addresses*
netsh interface ip set address "Local Area Connection" static %Addy% %Sub_Mask% %GW% 1

:: *Set DNS Server IP Addresses*
netsh interface ip delete dns "Local Area Connection" all
if not [%DNS_1%]==[] netsh interface ip set dns "Local Area Connection" static %DNS_1%
if not [%DNS_2%]==[] netsh interface ip add dns "Local Area Connection" %DNS_2% index=2
echo.
netsh interface ip show config
echo.
goto done


:DHCP
cls
color 1F
echo.
@echo Setting up Local Area Connection for DHCP Configuration
netsh interface ip set address "Local Area Connection" source=dhcp
netsh interface ip set dns "Local Area Connection" source=dhcp
echo.
ipconfig
echo.
goto done


:MASTER
cls
color 1F
echo.
echo 192.168.1.250
netsh interface ip delete dns "Local Area Connection" all
netsh interface ip set address "Local Area Connection" static 192.168.1.250 255.255.255.0 192.168.1.1 1
netsh interface ip show config
echo.
goto done


:SLAVE
cls
color 1F
echo.
echo 192.168.1.251
netsh interface ip delete dns "Local Area Connection" all
netsh interface ip set address "Local Area Connection" static 192.168.1.250 255.255.255.0 192.168.1.1 1
netsh interface ip show config
echo.
goto done


:Clean_sql
cls
color 4F
echo.
echo Clean SQL LOG file
PAUSE
echo USE astrophysicsdatabase>resetlog.sql
echo GO>>resetlog.sql
echo.>>resetlog.sql
echo ALTER DATABASE astrophysicsdatabase>>resetlog.sql
echo SET RECOVERY SIMPLE;>>resetlog.sql
echo GO>>resetlog.sql
echo.>>resetlog.sql
echo DBCC SHRINKFILE (tip_log, 1);>>resetlog.sql
echo GO>>resetlog.sql
echo.>>resetlog.sql
echo ALTER DATABASE astrophysicsdatabase>>resetlog.sql
echo SET RECOVERY FULL;>>resetlog.sql
echo GO>>resetlog.sql
echo.>>resetlog.sql
echo.
PAUSE
"%ProgramFiles%\Microsoft SQL Server\80\Tools\Binn\osql" -E -i resetlog.sql
echo.
PAUSE
del resetlog.sql
goto done


:Kill_tasks
cls
color 4F
echo.
echo Killing TASKS
PAUSE
echo.
TASKKILL /F /IM AstroDiagnostic.exe
TASKKILL /F /IM DAQBoard.exe
TASKKILL /F /IM xkeys.exe
TASKKILL /F /IM IOcontrol.exe
TASKKILL /F /IM shutdown.exe
TASKKILL /F /IM 200KVDV.exe
echo.
goto done


:Start_tasks
cls
color 2F
echo.
echo Starting TASKS
echo.
tasklist /nh /fi "imagename eq xkeys.exe" | find /i "xkeys.exe" > nul ||(start "Xkeys" %xkeys% /D "%ProgramFiles%\Xray Client")
tasklist /nh /fi "imagename eq IOcontrol.exe" | find /i "IOcontrol.exe" > nul ||(start "IOcontrol" %IOcontrol% /D "%ProgramFile%\Xray Client")
tasklist /nh /fi "imagename eq AstroDiagnostic.exe" | find /i "AstroDiagnostic.exe" > nul ||(start "AstroDiag.vi" %diagnostic% /D "%ProgramFiles%\DiagDoc\")
tasklist /nh /fi "imagename eq Shutdown.exe" | find /i "Shutdown.exe" > nul ||(start "Shutdown" %shutd% /D "%ProgramFiles%\Xray Client")
echo.
goto done


:Backup_opt
cls
echo.
color 0A
echo.
echo 				  __   __    __      __  __ _     __   __ _  ____
echo 				 / _\ (  )  (  )    (  )(  ( \   /  \ (  ( \(  __)
echo 				/    \/ (_/\/ (_/\   )( /    /  (  O )/    / ) _)
echo 				\_/\_/\____/\____/  (__)\_)__)   \__/ \_)__)(____)			enjoy :)        
echo.
echo "                ____    __    ___  _  _  __  __  ____    _____  ____  ____  ____  _____  _  _  ___                "
echo "               (  _ \  /__\  / __)( )/ )(  )(  )(  _ \  (  _  )(  _ \(_  _)(_  _)(  _  )( \( )/ __)               "
echo "                ) _ < /(__)\( (__  )  (  )(__)(  )___/   )(_)(  )___/  )(   _)(_  )(_)(  )  ( \__ \               "
echo "               (____/(__)(__)\___)(_)\_)(______)(__)    (_____)(__)   (__) (____)(_____)(_)\_)(___/               "
echo.
echo                 oo......................................................................oo
echo               oo                                                                          oo
echo               oo   [1}  File backup on Master                                             oo
echo               oo   [2]  File backup on Slave                                              oo
echo               oo   [3]  File backup on Single View                                        oo
echo               oo                                                                          oo
echo               oo   [5]  Go back to main screen                                            oo
echo                 oo......................................................................oo
echo.
echo.
echo.
set /p back_opt=:                  Please choose required option 1-5: 
if [%back_opt%]==[1] goto Backup_master
if [%back_opt%]==[2] goto Backup_slave
if [%back_opt%]==[3] goto Backup_single
if [%back_opt%]==[4] goto Backup_opt
if [%back_opt%]==[5] goto done
if [%back_opt%]==[] goto Backup_opt
cls
echo.
echo INCORRECT CHOICE, TRY AGAIN
goto Backup_opt
echo.


:Backup_master
cls
color 2F
echo.
echo Backup files. Please create a folder for the backup
PAUSE
echo.
set /P Back_Dir=Site Name:
mkdir %Back_Dir%_Master
mkdir %Back_Dir%_Master\DiagDoc
mkdir "%Back_Dir%_Master\Xray Client"
set diag_F_B="%Back_Dir%_Master\DiagDoc"
set xray_F_B="%Back_Dir%_Master\Xray Client"
echo archive raw\>exclude.txt
echo Archive CBT\>>exclude.txt
echo archive rgb\>>exclude.txt
xcopy %diag_F% %diag_F_B% /S /W /I /H
xcopy %xray_F% %xray_F_B% /S /W /I /H /EXCLUDE:exclude.txt
xcopy "%xray_F%\runtime.ini" %Back_Dir%_Master\BACK_runtime_%date:~7,2%%date:~-10,2%%date:~-4,4%.ini /Y /I
echo.
PAUSE
del exclude.txt
goto done


:Backup_slave
cls
color 2F
echo.
echo Backup files. Please create a folder for the backup
echo To be run on Slave PC
PAUSE
echo.
set /P Back_Dir=Site Name:
mkdir %Back_Dir%_Slave
mkdir %Back_Dir%_Slave\DiagDoc
mkdir "%Back_Dir%_Slave\Xray Client"
mkdir %Back_Dir%_Slave\Secondview
set diag_F_B="%Back_Dir%_Slave\DiagDoc"
set xray_F_B="%Back_Dir%_Slave\Xray Client"
set second_F_B="Back_Dir%_Slave\Secondview"
echo archive raw\>exclude.txt
echo Archive CBT\>>exclude.txt
echo archive rgb\>>exclude.txt
xcopy %diag_F% %diag_F_B% /S /W /I /H
xcopy %xray_F% %xray_F_B% /S /W /I /H /EXCLUDE:exclude.txt
xcopy %Second_F% %Second_F_B% /S /W /I /H
xcopy "%xray_F%\runtime.ini" %Back_Dir%_Slave\BACK_runtime_%date:~7,2%%date:~-10,2%%date:~-4,4%.ini /Y /I
echo.
PAUSE
del exclude.txt
goto done


:Backup_single
cls
color 2F
echo.
echo Backup files. Please create a folder for the backup
PAUSE
echo.
set /P Back_Dir=Site Name:
mkdir %Back_Dir%
mkdir %Back_Dir%\DiagDoc
mkdir "%Back_Dir%\Xray Client"
set diag_F_B="%Back_Dir%\DiagDoc"
set xray_F_B="%Back_Dir%\Xray Client"
echo archive raw\>exclude.txt
echo Archive CBT\>>exclude.txt
echo archive rgb\>>exclude.txt
xcopy %diag_F% %diag_F_B% /S /W /I /H
xcopy %xray_F% %xray_F_B% /S /W /I /H /EXCLUDE:exclude.txt
xcopy "%xray_F%\runtime.ini" %Back_Dir%\BACK_runtime_%date:~7,2%%date:~-10,2%%date:~-4,4%.ini /Y /I
echo.
PAUSE
del exclude.txt
goto done


:Delay_start
cls
echo.
color 0A
echo.
echo 				  __   __    __      __  __ _     __   __ _  ____
echo 				 / _\ (  )  (  )    (  )(  ( \   /  \ (  ( \(  __)
echo 				/    \/ (_/\/ (_/\   )( /    /  (  O )/    / ) _)
echo 				\_/\_/\____/\____/  (__)\_)__)   \__/ \_)__)(____)			enjoy :)        
echo.
echo "                    ____  ____  __      __   _  _    ___  ____   __    ____  ____  __  __  ____                   "
echo "                   (  _ \( ___)(  )    /__\ ( \/ )  / __)(_  _) /__\  (  _ \(_  _)(  )(  )(  _ \                  "
echo "                    )(_) ))__)  )(__  /(__)\ \  /   \__ \  )(  /(__)\  )   /  )(   )(__)(  )___/                  "
echo "                   (____/(____)(____)(__)(__)(__)   (___/ (__)(__)(__)(_)\_) (__) (______)(__)                    "
echo.
echo                 oo......................................................................oo
echo               oo                                                                          oo
echo               oo   [1}  Create BAT to delay start on DV_Master                            oo
echo               oo   [2]  Create BAT to delay start on DV_Slave                             oo
echo               oo   [3]  Create BAT to delay start on Single View                          oo
echo               oo   [4]  Create BAT with questions                                         oo
echo               oo                                                                          oo
echo               oo   [5]  Go back to main screen                                            oo
echo                 oo......................................................................oo
echo.
echo.
echo.
set /p delay_opt=:                  Please choose required option 1-5: 
if [%delay_opt%]==[1] goto Delay_master
if [%delay_opt%]==[2] goto Delay_slave
if [%delay_opt%]==[3] goto Delay_single
if [%delay_opt%]==[4] goto Delay_options
if [%delay_opt%]==[5] goto done
if [%delay_opt%]==[] goto Delay_start
cls
echo.
echo INCORRECT CHOICE, TRY AGAIN
goto Delay_start
echo.


:Delay_master
echo.
echo This will create a new "start.bat" file
pause
echo @echo off > start.bat
echo MODE CON: LINES=2 COLS=32 >> start.bat
echo echo Please wait ... >> start.bat
echo cd "%ProgramFiles%\xray client" >> start.bat
echo SLEEP 2 >> start.bat
echo TASKKILL /F /IM AstroDiagnostic.exe >> start.bat
echo TASKKILL /F /IM DAQBoard.exe >> start.bat
echo TASKKILL /F /IM Shutdown.exe >> start.bat
echo TASKKILL /F /IM XrayClient.exe >> start.bat
echo SLEEP 2 >> start.bat
echo tasklist /nh /fi "imagename eq AstroDiagnostic.exe" ^| find /i "AstroDiagnostic.exe" ^>^nul ^|^|(start "AstroDiag.vi" "C:\Program Files\DiagDoc\AstroDiagnostic.exe" /D "C:\Program Files\DiagDoc\") >> start.bat
echo SLEEP 8 >> start.bat
echo net stop mxssvr /y >> start.bat
echo SLEEP 1 >> start.bat
echo net start mxssvr /y >> start.bat
echo SLEEP 2 >> start.bat
echo @echo Please wait ... ... >> start.bat
echo tasklist /nh /fi "imagename eq Shutdown.exe" ^| find /i "Shutdown.exe" ^>^nul ^|^|(start "Shutdown" "%ProgramFiles%\xray client\Shutdown.exe" /D "%ProgramFiles%\xray client\") >> start.bat
echo SLEEP 1 >> start.bat
echo tasklist /nh /fi "imagename eq XrayClient.exe" ^| find /i "XrayClient.exe" ^>^nul ^|^|(start "XrayClient" "%ProgramFiles%\xray client\XrayClient.exe" /D "%ProgramFiles%\Xray Client") >> start.bat
echo echo. >> start.bat
echo cls >> start.bat
echo ^>^nul >> start.bat
echo.
echo File created :) --  Now copy it to %startfolder%
echo.
pause
xcopy start.bat %startfolder%
echo  File transfered  --  New file will start AstroDiagnostic, Shutdown and Xray Client programs
echo.
echo  You will have to manualy ::ove the shortcuts for those programs from the startup !!
echo. 
echo  and adjust delays inside the file.  
echo.
del start.bat
PAUSE
explorer %startfolder%
cd %startfolder%
notepad start.bat
echo.
goto done


:Delay_slave
echo.
echo This will create a new "start.bat" file
pause
echo @echo off > start.bat
echo MODE CON: LINES=2 COLS=32 >> start.bat
echo echo Please wait ... >> start.bat
echo cd "%ProgramFiles%\xray client" >> start.bat
echo SLEEP 2 >> start.bat
echo TASKKILL /F /IM 200KVDV.exe >> start.bat
echo TASKKILL /F /IM Shutdown.exe >> start.bat
echo TASKKILL /F /IM XrayClient.exe >> start.bat
echo SLEEP 3 >> start.bat
echo tasklist /nh /fi "imagename eq 200KVDV.exe" ^| find /i "200KVDV.exe" ^>^nul ^|^|(start "Secondview.vi" "%ProgramFiles%\SecondView\200KVDV.exe" /D "C:\Program Files\SecondView\") >> start.bat
echo SLEEP 6 >> start.bat
echo @echo Please wait ... ... >> start.bat
echo tasklist /nh /fi "imagename eq Shutdown.exe" ^| find /i "Shutdown.exe" ^>^nul ^|^|(start "Shutdown" "%ProgramFiles%\xray client\Shutdown.exe" /D "%ProgramFiles%\xray client\") >> start.bat
echo SLEEP 2 >> start.bat
echo @echo Please wait ... ... ...
echo tasklist /nh /fi "imagename eq XrayClient.exe" ^| find /i "XrayClient.exe" ^>^nul ^|^|(start "XrayClient" "%ProgramFiles%\xray client\XrayClient.exe" /D "%ProgramFiles%\Xray Client") >> start.bat
echo echo. >> start.bat
echo cls >> start.bat
echo ^>^nul >> start.bat
echo.
echo File created :) --  Now copy it to %startfolder%
echo.
pause
xcopy start.bat %startfolder%
echo  File transfered  --  New file will start AstroDiagnostic, Shutdown and Xray Client programs
echo.
echo  You will have to manualy ::ove the shortcuts for those programs from the startup !!
echo. 
echo  and adjust delays inside the file.  
echo.
del start.bat
PAUSE
explorer %startfolder%
cd %startfolder%
notepad start.bat
echo.
goto done


:Delay_single
echo.
echo This will create a new "start.bat" file
pause
echo @echo off > start.bat
echo MODE CON: LINES=2 COLS=32 >> start.bat
echo echo Please wait ... >> start.bat
echo cd "%ProgramFiles%\xray client" >> start.bat
echo SLEEP 2 >> start.bat
echo TASKKILL /F /IM AstroDiagnostic.exe >> start.bat
echo TASKKILL /F /IM DAQBoard.exe >> start.bat
echo TASKKILL /F /IM Shutdown.exe >> start.bat
echo TASKKILL /F /IM XrayClient.exe >> start.bat
echo SLEEP 2 >> start.bat
echo tasklist /nh /fi "imagename eq AstroDiagnostic.exe" ^| find /i "AstroDiagnostic.exe" ^>^nul ^|^|(start "AstroDiag.vi" "C:\Program Files\DiagDoc\AstroDiagnostic.exe" /D "C:\Program Files\DiagDoc\") >> start.bat
echo SLEEP 8 >> start.bat
echo net stop mxssvr /y >> start.bat
echo SLEEP 1 >> start.bat
echo net start mxssvr /y >> start.bat
echo SLEEP 2 >> start.bat
echo @echo Please wait ... ... >> start.bat
echo tasklist /nh /fi "imagename eq Shutdown.exe" ^| find /i "Shutdown.exe" ^>^nul ^|^|(start "Shutdown" "%ProgramFiles%\xray client\Shutdown.exe" /D "%ProgramFiles%\xray client\") >> start.bat
echo SLEEP 1 >> start.bat
echo tasklist /nh /fi "imagename eq XrayClient.exe" ^| find /i "XrayClient.exe" ^>^nul ^|^|(start "XrayClient" "%ProgramFiles%\xray client\XrayClient.exe" /D "%ProgramFiles%\Xray Client") >> start.bat
echo echo. >> start.bat
echo cls >> start.bat
echo ^>^nul >> start.bat
echo.
echo File created :) --  Now copy it to %startfolder%
echo.
pause
xcopy start.bat %startfolder%
echo  File transfered  --  New file will start AstroDiagnostic, Shutdown and Xray Client programs
echo.
echo  You will have to manualy ::ove the shortcuts for those programs from the startup !!
echo. 
echo  and adjust delays inside the file.  
echo.
del start.bat
PAUSE
explorer %startfolder%
cd %startfolder%
notepad start.bat
echo.
goto done

:Delay_options
cls
echo.
echo Now we will create a new startup bat file for various delays and various options.
set /p delay_o1=Do you want to proceed ?  (N) : 
if /I [%delay_o1%]==[N] goto Delay_start
pause
echo OK we will now proceed with our creation -- 
echo Please follow and answer few simple questions
echo @echo off > start.bat
echo MODE CON: LINES=2 COLS=32 >> start.bat
echo echo Please wait ... >> start.bat
echo cd "%ProgramFiles%\xray client" >> start.bat
echo SLEEP 2 >> start.bat
echo.
set /p delay_o2=Do you want to include diagnostic.exe ? (Y) : 
if /I [%delay_o2%]==[Y] goto delay_o2o
goto delay_o2on

:delay_o2o
echo tasklist /nh /fi "imagename eq AstroDiagnostic.exe" ^| find /i "AstroDiagnostic.exe" ^>^nul ^|^|(start "AstroDiag.vi" "%ProgramFiles%\DiagDoc\AstroDiagnostic.exe" /D "C:\Program Files\DiagDoc\") >> start.bat
goto delay_o2on

:delay_o2on
echo.
echo SLEEP 8 >> start.bat
set /p delay_o3=Do you want to include Shutdown.exe? (Y) : 
if /I [%delay_o3%]==[Y] goto delay_o3o
goto delay_o3on

:delay_o3o
echo tasklist /nh /fi "imagename eq Shutdown.exe" ^| find /i "Shutdown.exe" ^>^nul ^|^|(start "Shutdown" "%ProgramFiles%\xray client\Shutdown.exe" /D "%ProgramFiles%\xray client\") >> start.bat
goto delay_o3on

:delay_o3on
echo.
echo SLEEP 2 >>  start.bat
set /p delay_o4=Do you want to include Xray Client ? (Y) : 
if /I [%delay_o4%]==[Y] goto delay_o4o
goto delay_o4on

:delay_o4o
echo tasklist /nh /fi "imagename eq XrayClient.exe" ^| find /i "XrayClient.exe" ^>^nul ^|^|(start "XrayClient" "%ProgramFiles%\xray client\XrayClient.exe" /D "%ProgramFiles%\Xray Client") >> start.bat
goto delay_o4on

:delay_o4on
echo echo. >> start.bat
echo cls >> start.bat
echo ^>^nul >> start.bat
echo.
echo  File has been created :) 
echo.
echo  You will have to manualy ::ove the shortcuts for those programs from the startup !!
echo. 
echo  and you can also adjust delays inside the file.  
echo.
echo.
set /p delay_o5=Do you want to open this file now ? (Y/N) :
if /I [%delay_o5%]==[Y] goto delay_o5o
goto delay_o5on

:delay_o5o
notepad start.bat
goto delay_o5on

:delay_o5on
echo.
set /p delay_o6=Do you want to copy this file to startup folder ? (Y) : 
if /I [%delay_o6%]==[Y] goto delay_o6o
goto delay_o6on

:delay_o6o
xcopy start.bat %startfolder% 
echo. 
echo Copied :) 
explorer %startfolder% 
goto delay_o6on

:delay_o6on
echo.
set /p delay_o7=Do you want to delete this file (Y) : 
if /I [%delay_o7%]==[Y] goto delay_o7o
goto delay_o7on

:delay_o7o
del start.bat
echo Deleted
goto delay_o7on

:delay_o7on
echo.
echo All done 
echo. 
PAUSE
goto done


:No_comm
cls
echo.
color 0A
echo.
echo 				  __   __    __      __  __ _     __   __ _  ____
echo 				 / _\ (  )  (  )    (  )(  ( \   /  \ (  ( \(  __)
echo 				/    \/ (_/\/ (_/\   )( /    /  (  O )/    / ) _)
echo 				\_/\_/\____/\____/  (__)\_)__)   \__/ \_)__)(____)			enjoy :)        
echo.
echo " _  _  _____     ___  _____  __  __  __  __  __  __  _  _  ____  ___    __   ____  ____  _____  _  _ ";
echo "( \( )(  _  )   / __)(  _  )(  \/  )(  \/  )(  )(  )( \( )(_  _)/ __)  /__\ (_  _)(_  _)(  _  )( \( )";
echo " )  (  )(_)(   ( (__  )(_)(  )    (  )    (  )(__)(  )  (  _)(_( (__  /(__)\  )(   _)(_  )(_)(  )  ( ";
echo "(_)\_)(_____)   \___)(_____)(_/\/\_)(_/\/\_)(______)(_)\_)(____)\___)(__)(__)(__) (____)(_____)(_)\_)";
echo.
echo                 oo......................................................................oo
echo               oo                                                                          oo
echo               oo   [1}  No comms / simple -- "net stop mxss"                              oo
echo               oo   [2]  No comms / Correct Data config3 files                             oo
echo               oo   [3]  No comms / ::ove Data folder // hard way                         oo
echo               oo                                                                          oo
echo               oo   [5]  Go back to main screen                                            oo
echo                 oo......................................................................oo
echo.
echo.
set /p kill=Please choose required option (1-5) : 
if /I [%kill%]==[1] goto no_comm_no_kill
if /I [%kill%]==[2] goto no_comm_config
if /I [%kill%]==[3] goto no_comm_kill  

if /I [%kill%]==[5] goto done
if /I [%kill%]==[] goto No_comm
:: the /I after if make the imput incasesensitive
cls
echo.
echo INCORRECT CHOICE, TRY AGAIN
goto No_comm
echo.


:no_comm_no_kill
cls
color 2F
echo This should restart NI Service 
PAUSE
net stop mxssvr /y
echo.
echo Service restarted 
echo.
echo If communication is not restored try again with option [2] from 'No communication menu'
PAUSE
goto done

:no_comm_config
cls
color 4F
echo.
echo ^<^<^<  ---  -  NO COMMUNICATION SOFT WAY !! !!    -  --- ^>^>^>
echo.
echo --- --- ---  Tasks will have to be killed now  --- --- --- 
echo.
PAUSE
TASKKILL /F /IM AstroDiagnostic.exe
TASKKILL /F /IM DAQBoard.exe
TASKKILL /F /IM xkeys.exe
TASKKILL /F /IM IOcontrol.exe
TASKKILL /F /IM shutdown.exe
TASKKILL /F /IM 200KVDV.exe
echo.
cls
echo.
echo --- --- ---  NI Service will stop now  --- --- ---
echo.
PAUSE
net stop mxssvr /y
echo.
cls
echo.
echo --- --- ---  NI Data config file will be backed up ... ...  --- --- ---
echo.
PAUSE
xcopy "%max_data_dic%\Last\" "%service_F%\MAX_Last_%date:~7,2%%date:~-10,2%%date:~-4,4%\" /S /W /I /H
xcopy "%max_data_F%" "%service_F%\MAX_Data_%date:~7,2%%date:~-10,2%%date:~-4,4%\" /S /W /I /H
goto check_config

:check_config
echo.
cls
echo.
echo --- --- ---  Config files will be checked  --- --- ---
echo.
PAUSE
echo.
@fc %max_data_F%\config3.mxs %max_data_F%\config3.mxs.bak
if [%ERRORLEVEL%]==[1] echo files are diffrent && goto check_config_OK
PAUSE
goto check_config_NOK

:check_config_OK
rename "%max_data_F%\config3.*" "%max_data_F%\config3_old.*"
rename "%max_data_F%\storage.mxc" "%max_data_F%\storage_old.mxc"
if exist "%service_F%\MAX_Data_%date:~7,2%%date:~-10,2%%date:~-4,4%\config3.mxs.bak" (
	xcopy "%service_F%\MAX_Data_%date:~7,2%%date:~-10,2%%date:~-4,4%\config3.mxs.bak" "%max_data_F%\config3.mxs" 
		goto check_config_end
	) else ( 
	goto check_config_NOK 
	)
pause 
goto check_config_NOK

:check_config_NOK
echo.
echo --- --- ---  NI MAX Data Folder will be ::oved ... ...  --- --- ---
echo.
PAUSE
rmdir /S /Q %max_data_F%
echo.
goto check_config_end

:check_config_end
echo.
cls
echo.
echo --- --- ---  System will have to be restarted or logged off for changes to take effect  --- --- ---
echo.
PAUSE
goto reboot_logout


:no_comm_kill
cls
color 4F
echo.
echo ^<^<^<  ---  -  NO COMMUNICATION HARD WAY !! !!   -  ---  ^>^>^>
echo.
echo --- --- ---  Tasks will have to be killed now  --- --- ---
echo.
PAUSE
TASKKILL /F /IM AstroDiagnostic.exe
TASKKILL /F /IM DAQBoard.exe
TASKKILL /F /IM xkeys.exe
TASKKILL /F /IM IOcontrol.exe
TASKKILL /F /IM shutdown.exe
TASKKILL /F /IM 200KVDV.exe
echo.
cls
echo.
echo --- --- ---  NI Service will stop now  --- --- ---
echo.
PAUSE
net stop mxssvr /y
echo.
cls
echo.
echo --- --- ---  NI MAX Data Folder will be ::oved ... ...  --- --- ---
echo.
PAUSE
rmdir /S /Q %max_data_F%
echo.
cls
echo.
echo --- --- ---  System will have to be restarted or logged off for changes to take effect  --- --- ---
echo.
goto reboot_logout


:Rename_xray
cls
color 2F
echo.
set xrayold="Xray_Client_%date:~7,2%%date:~-10,2%%date:~-4,4%"
echo.
echo Rename X-ray folder to Xray_Client_@date :)
echo.
PAUSE
explorer "%ProgramFiles%"
rename "%xray_F%" "%xrayold%"
PAUSE
echo.
echo Folder renamed to %xrayold%
:: rename "C:\Program Files\Xray Client_back_old" "Xray Client"
echo.
goto done


:: removed from top not longer in use
:R_F_R
echo.
color 2F
echo Rename X-ray folder to new and back_old to normal :)
echo.
PAUSE
rename "C:\Program Files\Xray Client" "Xray Client_back_old"
PAUSE
rename "C:\Program Files\Xray Client_new" "Xray Client"
echo.
goto done


:Restore_pass
color 2F
echo.
echo Restoring Admin password to default '1111'
echo.
PAUSE
echo use astrophysicsdatabase>passrestore.sql
echo update ap.users set password='1111' where IDcode='ADMIN'>>passrestore.sql
echo go>>passrestore.sql
echo.
PAUSE
"C:\Program Files\Microsoft SQL Server\80\Tools\Binn\osql" -E -i passrestore.sql
PAUSE
del passrestore.sql
goto done


:: removed from the list
:Archive_clean_old
color 2F
echo.
set startfolder="C:\Documents and Settings\Astrophysics Inc\Start Menu\Programs\Startup"
echo Create Archive Cleaning Utility entry in startup
echo.
PAUSE
xcopy archive_clean.vbs %startfolder%
echo.
goto done


:Archive_clean
cls
color 2F
@echo Create archive_cleaning.vbs in startup folder
echo.
PAUSE
echo ' This VB Script file will allow auto-deletion of archive images after a' >archive_cleaning.vbs
echo ' specified number of days old in order to maintain the necessary hard' >>archive_cleaning.vbs
echo ' drive free space for normal operation.' >>archive_cleaning.vbs
echo ' >>archive_cleaning.vbs
echo ' The time value must be specified by the system administrator based on' >>archive_cleaning.vbs
echo ' particular system usage.  Set the time value in days as indicated in the' >>archive_cleaning.vbs
echo ' large box below to clear old archive files such that at least 10% of the' >>archive_cleaning.vbs
echo ' hard drive's space is always available AFTER the last user of the day' >>archive_cleaning.vbs
echo ' before the system is shut down.' >>archive_cleaning.vbs
echo ' >>archive_cleaning.vbs
echo ' NOTE: A typical archive image file will be no more than 2 MB on average,' >>archive_cleaning.vbs
echo '       but is dependent on machine size.' >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo Option Explicit  >>archive_cleaning.vbs
echo On Error Resume Next  >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo Dim iDaysOld  >>archive_cleaning.vbs
echo Dim oFSO, oFolder, sDirectoryPath  >>archive_cleaning.vbs
echo Dim oFileCollection, oFile, sDir  >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo ' ******************************************************** >>archive_cleaning.vbs
echo ' *                                                      * >>archive_cleaning.vbs
echo ' *     PLEASE SET THE FOLLOWING VARIABLE "iDaysOld"     * >>archive_cleaning.vbs
echo ' *                                                      * >>archive_cleaning.vbs
echo ' *        TO THE DESIRED VALUE OF DAYS OLD THAT         * >>archive_cleaning.vbs
echo ' *                                                      * >>archive_cleaning.vbs
echo ' *     ARCHIVE IMAGES MUST BE BEFORE AUTO-DELETION.     * >>archive_cleaning.vbs
echo ' *                                                      * >>archive_cleaning.vbs
echo ' ******************************************************** >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo iDaysOld = 35 >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo sDirectoryPath = "C:\Program Files\Xray Client\Archive Raw"  >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo Set oFSO = CreateObject("Scripting.FileSystemObject")  >>archive_cleaning.vbs
echo Set oFolder = oFSO.GetFolder(sDirectoryPath)  >>archive_cleaning.vbs
echo Set oFileCollection = oFolder.Files  >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo For each oFile in oFileCollection >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo 	If LCase(Right(Cstr(oFile.Name), 3)) = "wim" Then >>archive_cleaning.vbs
echo. 	 >>archive_cleaning.vbs
echo 		If oFile.DateLastModified ^< (Date() - iDaysOld) Then  >>archive_cleaning.vbs
echo 		oFile.Delete(True)  >>archive_cleaning.vbs
echo 		End If  >>archive_cleaning.vbs
echo.  >>archive_cleaning.vbs
echo 	End If    >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo Next  >>archive_cleaning.vbs
echo. >>archive_cleaning.vbs
echo Set oFSO = Nothing  >>archive_cleaning.vbs
echo Set oFolder = Nothing  >>archive_cleaning.vbs
echo Set oFileCollection = Nothing  >>archive_cleaning.vbs
echo Set oFile = Nothing  >>archive_cleaning.vbs
echo.
echo File created
echo.
PAUSE
xcopy archive_cleaning.vbs %startfolder%
echo.
echo File transfered to startup folder
echo.
PAUSE
del archive_cleaning.vbs
explorer %startfolder%
echo.
goto done


:Diag_Clean
color 2F
cls
echo.
echo.
echo You're about to clean up all the logs created by Diagnostics
echo.
pause
dir %diag_data_F%
echo. 
pause
FOR /R %diag_data_F% %%G IN (ACLog1.xls ACLog2.xls PS1.xls PS2.xls XT1.xls XT2.xls) do echo.> %%G
echo. 
dir %diag_data_F%
echo.
echo ALL DONE ... ... ... Thanks
echo.
ping -n 5 localhost >nul
goto done


:Light_tbl
cls
echo.
set ref=Lite00_REF
set ooo=Lite00_0.tbl
set cdate=%date:~3,2%%date:~-10,2%%date:~-2,4%
:: date :~7,2 will display 2 chars after 7th char of the date cmd
echo This will rename Lite00_REF file to REF_date
echo and replace it with Lite00_0.tbl
echo Experimental use with caution :)
echo.
pause
echo.
echo.
rename %ref%.tbl %ref%_%cdate%
echo REF renamed 
echo.
echo.
pause
echo.
echo.
rename %ooo% %ref%.tbl
echo New Lite00_REF created 
echo.
echo.
pause
goto done

:Future1
cls
echo.
echo All In ONE :)
echo testing version !!!!
echo Can we get started ??
PAUSE
echo Let's start with cleaning SQL Log file
cmd
goto done
PAUSE
goto done


:Future2
echo.
echo Just a CMD for now :)  "exit" when finished
echo.
PAUSE
cls
cmd
goto done


:service_log
cls
echo.
echo Notepad will open now. Please append your Service notes at the end of the document
echo.
echo File will be saved on C:\ drive as service_log.log
echo.
set /p eng_name=Please enter your initials or your name:
echo. >> %service_log%
echo @ %date:~7,2%/%date:~-10,2%/%date:~-4,4% ---- >> %service_log%
echo -- %eng_name% done ----: >> %service_log%
notepad %service_log%
cls
echo.
echo.
echo Thank you for the update --- --- --- It will help others in the future :)
echo.
PAUSE
goto done


:: removed !!
:Reboot_now_Y
echo.
echo Reboot this PC or for MasterSlave select B
echo.
set /P Y_N=Do you really want to reboot?? (Y or N or B):
if /I [%Y_N%]==[Y] goto Reboot_Y
if /I [%Y_N%]==[N] goto Reboot_now
if /I [%Y_N%]==[B] goto Reboot_B
if /I [%Y_N%]==[] goto again
cls
echo.
echo INCORRECT CHOICE, CHOOSE AGAIN
goto again
echo.


:Reboot_Logout
color 4F
echo.
echo Would you like to reboot or logout ?
echo.
set /p reb_log=Choose (R) for reboot or (L) to logout or (C) to cancel:
echo.
if /I [%reb_log%]==[R] goto Reboot_now
if /I [%reb_log%]==[L] goto Logout_now
if /I [%reb_log%]==[C] goto done
if /I [%reb_log%]==[] goto Reboot_Logout
goto quit


:Reboot_now
echo.
echo PC will reboot --
echo.
PAUSE
shutdown /R /C "rebooting now" /T 15
goto quit


:Logout_now
echo.
echo User will be logged out --
echo.
PAUSE
logoff
goto quit


:done
echo.
echo.
set /P Done=Just Hit ENTER
cls
goto start


:quit
cls


:exit
exit


:extra1
color 0A
cls
echo.
echo Extra set of features
echo.
echo (0) - Go back to START
echo (1) - Open Startup folder
echo (2) - Open Xray folder
echo (3) - Open Diagnostic folder
echo (4) - Open C:\
echo (5) - Defrag C:\
echo.
set /p extra_1=Please choose from the Extra options : 
echo.
if [%extra_1%]==[0] goto done
if [%extra_1%]==[1] goto extra1_1
if [%extra_1%]==[2] goto extra1_2
if [%extra_1%]==[3] goto extra1_3
if [%extra_1%]==[4] goto extra1_4
if [%extra_1%]==[5] goto extra1_5
if [%extra_1%]==[6] goto extra1_6
if [%extra_1%]==[7] goto extra1_7
if [%extra_1%]==[8] goto extra1_8
if [%extra_1%]==[9] goto extra1_9

:extra1_1
explorer %startfolder% &
goto extra1

:extra1_2
explorer %xray_F% &
goto extra1

:extra1_3
explorer %diag_F% &
goto extra1

:extra1_4
explorer "C:\" &
goto extra1

:extra1_5
cls
echo.
defrag C: /F
goto extra1

:extra1_6

:extra1_7

:extra1_8

:extra1_9
cls
@echo off
color 0C
echo.
echo.
echo     :::     :::        :::             ::::::::::: ::::    :::       ::::::::  ::::    ::: :::::::::: 
echo   :+: :+:   :+:        :+:                 :+:     :+:+:   :+:      :+:    :+: :+:+:   :+: :+:        
echo  +:+   +:+  +:+        +:+                 +:+     :+:+:+  +:+      +:+    +:+ :+:+:+  +:+ +:+        
echo +#++:++#++: +#+        +#+                 +#+     +#+ +:+ +#+      +#+    +:+ +#+ +:+ +#+ +#++:++#   
echo +#+     +#+ +#+        +#+                 +#+     +#+  +#+#+#      +#+    +#+ +#+  +#+#+# +#+        
echo #+#     #+# #+#        #+#                 #+#     #+#   #+#+#      #+#    #+# #+#   #+#+# #+#        
echo ###     ### ########## ##########      ########### ###    ####       ########  ###    #### ########## 
echo.
echo.
echo                                                                                                 by Scorp
echo.
PAUSE
goto extra1