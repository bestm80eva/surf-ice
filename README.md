# Surf Ice

##### About

Surf Ice is an open source surface render. It can be compiled for the Linux, Macintosh OSX, and Windows operating systems. For details and compiled versions visit the [NITRC wiki](https://www.nitrc.org/plugins/mwiki/index.php/surfice:MainPage).

Supported mesh formats include 3DS, CTM, DXF, FreeSurfer, GII (GIfTI), GTS, LWO2, MS3D, MZ3, NV (BrainNetViewer), OBJ, OFF, PLY, STL, VTK. Online converters can convert meshes from other formats to one of these. Tractography formats include BFloat, PDB, TCK, TRK, and VTK. The software supports the NIfTI voxelwise format (tools like dcm2niix can help convert other voxel-based formats to NIfTI).

![alt tag](https://github.com/neurolabusc/surf-ice/blob/master/Surfice.jpg)

##### Compiling

This project is built using the open source [FreePascal Lazarus](http://www.lazarus-ide.org/) compiler and integrated development environment. You will need to have the LazOpenGLContext and PascalScript packages installed. To do this, launch the Lazarus application and choose Packages/InstallPackages. You will want to select these two packages from the "Available for installation" list. Finally, click the "Save and rebuild" button. Once these are installed, you can load this package and compile it using the Run/Run menu option.

You can also build this project from the command line (assuming you have FPC Lazarus installed):
 - lazbuild surfice.lpr

##### Recent Versions

7-February-2017
 - Ability to individually adjust translucency of overlays (rather than having one value for all).
 - Looks better on Linux high-DPI screens.
 - New command Advanced/ComputeCurvature creates FreeSurfer Format CURV file.
 - Control-clicking overlay name in the overlay panel reverses the overlay colors (and the name is displayed in black instead of blue). Control-click again to switch to normal mode.
 - Support for several variations of the [CIfTI format](https://www.humanconnectome.org/software/get-connectome-workbench.html)(dscalar.nii, dlabel.nii, dtseries.nii).

30-September-2016
 - Add support for the TRK.GZ (DSI studio), DAT (MRI studio) formats.
 - Support for tracks with [scalars](https://github.com/johncolby/along-tract-stats) and [properties](http://trackvis.org/blog/tag/track_merge/).
 - "Faster" track viewing mode looks better (Lucas Nesi's imposter method).

20-April-2016
 - Add support for the 3DS, MS3D, LWO2, DXF and GTS formats.

##### License

This software includes a [BSD license](https://opensource.org/licenses/BSD-2-Clause)
