@echo off
chcp 65001 >nul
echo.
echo ========================================
echo      修复网站部署问题 - 诊断工具
echo ========================================
echo.

echo 🔍 正在诊断问题...
echo.

echo 📁 检查文件结构：
if exist "index.html" (echo ✅ index.html - 存在) else (echo ❌ index.html - 缺失)
if exist "about.html" (echo ✅ about.html - 存在) else (echo ❌ about.html - 缺失)
if exist "products.html" (echo ✅ products.html - 存在) else (echo ❌ products.html - 缺失)
if exist "contact.html" (echo ✅ contact.html - 存在) else (echo ❌ contact.html - 缺失)

echo.
echo 📂 检查文件夹：
if exist "css" (echo ✅ css文件夹 - 存在) else (echo ❌ css文件夹 - 缺失)
if exist "js" (echo ✅ js文件夹 - 存在) else (echo ❌ js文件夹 - 缺失)
if exist "images" (echo ✅ images文件夹 - 存在) else (echo ❌ images文件夹 - 缺失)

echo.
echo 🖼️  检查关键图片：
if exist "images\19yearrs.png" (echo ✅ 19yearrs.png - 存在 ^(%~z1 bytes^)) else (echo ❌ 19yearrs.png - 缺失)
if exist "images\factory1.jpg" (echo ✅ factory1.jpg - 存在) else (echo ❌ factory1.jpg - 缺失)
if exist "images\factory2.jpg" (echo ✅ factory2.jpg - 存在) else (echo ❌ factory2.jpg - 缺失)
if exist "images\prod1.jpg" (echo ✅ prod1.jpg - 存在) else (echo ❌ prod1.jpg - 缺失)
if exist "images\prod2.jpg" (echo ✅ prod2.jpg - 存在) else (echo ❌ prod2.jpg - 缺失)
if exist "images\prod3.jpg" (echo ✅ prod3.jpg - 存在) else (echo ❌ prod3.jpg - 缺失)
if exist "images\prod4.jpg" (echo ✅ prod4.jpg - 存在) else (echo ❌ prod4.jpg - 缺失)
if exist "images\prod5.jpg" (echo ✅ prod5.jpg - 存在) else (echo ❌ prod5.jpg - 缺失)

echo.
echo 🎨 检查样式文件：
if exist "css\style.css" (echo ✅ style.css - 存在) else (echo ❌ style.css - 缺失)

echo.
echo 📜 检查脚本文件：
if exist "js\script.js" (echo ✅ script.js - 存在) else (echo ❌ script.js - 缺失)

echo.
echo ========================================
echo              修复建议
echo ========================================
echo.
echo 💡 常见问题解决方案：
echo.
echo 1. 📦 重新打包部署：
echo    - 确保所有文件都包含在压缩包中
echo    - 重新拖拽到Netlify进行部署
echo.
echo 2. 🌐 清理浏览器缓存：
echo    - 按 Ctrl+F5 强制刷新页面
echo    - 或在浏览器中清理缓存
echo.
echo 3. ⏰ 等待传播：
echo    - 部署可能需要几分钟生效
echo    - 稍等片刻再访问
echo.
echo 4. 📂 手动检查部署：
echo    - 在Netlify后台检查文件是否完整上传
echo    - 查看部署日志是否有错误
echo.

set "timestamp=%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%"
set "timestamp=%timestamp: =0%"
set "fixpack=LED导光板企业官网_修复版_%timestamp%.zip"

echo 🔧 是否重新打包修复版？(Y/N)
set /p rebuild="请选择: "

if /i "%rebuild%"=="Y" (
    echo.
    echo 📦 正在创建修复版压缩包...
    powershell -Command "Compress-Archive -Path '*.html', 'css', 'js', 'images' -DestinationPath '%fixpack%' -Force"
    
    if exist "%fixpack%" (
        echo ✅ 修复版创建成功：%fixpack%
        echo.
        echo 🚀 重新部署步骤：
        echo    1. 访问 https://app.netlify.com/sites/loquacious-treacle-59fa17/deploys
        echo    2. 点击 "Deploy site" 按钮
        echo    3. 拖拽 %fixpack% 文件
        echo    4. 等待部署完成
        echo.
        
        set /p open="是否打开文件位置？(Y/N): "
        if /i "%open%"=="Y" (
            explorer .
        )
    ) else (
        echo ❌ 创建失败
    )
)

echo.
echo 🔗 您的网站地址：
echo https://loquacious-treacle-59fa17.netlify.app
echo.
echo 按任意键退出...
pause >nul 