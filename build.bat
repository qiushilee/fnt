@echo off
:: ����css
echo ----------------------
echo ���ڹ���css...
echo ----------------------
call ant -buildfile css\build.xml

:: ��ȡ��ǰĿ¼��
set "cd_=%cd%"
:loop
set "cd_=%cd_:*\=%"
set "cd_tmp=%cd_:\=%"
if not "%cd_tmp%"=="%cd_%" goto loop
mkdir "build\compile\zip\"%cd_%

:: ����ģ��ҳ
echo ----------------------
echo ���ڹ���ģ��ҳ...
echo ----------------------
call ant -buildfile build\build.xml -Dbuild.dir.zip=compile\zip\%cd_% -Dzip.name=%cd_%

:: �ϴ�ѹ����
echo ----------------------
echo �����ϴ�ѹ����...
echo ----------------------
call ant -buildfile build\build.xml fnt.release -Dbuild.dir.zip=compile\zip\%cd_%

:: �����ļ�
echo ----------------------
echo ���������ļ�...
echo ----------------------
call ant -buildfile build\build.xml fnt.clear -Dbuild.dir.zip=compile\zip\%cd_%
