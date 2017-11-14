:: Name:     compactDir.cmd
:: Purpose:  Recursively compact/uncompact a number of directories 
:: Author:   Alaa Zeineldine   alaa@expertwell.com
:: Revision: November 2017 - initial version 
:: Remarks: wraper that uses compact /s [/u|/c]
::          
:: Usage: compactdirs [-u|-c] file...
::
@echo off
setlocal enableExtensions enableDelayedExpansion
set me=%~n0

rem set /P contVar=Begin: 
rem echo step2 contVar is: !contVar!

:Main
    rem default action is uncompress
    set ACTION=u
    set ACTVERB=uncompress

    rem first argument is an options switch /c or /u
    if "%1"=="/c" (
        set ACTION=c
        set ACTVERB=compress
        shift
    ) else (
        if "%1"=="/u" (
            shift
        )
    )
    echo ACTION is: %ACTVERB%

    rem remaining arguments will be directories to process
    :ArgLoop
        echo Arg is now: %1
        set thisArg=%1

        if not "!thisArg!" == "" (
            call :CompArg %thisArg%
            shift
            echo get next Arg...
            goto :ArgLoop
        )
    rem end ArgLoop

    :End
    endlocal
    echo on
    echo --- Main done---
    @exit /B 0
rem end Main



rem subroutine to process one argument
rem the argument may be an expandable command line regex
:CompArg
    for /D %%f in ("%~1") do (
        echo step3 - directory is: %%f
        if not exist "%%f" (
            echo File or directory %%f does not exist
            exit /B
        ) else (
            pushd %%f
            echo step4 - current directory is: !cd!
            set /p areYouSure=!ACTVERB! !cd!?
            echo calling compact with !ACTION!:
            if "!areYouSure!"=="yes" (
                compact /s /!ACTION!
            ) 
            popd
            echo Step 6 - current directory is: !cd!
            if X!areYouSure!==Xquit (
                exit /B
            )
        )
        echo Cont..     
    )
    echo ---CompArg Done---
    exit /B
rem end Comparg