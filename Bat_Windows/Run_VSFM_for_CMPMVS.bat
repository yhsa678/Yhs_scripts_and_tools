@echo off
REM
REM Run VisualSFM and prepare data for CMPMVS
REM 

set vsfm=D:\Hongsheng\Test_Libraries_Runtime\SfM_MVS\VisualSFM_windows_cuda_64bit\visualSFM.exe
set imgdir=I:\Hongsheng_Test\J6_2_kit
set resName=res.nvm

if not [%1]==[] (set imgdir=%1)
if not [%2]==[] (set resName=%2)

cmd /c %vsfm% sfm+cmp+sort %imgdir% %imgdir%\%resName%
