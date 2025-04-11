execute FTK Imager.exe from a command line with admin rights otherwise it could get blocked

follow the instructions to acquire an image of the hard drive:
https://www.sans.org/blog/forensics-101-acquiring-an-image-with-ftk-imager/

use E01 instead of Raw (dd)
make sure enough disk space is available on the target drive to store the whole hard drive of the machine
if the hard drive is bitlocker encrypted only image the "Logical Drive" otherwise "Physical Drive" is prefered