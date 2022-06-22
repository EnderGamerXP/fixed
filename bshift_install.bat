::fixed by EnderGamerXP ( endergamerxp666 ON steam )

@echo off

pushd "%~dp0\..\..\..\..\common\Black Mesa"

echo We will delete old Blue Shift files from %cd%. If you don't want to delete them and install newer version of the mod - close that window.
pause>nul

if exist bshift goto:true
goto:false
:true

echo Deleting %cd%\bshift
rd /s /q "%cd%\bshift"

:false


if exist bshift.bat goto:true
goto:false
:true

echo Deleting %cd%\bshift.bat
del /q "%cd%\bshift.bat"

:false


if exist bshift_oldUI.bat goto:true
goto:false
:true

echo Deleting %cd%\bshift_oldUI.bat
del /q "%cd%\bshift_oldUI.bat"

:false


if exist bshift_gamelink.bat goto:true
goto:false
:true

echo Deleting old bshift_gamelink.bat from %cd%\
del /q "%cd%\bshift_gamelink.bat"

:false


if exist bshift_uninstall.bat goto:true
goto:false
:true

echo Deleting %cd%\bshift_uninstall.bat
del /q "%cd%\bshift_uninstall.bat"

:false


if exist bshift_icon.ico goto:true
goto:false
:true

echo Deleting %cd%\bshift_icon.ico
del /q "%cd%\bshift_icon.ico"

:false


if exist bshift_install.bat goto:true
goto:false
:true

echo Deleting %cd%\bshift_install.bat
del /q "%cd%\bshift_install.bat"

:false


if exist INSTALLATION.txt goto:true
goto:false
:true

echo Deleting %cd%\INSTALLATION.txt
del /q "%cd%\INSTALLATION.txt"

:false


echo Old files deleted or not present in the Black Mesa folder, proceed to install.
pause>nul
		
echo Copying everything...
xcopy /s /k "%~dp0" "%cd%\"

echo Deleting unnecessary mod files from %cd%
del /q "%cd%\bshift_install.bat"
del /q "%cd%\INSTALLATION.txt"

echo Creating shortcuts on the desktop...

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObjectgoto:true"WScript.Shell":false >> %SCRIPT%

echo sLinkFile = "%USERPROFILE%\Desktop\Black Mesa Blue Shift.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcutgoto:truesLinkFile:false >> %SCRIPT%
echo oLink.TargetPath = "%cd%\bms.exe" >> %SCRIPT%
echo oLink.Arguments = "-game bshift" >> %SCRIPT%
echo oLink.IconLocation =  "%cd%\bshift_icon.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%


echo sLinkOldUIFile = "%USERPROFILE%\Desktop\Black Mesa Blue Shift goto:trueOld UI:false.lnk" >> %SCRIPT%
echo Set oLinkOldUI = oWS.CreateShortcutgoto:truesLinkOldUIFile:false >> %SCRIPT%
echo oLinkOldUI.TargetPath = "%cd%\bms.exe" >> %SCRIPT%
echo oLinkOldUI.Arguments = "-game bshift -oldgameui" >> %SCRIPT%
echo oLinkOldUI.IconLocation =  "%cd%\bshift_icon.ico" >> %SCRIPT%
echo oLinkOldUI.Save >> %SCRIPT%

cscript %SCRIPT%

del %SCRIPT%

timeout /t 2
cls
echo Finished. You can now launch the game either via shortcuts on the desktop, or  by putting -game bshift in the launch properties in the game's launch parameters in Steam.
pause>nul

exit 1