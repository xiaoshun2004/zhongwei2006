@echo off
chcp 65001 >nul
echo ===============================================
echo 🔧 Netlify部署问题修复工具 v2.0
echo ===============================================
echo.

echo 📋 正在诊断部署问题...
echo.

REM 检查关键文件是否存在
echo 🔍 检查文件完整性:
if exist "index.html" (
    echo ✅ index.html - 存在
) else (
    echo ❌ index.html - 缺失
    set /a missing_files+=1
)

if exist "css\style.css" (
    echo ✅ css\style.css - 存在
) else (
    echo ❌ css\style.css - 缺失
    set /a missing_files+=1
)

if exist "js\script.js" (
    echo ✅ js\script.js - 存在
) else (
    echo ❌ js\script.js - 缺失
    set /a missing_files+=1
)

if exist "images\19yearrs.png" (
    echo ✅ images\19yearrs.png - 存在
) else (
    echo ❌ images\19yearrs.png - 缺失
    set /a missing_files+=1
)

echo.

REM 创建诊断页面
echo 🛠️ 创建部署诊断页面...
copy "netlify-fix.html" "部署诊断.html" >nul 2>&1
if exist "部署诊断.html" (
    echo ✅ 已创建 部署诊断.html
    echo    👉 将此文件也上传到Netlify，用于在线诊断问题
) else (
    echo ❌ 诊断页面创建失败
)

echo.

REM 根据搜索结果提供具体解决方案
echo 🎯 Netlify部署问题常见解决方案:
echo.
echo 【问题1: CSS和图片不显示】
echo 💡 解决方案:
echo    1. 确保Netlify发布目录设置为空（根目录"/"）
echo    2. 检查所有文件路径使用相对路径（不以/开头）
echo    3. 确认文件名大小写完全一致
echo    4. 重新拖拽整个项目文件夹到Netlify
echo.

echo 【问题2: 部分文件缺失】
echo 💡 解决方案:
echo    1. 检查.gitignore文件，确保未排除必要文件
echo    2. 手动压缩项目为ZIP，然后拖拽到Netlify
echo    3. 确保所有图片、CSS、JS文件都在正确位置
echo.

echo 【问题3: 缓存问题】
echo 💡 解决方案:
echo    1. 浏览器强制刷新 (Ctrl+F5 或 Cmd+Shift+R)
echo    2. 清除浏览器缓存和Cookie
echo    3. 在Netlify后台重新触发部署
echo    4. 等待3-5分钟让CDN更新
echo.

REM 创建修复版本的压缩包
echo 📦 创建修复版部署包...

REM 检查PowerShell是否可用
powershell -Command "Get-Command Compress-Archive" >nul 2>&1
if %errorlevel% equ 0 (
    echo 正在打包所有文件...
    powershell -Command "Compress-Archive -Path '*.html', 'css', 'js', 'images', '*.md' -DestinationPath '修复版-企业官网.zip' -Force"
    if exist "修复版-企业官网.zip" (
        echo ✅ 已创建: 修复版-企业官网.zip
        echo    👉 建议上传此压缩包到Netlify
    ) else (
        echo ❌ 压缩包创建失败
    )
) else (
    echo ⚠️  PowerShell不可用，请手动创建压缩包
)

echo.

REM Netlify特定建议
echo 🌐 Netlify部署专用建议:
echo.
echo 📌 部署设置检查:
echo    • 构建命令: 留空（静态网站）
echo    • 发布目录: 留空或"/"（根目录）
echo    • 基础目录: 留空
echo.
echo 📌 上传方式:
echo    1. 首选: 拖拽整个文件夹到Netlify控制台
echo    2. 备选: 上传ZIP压缩包（解压后自动部署）
echo    3. Git: 确保所有文件都已推送到仓库
echo.
echo 📌 常见错误修复:
echo    • 如果看到"优质企业"显示但无样式 → CSS路径问题
echo    • 如果图片显示空白或X → 图片路径或文件缺失
echo    • 如果页面完全空白 → index.html位置错误
echo.

echo 🔗 测试建议:
echo    1. 本地测试: 在项目根目录运行HTTP服务器
echo    2. 在线测试: 上传"部署诊断.html"检测具体问题
echo    3. 网络检测: 在浏览器开发者工具查看404错误
echo.

echo 📞 如果问题持续存在:
echo    1. 检查Netlify部署日志是否有错误
echo    2. 确认域名解析是否完成（通常需要几分钟）
echo    3. 尝试私人/无痕浏览模式测试
echo    4. 联系Netlify客服或查看社区论坛
echo.

echo ===============================================
echo ✨ 修复完成！请按照上述建议操作
echo ===============================================
echo.

echo 📋 操作清单:
echo □ 1. 检查Netlify发布目录设置（应为空或"/"）
echo □ 2. 上传"修复版-企业官网.zip"或重新拖拽文件夹
echo □ 3. 等待部署完成（2-5分钟）
echo □ 4. 强制刷新浏览器测试
echo □ 5. 如有问题，上传"部署诊断.html"进行在线检测
echo.

pause
echo.
echo 🌐 正在打开Netlify控制台...
start https://app.netlify.com/

if exist "部署诊断.html" (
    echo.
    echo 🔧 正在打开本地诊断页面...
    start "部署诊断.html"
) 