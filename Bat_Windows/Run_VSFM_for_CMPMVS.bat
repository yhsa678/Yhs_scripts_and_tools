REM Run VisualSFM and prepare data for CMPMVS
REM 

set vsfm=D:\Hongsheng\Test_Libraries_Runtime\SfM_MVS\VisualSFM_windows_cuda_64bit\visualSFM.exe

if ("%1"=="")(
	set imgdir=I:\Hongsheng_Test\J6_2_kit
)
else
(
	set imgdir=%1
)

if [%2]==[](
	set resName=res.nvm
)
else
(
	set resName=%2
)

cmd /c %vsfm% sfm+cmp+sort %imgdir% %imgdir%\%resName%
