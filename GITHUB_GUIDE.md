# GitHub 上传指南

## 📋 准备工作

你的项目已经准备好了！项目文件夹位于：
```
C:\Users\dokidone\Desktop\AutoCAD-AutoNumber\
```

包含以下文件：
- `blocknum_auto.lsp` - 主程序脚本
- `README.md` - 项目说明文档
- `INSTALL.md` - 安装指南
- `CHANGELOG.md` - 版本更新日志
- `LICENSE` - MIT 开源协议

## 🚀 上传步骤

### 方法一：通过 GitHub 网页（最简单）

1. **登录 GitHub**
   - 访问 [github.com](https://github.com)
   - 使用你的账号登录

2. **创建新仓库**
   - 点击右上角的 "+" → "New repository"
   - 仓库名称：`AutoCAD-AutoNumber`
   - 描述：`AutoCAD 自动编号工具 - 简单实用的批量编号脚本`
   - 设为公开仓库 (Public)
   - 不要勾选 "Add a README file"（我们已经有了）
   - 点击 "Create repository"

3. **上传文件**
   - 在新创建的仓库页面，点击 "uploading an existing file"
   - 将桌面上的 `AutoCAD-AutoNumber` 文件夹中的所有文件拖拽到浏览器
   - 或逐个选择文件上传：
     - `blocknum_auto.lsp`
     - `README.md`
     - `INSTALL.md`
     - `CHANGELOG.md`
     - `LICENSE`

4. **提交更改**
   - 在页面底部填写提交信息：
     - 标题：`Initial commit: AutoCAD AutoNumber Tool v3.0`
     - 描述：`Add AutoCAD automatic numbering tool with customizable prefix and start number`
   - 点击 "Commit changes"

### 方法二：通过 Git 命令行（推荐）

1. **安装 Git**（如未安装）
   - 下载：[git-scm.com](https://git-scm.com/)
   - 使用默认设置安装

2. **在项目文件夹打开 Git Bash**
   - 进入文件夹：`C:\Users\dokidone\Desktop\AutoCAD-AutoNumber\`
   - 右键点击文件夹 → "Git Bash Here"

3. **初始化 Git 仓库**
   ```bash
   git init
   ```

4. **添加所有文件**
   ```bash
   git add .
   ```

5. **创建第一次提交**
   ```bash
   git commit -m "Initial commit: AutoCAD AutoNumber Tool v3.0"
   ```

6. **在 GitHub 创建仓库**
   - 访问 GitHub，创建新仓库（同方法一第2步）
   - 但这次勾选 "Add a README file" 创建空仓库
   - 复制仓库的 HTTPS 地址（如：`https://github.com/你的用户名/AutoCAD-AutoNumber.git`）

7. **推送到 GitHub**
   ```bash
   git remote add origin https://github.com/你的用户名/AutoCAD-AutoNumber.git
   git branch -M main
   git push -u origin main
   ```

8. **输入 GitHub 凭据**
   - 输入你的 GitHub 用户名
   - 输入你的 Personal Access Token（如启用双因素认证）

## 🎯 项目优化建议

### 添加话题标签
在 GitHub 仓库页面设置以下话题：
- `autocad`
- `autolisp`
- `cad`
- `automation`
- `numbering`
- `productivity`
- `engineering`
- `architecture`

### 设置仓库描述
在仓库 Settings → About 中添加：
- **描述**：AutoCAD 自动编号工具 - 简单实用的批量编号脚本，支持自定义前缀和起始编号
- **网站**：（可选，如果有项目主页）

### 创建 Releases
1. 在 GitHub 仓库页面点击 "Releases"
2. 点击 "Create a new release"
3. 标签版本：`v3.0`
4. 发布标题：`AutoCAD AutoNumber v3.0`
5. 描述：复制 CHANGELOG.md 中的 v3.0 内容
6. 上传 `blocknum_auto.lsp` 作为附件
7. 点击 "Publish release"

## 📢 后续推广

- 在相关论坛分享（如 CAD 论坛、工程软件社区）
- 在社交媒体分享链接
- 提交到 AutoCAD 脚本收集网站
- 邀请其他开发者贡献改进

## 🔧 维护说明

- 定期更新 CHANGELOG.md
- 回应用户的 Issues
- 审查和合并 Pull Requests
- 发布新版本时创建 Release

---

**准备好了吗？开始上传到 GitHub 吧！** 🚀