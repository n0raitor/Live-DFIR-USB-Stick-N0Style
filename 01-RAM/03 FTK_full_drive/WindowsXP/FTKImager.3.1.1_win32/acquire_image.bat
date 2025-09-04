%~d0
cd %~dp0
set /p "drive=Enter Drive: "
ftkimager.exe %drive% ..\ftk_image --e01 --compress 6
pause