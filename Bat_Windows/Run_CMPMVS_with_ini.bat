@echo off
REM
REM Run CMPMVS, using certain .ini file
REM

REM set cmpmvsDir=D:\Hongsheng\Test_Libraries_Runtime\SfM_MVS\CMPMVS_0_6_0\
REM set cmpmvsDrive=D:

set cmpmvsDir=C:\Hongsheng\1_Test_Tools_Libraries\3_SfM_MVS\CMPMVS\CMPMVS_0_6_0
set cmpmvsDrive=C:

set taskIni=xxx
set curDir=%~p0
set curDrive=%~d0

if not [%1]==[] (set taskIni=%1)

%cmpmvsDrive%
cd %cmpmvsDir%

%cmpmvsDir%\CMPMVS.exe %taskIni%

cd %curDir%
cd %curDrive%
