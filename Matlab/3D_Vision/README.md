# File #
- Read and write NVM file which is used by VisualSFM
	- partially adapted from [Credit: Enliang Zheng][ezheng]
	- ReadNVM.m
	- Show3DPoints.m
	- Show3DPointsInNVMFile.m

# Folder #
- Depth_Utility
	- Functions read, write and process depthmap related work
	- LoadFLTFile.m
	- WriteFLTFile.m

- Geometry_Utility
	- Functions related to camera geometry
	- quaternion2matrix.m
	- matrix2quaternion.m

- PLY_Utility
	- Functions that manipulate `.ply` file
	- Refer to [ply data][ply-collection]
		-  ply_display.m
	- Write out 3d points into certain file format so as to visualize in e.g. Meshlab (`.ply`) 
		- partially adapted from [vision-princeton]
		- Write3DPointsToPlyFile.m
		- Write3DPointsToPlyBin.m -- in binary format

[TODO] - WRL_Utility, BS Contact (`.wrl`) 

[ezheng]: https://github.com/ezheng/script
[vision-princeton]: http://vision.princeton.edu/pvt/points2ply.m
[ply-collection]: http://people.sc.fsu.edu/~jburkardt/data/ply/ply.html