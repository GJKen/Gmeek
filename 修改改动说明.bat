@echo off
echo 修改改动说明
set /p info="输入更新的信息(例如:update %date:~0,10% %time:~0,5%):"

if "%info%"=="" (
    echo 提交说明不能为空
    timeout /t 3 /nobreak >nul
    exit /b 1
)

git commit --amend -m "%info%"
if errorlevel 1 (
    echo 修改失败
    pause
    exit /b 1
)

git push --force-with-lease
if errorlevel 1 (
    echo 推送失败
    pause
    exit /b 1
)

echo 已完成,3秒后关闭
timeout /t 3 /nobreak >nul
exit