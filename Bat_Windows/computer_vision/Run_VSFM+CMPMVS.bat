@echo off
REM
REM Run VisualSFM plus CMPMVS using default configurations
REM 

set cmpmvsDir=D:\Hongsheng\Test_Libraries_Runtime\SfM_MVS\CMPMVS_0_6_0\
set vsfm=D:\Hongsheng\Test_Libraries_Runtime\SfM_MVS\VisualSFM_windows_cuda_64bit\visualSFM.exe
set imgdir=I:\Hongsheng_Test\J6_2_kit

if not [%1]==[] (set imgdir=%1)

cmd /c %~p0\Run_VSFM_for_CMPMVS.bat %imgdir% cmp.nvm

REM start /D %cmpmvsDir% %cmpmvsDir%\visualSfM_CMPMVS.bat %vsfm% %imgdir%

cmd /c %~p0\Run_CMPMVS.bat %imgdir%