# File #
- Write out 3d points into certain file format so as to visualize in e.g. Meshlab (`.ply`) or BS Contact (`.wrl`)
	- partially adapted from [vision-princeton]
	- Write3DPointsToPlyFile.m
	- Write3DPointsToPlyBin.m -- in binary format


- Read and write NVM file which is used by VisualSFM
	- partially adapted from [Credit: Enliang Zheng][ezheng]
	- ReadNVM.m
	- Show3DPoints.m
	- Show3DPointsInNVMFile.m

[ezheng]: https://github.com/ezheng/script
[vision-princeton]: http://vision.princeton.edu/pvt/points2ply.m