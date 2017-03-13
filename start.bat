@echo off
title App Starter BAT File
cls
color a

:Prompts
cls
SETLOCAL EnableDelayedExpansion

:: Set global variables
SET "XAMPP_Dir=C:\xampp"
SET "GitHub_Dir=C:\Users\User\Documents\Github\"
SET "charStart=| >"
SET "charEnd=                                                                         |"

::Show Instructions
SET "data=|===========================================================================|"  
SET "data2=|                                                                           |"  
SET "data3=| AVOID SPACES BEFORE TYPING ANYTHING, DO NOT USE QUOTES IN YOUR INPUT      |"  
SET "data4=|                                                                           |"  
echo !data! && echo !data2! && echo !data3! && echo !data4! 

::Show directory names of all projects in GitHub directory
SET "dir=|===========================================================================|"  
SET "dir2=|                                                                           |"  
SET "dir3=| ALL YOUR PROJECTS                                                         |"  
SET "dir4=|                                                                           |"  
SET "dir5=|___________________________________________________________________________|"

:: Find directories
cd /D %GitHub_Dir%
DIR /b %GitHub_Dir% > projects.txt

:: Output all projects found
echo !dir! && echo !dir2! && echo !dir3! && echo !dir4! 
FOR /F "delims=" %%a in (projects.txt) DO echo !charStart! %%a                                                                        
echo !dir4! && echo !dir5!    
del projects.txt

::Ask user to input the name of the project folder
SET "INPUT="
SET /P "INPUT=Input the project folder name:"

::Check if user inputed anything closely remote to being appropriate for our use
IF "%INPUT%"=="" GOTO Prompts
IF "%INPUT%"==" " GOTO Prompts
IF "%INPUT%"=="  " GOTO Prompts
IF NOT DEFINED INPUT GOTO Prompts
IF ERRORLEVEL 1 GOTO Prompts

::Check if folder exists
:SecondPrompt
SET "PROJECT_TYPE="
SET /P "PROJECT_TYPE=Type L, N, I or P to Choose your Type of Project(Laravel[L], Node[N], Ionic[I], Python[P]):"

:: Again Check if user inputed anything closely remote to being appropriate for our use
IF "%PROJECT_TYPE%"=="" GOTO SecondPrompt
IF "%PROJECT_TYPE%"==" " GOTO SecondPrompt
IF "%PROJECT_TYPE%"=="  " GOTO SecondPrompt
IF NOT DEFINED PROJECT_TYPE GOTO SecondPrompt
IF ERRORLEVEL 1 GOTO SecondPrompt

:: Check which project type the user has choosen
IF "%PROJECT_TYPE%"=="I" GOTO InitIonicApp
IF "%PROJECT_TYPE%"=="i" GOTO InitIonicApp
IF "%PROJECT_TYPE%"=="L" GOTO InitLaravelApp
IF "%PROJECT_TYPE%"=="l" GOTO InitLaravelApp
IF "%PROJECT_TYPE%"=="N" GOTO InitNodeJsApp
IF "%PROJECT_TYPE%"=="n" GOTO InitNodeJsApp
IF "%PROJECT_TYPE%"=="P" GOTO InitPythonApp
IF "%PROJECT_TYPE%"=="p" GOTO InitPythonApp

:: ______________________ LARAVEL START PROCEDURE ____________________________
:InitLaravelApp
cls
::Instructions
SET "data6=|===========================================================================|"  
SET "data7=|                                                                           |" 
SET "data8=| LARAVEL APP                                                               |"
SET "data9=| Avoid spaces before typing anything, do not use quotes in your input      |"  
SET "data10=|                                                                           |"  
SET "data11=|___________________________________________________________________________|"
echo !data6! && echo !data7! && echo !data8! && echo !data9! && echo !data10! && echo !data11!

:: Start XAMPP Control Panel First
echo Changing directory to !XAMPP_Dir!
cd /D !XAMPP_Dir!
echo Starting XAMPP Control Panel...
start xampp-control.exe
TIMEOUT 2 /NOBREAK > NUL

