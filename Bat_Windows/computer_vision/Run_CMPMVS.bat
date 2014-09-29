@echo off
REM
REM Run CMPMVS, using certain .ini file
REM

set cmpmvsDir=D:\Hongsheng\Test_Libraries_Runtime\SfM_MVS\CMPMVS_0_6_0\
set cmpmvsDrive=D:
set taskDir=xxx
set curDir=%~p0
set curDrive=%~d0

if not [%1]==[] (set taskDir=%1)

%cmpmvsDrive%
cd %cmpmvsDir%

%cmpmvsDir%\CMPMVS.exe %taskDir%\cmp.nvm.cmp\00\mvs.ini
md %taskDir%\_CMPMVS_00_OUT
xcopy /E %taskDir%\cmp.nvm.cmp\00\data\_OUT %taskDir%\_CMPMVS_00_OUT

cd %curDir%
cd %curDrive%
