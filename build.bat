@echo off
:: 构建css
echo ----------------------
echo 正在构建css...
echo ----------------------
call ant -buildfile css\build.xml

:: 获取当前目录名
set "cd_=%cd%"
:loop
set "cd_=%cd_:*\=%"
set "cd_tmp=%cd_:\=%"
if not "%cd_tmp%"=="%cd_%" goto loop
mkdir "build\compile\zip\"%cd_%

:: 构建模板页
echo ----------------------
echo 正在构建模板页...
echo ----------------------
call ant -buildfile build\build.xml -Dbuild.dir.zip=compile\zip\%cd_% -Dzip.name=%cd_%

:: 上传压缩包
echo ----------------------
echo 正在上传压缩包...
echo ----------------------
call ant -buildfile build\build.xml fnt.release -Dbuild.dir.zip=compile\zip\%cd_%

:: 清理文件
echo ----------------------
echo 正在清理文件...
echo ----------------------
call ant -buildfile build\build.xml fnt.clear -Dbuild.dir.zip=compile\zip\%cd_%
