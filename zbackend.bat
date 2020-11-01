@echo off

REM restart under git-cmd.exe with admin
set GIT-CMD=none

if '%1'=='git' (
	set GIT-CMD=git
)

if '%GIT-CMD%'=='none' (
	start !VIPER_GIT.bat "zbackend.bat git"
	exit 0
)

title Viper's Git Tool
color 3f

set MENU-OPTION=none
set PRIVATE-REPO=none

:invaid-menu-option
cls
@echo off
REM clone repo, move files up one directory, remove extra folder, and generate .mod file
echo (1) Install the workspace
REM open shell with git status after short message
echo (2) Commit all changes
REM open shell and attempt to push to the private repo
echo (3) Push to private repository
set /p MENU-OPTION="Choice:" 
if '%MENU-OPTION%'=='1' (
	goto install-workspace
) else if '%MENU-OPTION%'=='2' (
	goto commit-changes
) else if '%MENU-OPTION%'=='3' (
	goto push-upload-changes
) else (
	goto invaid-menu-option
) 




:install-workspace
cls
echo Paste YOUR OWN fork's .git link!
echo NOT! https://github.com/GODOFGOLD808/Steampunk-Victoria.git
set /p PRIVATE-REPO="Your OWN Forked .git link: "

if '%PRIVATE-REPO%'=='https://github.com/GODOFGOLD808/Steampunk-Victoria.git' (
	goto install-workspace
)

echo %PRIVATE-REPO% > workspace.ini

echo Creating workspace ...

git clone %PRIVATE-REPO%

xcopy /s/e/h Steampunk-Victoria\*.* .

rmdir /s /q Steampunk-Victoria

goto generate-mod-file

:commit-changes
cls
echo not implemented yet!

pause
exit 0
:push-upload-changes
cls
echo not implemented yet!

pause
exit 0

:generate-mod-file
::Create new file and append line by line
::era_of_britannia_1900.mod
echo version="0.1" > era_of_britannia_1900.mod
echo tags={ >> era_of_britannia_1900.mod
echo	"Alternative History" >> era_of_britannia_1900.mod
echo	"Balance" >> era_of_britannia_1900.mod
echo	"Events" >> era_of_britannia_1900.mod
echo	"Fixes" >> era_of_britannia_1900.mod
echo	"Gameplay" >> era_of_britannia_1900.mod
echo	"Graphics" >> era_of_britannia_1900.mod
echo	"Ideologies" >> era_of_britannia_1900.mod
echo	"Map" >> era_of_britannia_1900.mod
echo	"Military" >> era_of_britannia_1900.mod
echo	"National Focuses" >> era_of_britannia_1900.mod
echo	"Sound" >> era_of_britannia_1900.mod
echo } >> era_of_britannia_1900.mod
echo name="Era of Britannia:1900 DEV WORKSPACE" >> era_of_britannia_1900.mod
echo picture="thumbnail.png" >> era_of_britannia_1900.mod
echo supported_version="1.10.*" >> era_of_britannia_1900.mod
echo path="mod/era_of_britannia_1900" >> era_of_britannia_1900.mod
echo remote_file_id="2259338725" >> era_of_britannia_1900.mod

echo Workspace created successfully!
pause
exit 0