:: Go to the given project directory
echo Changing directory to %GitHub_Dir%%INPUT%
cd /D %GitHub_Dir%%INPUT%
TIMEOUT 1 /NOBREAK > NUL

::Start the Laravel app...
echo Attempting to initialize the App...
TIMEOUT 2 /NOBREAK > NUL
start /WAIT "" http://localhost:8000
cmd /k "php artisan serve"

::NODEJS START PROCEDURE
:InitNodeJsApp
cls

:: Instructions
SET "data12=|===========================================================================|"  
SET "data13=|                                                                           |" 
SET "data14=| NODEJS APP                                                                |"
SET "data15=| Avoid spaces before typing anything, do not use quotes in your input      |"  
SET "data16=|                                                                           |"  
SET "data17=|___________________________________________________________________________|"
echo !data12! && echo !data13! && echo !data14! && echo !data15! && echo !data16! && echo !data17!

:ThirdPrompt
:: Go to the given project directory
echo Changing directory to C:\Users\User\Documents\Github\%INPUT%
cd /D C:\Users\User\Documents\Github\%INPUT%

SET "START_FILE=app.js"
SET /P "START_FILE=Name of Start File (app.js):"

:: Again Check if user inputed anything closely remote to being appropriate for our use
IF "%START_FILE%"=="" GOTO ThirdPrompt
IF "%START_FILE%"==" " GOTO ThirdPrompt
IF "%START_FILE%"=="  " GOTO ThirdPrompt
IF NOT DEFINED START_FILE GOTO ThirdPrompt
IF ERRORLEVEL 1 GOTO ThirdPrompt

TIMEOUT 1 /NOBREAK > NUL
::Start the NodeJs app...
echo Attempting to initialize the App...
TIMEOUT 2 /NOBREAK > NUL
cmd /k "node %START_FILE%"

::IONIC START PROCEDURE
:InitIonicApp
cls

::Instructions
SET "data18=|===========================================================================|"  
SET "data19=|                                                                           |" 
SET "data20=| IONIC APP                                                                 |"
SET "data21=| Avoid spaces before typing anything, do not use quotes in your input      |"  
SET "data22=|                                                                           |"  
SET "data23=|___________________________________________________________________________|"
echo !data18! && echo !data19! && echo !data20! && echo !data21! && echo !data22! && echo !data23!

:: Go to the given project directory
echo Changing directory to C:\Users\User\Documents\Github\%INPUT%
cd /D C:\Users\User\Documents\Github\%INPUT%
TIMEOUT 1 /NOBREAK > NUL

::Start the Ionic app...
echo Attempting to initialize the App...
TIMEOUT 2 /NOBREAK > NUL
cmd /k "ionic serve"

::PYTHON START PROCEDURE
:InitPythonApp
cls

::Instructions
SET "data24=|===========================================================================|"  
SET "data25=|                                                                           |" 
SET "data26=| PYTHON APP                                                                |"
SET "data27=| Avoid spaces before typing anything, do not use quotes in your input      |"  
SET "data28=|                                                                           |"  
SET "data29=|___________________________________________________________________________|"
echo !data24! && echo !data25! && echo !data26! && echo !data27! && echo !data28! && echo !data29!

:FourthPrompt
:: Go to the given project directory
echo Changing directory to C:\Users\User\Documents\Github\%INPUT%
cd /D C:\Users\User\Documents\Github\%INPUT%

SET "START_FILE=run.py"
SET /P "START_FILE=Name of Start File (run.py):"

:: Again Check if user inputed anything closely remote to being appropriate for our use
IF "%START_FILE%"=="" GOTO FourthPrompt
IF "%START_FILE%"==" " GOTO FourthPrompt
IF "%START_FILE%"=="  " GOTO FourthPrompt
IF NOT DEFINED START_FILE GOTO FourthPrompt
IF ERRORLEVEL 1 GOTO FourthPrompt

TIMEOUT 1 /NOBREAK > NUL
::Start the Python app...
echo Attempting to initialize the App...
TIMEOUT 2 /NOBREAK > NUL
cmd /k "python %START_FILE%"

pause

