@echo off
:: Package css
echo ----------------------
echo Pckage css...
echo ----------------------
call ant -buildfile css\build.xml

:: Get current dirname
set "cd_=%cd%"
:loop
set "cd_=%cd_:*\=%"
set "cd_tmp=%cd_:\=%"
if not "%cd_tmp%"=="%cd_%" goto loop
mkdir "build\compile\zip\"%cd_%

:: Compile templates
echo ----------------------
echo Compile templates...
echo ----------------------
call ant -buildfile build\build.xml -Dbuild.dir.zip=compile\zip\%cd_% -Dzip.name=%cd_%

:: Release package
echo ----------------------
echo Release package...
echo ----------------------
call ant -buildfile build\build.xml fnt.release -Dbuild.dir.zip=compile\zip\%cd_%

:: Clear file
echo ----------------------
echo Clear file...
echo ----------------------
call ant -buildfile build\build.xml fnt.clear -Dbuild.dir.zip=compile\zip\%cd_%
