@echo off

set "github_repo=https://github.com/sebaxakerhtc/rdpwrap.ini.git"
set "local_dir=C:\Program Files\RDP Wrapper"
set "temp_dir=C:\puzzle\download\rdpwrap_update"

if not exist %temp_dir% (
    echo ���ڿ�¡�ֿ�...
    git clone %github_repo% %temp_dir% > nul 2>&1

    if not exist %temp_dir%\rdpwrap.ini (
        echo ��¡�ֿ�ʧ�ܣ���ȷ���Ѱ�װGit���Ҳֿ��ַ��ȷ��
        exit /b 1
    )
) else (
    echo ���±��زֿ�...
    cd %temp_dir%
    git pull > nul 2>&1

    if errorlevel 1 (
        echo ��ȡ����ʧ�ܣ���ȷ���Ѱ�װGit���Ҳֿ��ַ��ȷ��
        exit /b 1
    )
)

echo �����ƶ��ļ�...
copy /Y "%temp_dir%\rdpwrap.ini" "%local_dir%" > nul 2>&1

if errorlevel 1 (
    echo �ƶ��ļ�ʧ�ܣ������ļ��Ƿ�ռ�á�
    exit /b 1
)

echo ������ɡ�
exit /b 0
