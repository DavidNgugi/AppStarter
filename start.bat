@echo off
title App Starter BAT File
cls
color a

:Prompts
cls
SETLOCAL EnableDelayedExpansion
::Ask user to input the name of the project folder
SET "INPUT="
SET /P "INPUT=Input the project folder name:"

::Check if user inputed anything closely remote to being appropriate for our use
IF "%INPUT%"=="" GOTO Prompts
IF "%INPUT%"==" " GOTO Prompts
IF "%INPUT%"=="  " GOTO Prompts
IF NOT DEFINED INPUT GOTO Prompts
IF ERRORLEVEL 1 GOTO Prompts

:SecondPrompt
SET "PROJECT_TYPE="
SET /P "PROJECT_TYPE=Choose Type of Project(Laravel[L], Node(N)):"

:: Again Check if user inputed anything closely remote to being appropriate for our use
IF "%PROJECT_TYPE%"=="" GOTO SecondPrompt
IF "%PROJECT_TYPE%"==" " GOTO SecondPrompt
IF "%PROJECT_TYPE%"=="  " GOTO SecondPrompt
IF NOT DEFINED PROJECT_TYPE GOTO SecondPrompt
IF ERRORLEVEL 1 GOTO SecondPrompt

:: Check which project type the user has choosen
IF "%PROJECT_TYPE%"=="L" GOTO InitLaravelApp
IF "%PROJECT_TYPE%"=="l" GOTO InitLaravelApp
IF "%PROJECT_TYPE%"=="N" GOTO InitNodeJsApp
IF "%PROJECT_TYPE%"=="n" GOTO InitNodeJsApp

:: ====================== LARAVEL START PROCEDURE ============================
:InitLaravelApp
cls
echo ===================== LARAVEL APP =====================
:: Start XAMPP Control Panel First
echo Changing directory to C:\xampp
cd /D C:\xampp
echo Starting XAMPP Control Panel...
start xampp-control.exe
TIMEOUT 2 /NOBREAK > NUL
:: Go to the given project directory
echo Changing directory to C:\Users\User\Documents\Github\%INPUT%
cd /D C:\Users\User\Documents\Github\%INPUT%
TIMEOUT 1 /NOBREAK > NUL
::Start the Laravel app...
echo Attempting to initialize the App...
TIMEOUT 2 /NOBREAK > NUL
start /WAIT "" http://localhost:8000
cmd /k "php artisan serve"

::NODEJS START PROCEDURE
:InitNodeJsApp
echo ===================== NODEJS APP =====================

:ThirdPrompt
SET "START_FILE=app.js"
SET /P "START_FILE=Name of Start File (app.js):\n"

:: Again Check if user inputed anything closely remote to being appropriate for our use
IF "%START_FILE%"=="" GOTO ThirdPrompt
IF "%START_FILE%"==" " GOTO ThirdPrompt
IF "%START_FILE%"=="  " GOTO ThirdPrompt
IF NOT DEFINED START_FILE GOTO ThirdPrompt
IF ERRORLEVEL 1 GOTO ThirdPrompt

:: Go to the given project directory
echo Changing directory to C:\Users\User\Documents\Github\%INPUT%
cd /D C:\Users\User\Documents\Github\%INPUT%
TIMEOUT 1 /NOBREAK > NUL
::Start the NodeJs app...
echo Attempting to initialize the App...
TIMEOUT 2 /NOBREAK > NUL
cmd /k "node %START_FILE%"

pause

