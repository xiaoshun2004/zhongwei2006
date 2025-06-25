@echo off
chcp 65001 >nul
echo.
echo ========================================
echo    LED导光板企业官网 - 快速部署打包
echo ========================================
echo.

echo 📦 正在检查文件...
if not exist "index.html" (
    echo ❌ 错误：未找到index.html文件
    pause
    exit /b 1
)

if not exist "css" (
    echo ❌ 错误：未找到css文件夹
    pause
    exit /b 1
)

if not exist "images" (
    echo ❌ 错误：未找到images文件夹
    pause
    exit /b 1
)

if not exist "js" (
    echo ❌ 错误：未找到js文件夹
    pause
    exit /b 1
)

echo ✅ 所有必要文件已找到
echo.

echo 🗂️  准备打包以下文件：
echo    - index.html (首页)
echo    - about.html (关于我们)
echo    - products.html (产品中心)
echo    - contact.html (联系我们)
echo    - css/ (样式文件夹)
echo    - js/ (脚本文件夹)
echo    - images/ (图片文件夹)
echo.

set "timestamp=%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%"
set "timestamp=%timestamp: =0%"
set "zipname=LED导光板企业官网_%timestamp%.zip"

echo 📦 开始打包...
echo 目标文件：%zipname%

REM 使用PowerShell创建压缩包
powershell -Command "Compress-Archive -Path '*.html', 'css', 'js', 'images' -DestinationPath '%zipname%' -Force"

if exist "%zipname%" (
    echo.
    echo ✅ 打包成功！
    echo 📁 文件位置：%cd%\%zipname%
    echo.
    echo 🚀 接下来请按照部署指南操作：
    echo    1. 访问 https://netlify.com 注册账号
    echo    2. 点击 "Sites" → "Add new site" → "Deploy manually"
    echo    3. 将 %zipname% 文件拖拽到部署区域
    echo    4. 等待部署完成
    echo.
    echo 📖 详细说明请查看：部署说明.md
    echo.
    
    REM 询问是否打开文件位置
    set /p choice="是否打开文件位置？(Y/N): "
    if /i "%choice%"=="Y" (
        explorer .
    )
    
) else (
    echo ❌ 打包失败，请检查文件权限或手动压缩
)

echo.
echo 按任意键退出...
pause >nul 