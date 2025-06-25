# 🚀 Git自动部署设置指南

## 🎯 目标效果

设置完成后，您只需要：
1. 本地修改文件
2. `git add .` → `git commit -m "更新内容"` → `git push`
3. 网站自动更新！✨

## 📋 设置步骤

### 步骤1: 删除当前手动部署的网站

1. 登录 [Netlify控制台](https://app.netlify.com/)
2. 进入您的网站 `loquacious-treacle-59fa17`
3. 点击 **Site settings** → **General**
4. 滚动到底部，点击 **Delete this site**
5. 输入网站名称确认删除

### 步骤2: 创建新的Git连接网站

1. 在Netlify首页点击 **New site from Git**
2. 选择 **GitHub** 
3. 授权Netlify访问您的GitHub账户
4. 选择仓库 `xiaoshun2004/zhongwei2006`
5. 配置部署设置：
   ```
   Branch to deploy: main
   Build command: (留空)
   Publish directory: (留空)
   ```
6. 点击 **Deploy site**

### 步骤3: 配置自定义域名（可选）

1. 部署完成后，进入 **Site settings** → **Domain management**
2. 点击 **Add custom domain**
3. 输入您的域名（如果有的话）

## 🔧 日常更新流程

### 本地修改文件
```bash
# 1. 修改任何文件（HTML、CSS、图片等）
# 2. 提交更改
git add .
git commit -m "更新：修改了首页样式"
git push

# 3. 等待1-2分钟，网站自动更新！
```

### 常用Git命令
```bash
# 查看文件状态
git status

# 添加所有修改的文件
git add .

# 提交更改（附带说明）
git commit -m "你的更新说明"

# 推送到GitHub（触发自动部署）
git push

# 查看提交历史
git log --oneline

# 回退到上一个版本（如果需要）
git reset --hard HEAD~1
```

## 📱 部署状态监控

### Netlify部署通知
1. 每次推送后，GitHub会自动触发Netlify部署
2. 您可以在Netlify控制台看到部署进度
3. 部署成功/失败都会有通知

### 部署时间
- **首次部署**: 2-5分钟
- **后续更新**: 30秒-2分钟
- **大文件更新**: 可能需要更长时间

## 🎨 实战演示

让我们现在就设置自动部署！

### 示例1: 修改首页标题
```html
<!-- 修改 index.html -->
<title>LED导光板专家 - 18年专业技术</title>
```

### 示例2: 更新产品信息
```html
<!-- 修改 products.html -->
<h2>2024年最新LED导光板产品</h2>
```

### 示例3: 调整样式
```css
/* 修改 css/style.css */
.hero-banner {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}
```

## 🛠️ 高级功能

### 分支部署
```bash
# 创建开发分支
git checkout -b dev
git push -u origin dev

# 在Netlify可以设置预览环境
# dev分支 → 预览网站
# main分支 → 正式网站
```

### 回滚部署
```bash
# 方法1: Git回退
git revert HEAD
git push

# 方法2: Netlify控制台
# 在Deploys页面点击历史版本的"Publish deploy"
```

### 环境变量
```bash
# 在Netlify设置环境变量
# Site settings → Environment variables
# 可以设置不同环境的配置
```

## 🚨 常见问题

### Q: 推送后网站没有更新？
**A**: 检查以下几点：
1. 确认推送成功：`git log --oneline`
2. 查看Netlify部署日志是否有错误
3. 等待2-3分钟（可能有延迟）
4. 强制刷新浏览器（Ctrl+F5）

### Q: 部署失败怎么办？
**A**: 
1. 检查Netlify部署日志
2. 确认文件路径和名称正确
3. 检查是否有语法错误
4. 尝试重新触发部署

### Q: 如何同步多台电脑的代码？
**A**:
```bash
# 在新电脑上
git clone https://github.com/xiaoshun2004/zhongwei2006.git
cd zhongwei2006

# 获取最新代码
git pull origin main
```

## 📊 部署方式对比

| 功能 | 手动上传 | Git自动部署 |
|------|----------|-------------|
| 更新方式 | 重新上传 | git push |
| 版本控制 | ❌ | ✅ |
| 回滚 | ❌ | ✅ |
| 协作 | ❌ | ✅ |
| 自动化 | ❌ | ✅ |
| 适用场景 | 一次性项目 | 持续维护 |

## 🎉 设置完成后的好处

- 🚀 **极速更新**: 30秒完成网站更新
- 📱 **移动办公**: 任何地方都能更新网站
- 🔄 **自动备份**: 每次更改都有完整记录
- 👥 **团队协作**: 多人可以同时开发
- 🛡️ **安全可靠**: 出错可以立即回滚

---

**🔗 设置链接**:
- [Netlify新建网站](https://app.netlify.com/sites)
- [GitHub仓库](https://github.com/xiaoshun2004/zhongwei2006)

设置完成后，您的工作流程将变得非常高效！🎯 