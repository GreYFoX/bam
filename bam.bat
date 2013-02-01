@echo off

@REM check if we already have the tools in the environment
if exist "%VCINSTALLDIR%" (
	goto compile
)

@REM Check for Visual Studio
if defined VS110COMNTOOLS (
	call set VSPATH=%%VS110COMNTOOLS%%
	goto set_env
)
if defined VS100COMNTOOLS (
	call set VSPATH=%%VS100COMNTOOLS%%
	goto set_env
)
if defined VS90COMNTOOLS" (
	call set VSPATH=%%VS90COMNTOOLS%%
	goto set_env
)
if defined VS80COMNTOOLS (
	call set VSPATH=%%VS80COMNTOOLS%%
	goto set_env
)

echo You need Microsoft Visual Studio 8, 9, 10 or 11 installed
pause
exit

@ setup the environment
:set_env
call %VSPATH%vsvars32.bat

:compile
%appdata%\bam.exe %*
