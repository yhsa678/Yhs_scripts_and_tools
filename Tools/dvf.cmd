REM USE for /? to see the meaning of %~dp0
set oldcd=%cd%

%~d0
cd "%~p0"
OpenCV_Tools\Decompose_Video_into_Frames.exe %*

cd "%oldcd%"