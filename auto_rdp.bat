@echo off

set "github_repo=https://github.com/sebaxakerhtc/rdpwrap.ini.git"
set "local_dir=C:\Program Files\RDP Wrapper"
set "temp_dir=C:\puzzle\download\rdpwrap_update"

if not exist %temp_dir% (
    echo 正在克隆仓库...
    git clone %github_repo% %temp_dir% > nul 2>&1

    if not exist %temp_dir%\rdpwrap.ini (
        echo 克隆仓库失败，请确保已安装Git并且仓库地址正确。
        exit /b 1
    )
) else (
    echo 更新本地仓库...
    cd %temp_dir%
    git pull > nul 2>&1

    if errorlevel 1 (
        echo 拉取更新失败，请确保已安装Git并且仓库地址正确。
        exit /b 1
    )
)

echo 正在移动文件...
copy /Y "%temp_dir%\rdpwrap.ini" "%local_dir%" > nul 2>&1

if errorlevel 1 (
    echo 移动文件失败，请检查文件是否被占用。
    exit /b 1
)

echo 操作完成。
exit /b 0
