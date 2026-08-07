# 安装指南

## 方法一：手动加载（推荐用于测试）

1. 将 `blocknum_auto.lsp` 文件放到任意位置
2. 打开 AutoCAD
3. 在命令行输入：`APPLOAD`
4. 在弹出的对话框中选择 `blocknum_auto.lsp` 文件
5. 点击"加载"按钮
6. 看到提示"自动编号工具已加载"即成功
7. 输入 `BN` 开始使用

## 方法二：自动加载（推荐用于常用）

### 将文件放到 AutoCAD 支持路径

1. 找到 AutoCAD 安装目录下的 `Support` 文件夹
   - 通常路径：`C:\Program Files\Autodesk\AutoCAD 20xx\Support\`

2. 将 `blocknum_auto.lsp` 复制到该文件夹

3. 创建或编辑 `acad.lsp` 文件（在同目录下）：
   ```
   (if (findfile "blocknum_auto.lsp")
     (load "blocknum_auto.lsp")
   )
   ```

4. 重启 AutoCAD，脚本会自动加载

## 方法三：从启动套件加载

1. 在 AutoCAD 中输入 `OPTIONS` 命令
2. 选择"文件"选项卡
3. 展开"支持文件搜索路径"
4. 点击"添加"按钮
5. 浏览到存放 `blocknum_auto.lsp` 的文件夹
6. 点击"应用"和"确定"
7. 重启 AutoCAD

## 验证安装

安装完成后，在命令行输入：
```
BN
```

如果看到使用提示，说明安装成功！

## 常见问题

**Q: 加载后没有反应？**
A: 检查命令行是否显示加载信息，或重新输入 `APPLOAD` 命令确认文件已加载。

**Q: 提示文件损坏？**
A: 确保下载的文件完整，重新下载原始文件。

**Q: 想每次自动启动？**
A: 使用方法二中的自动加载设置。

## 卸载

1. 输入 `APPLOAD` 命令
2. 在加载列表中选择 `blocknum_auto.lsp`
3. 点击"卸载"按钮
4. 如需删除文件，直接删除 `.lsp` 文件即可