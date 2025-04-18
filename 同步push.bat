@echo off
setlocal

echo === 开始同步 Obsidian 到 emaryblog/example ===

:: 设置路径（请根据你实际路径修改）
set OBSIDIAN_DIR=C:\Users\Administrator\Desktop\笔记仓库\blog
set BLOG_DIR=C:\Users\Administrator\Desktop\blog\emaryblog
set TARGET_DIR=%BLOG_DIR%\example

:: 使用 robocopy 同步，仅复制变动文件，跳过 .git 和 .obsidian 文件夹
echo 使用 robocopy 同步，仅复制变动文件...
robocopy "%OBSIDIAN_DIR%" "%TARGET_DIR%" /MIR /FFT /Z /XA:H /W:1 /R:1 /XD ".git" ".obsidian"

:: 进入博客目录
cd /d "%BLOG_DIR%"

:: Git 提交并推送
echo 添加并提交 Git 变更...
git add example
git commit -m "?? 同步 Obsidian 内容 %DATE% %TIME%" || echo 没有变更可提交

echo 推送到 GitHub...
git push origin master

echo === 同步完成 ? ===
pause
