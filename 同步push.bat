@echo off
setlocal

echo === ��ʼͬ�� Obsidian �� emaryblog/example ===

:: ����·�����������ʵ��·���޸ģ�
set OBSIDIAN_DIR=C:\Users\Administrator\Desktop\�ʼǲֿ�\blog
set BLOG_DIR=C:\Users\Administrator\Desktop\blog\emaryblog
set TARGET_DIR=%BLOG_DIR%\example

:: ʹ�� robocopy ͬ���������Ʊ䶯�ļ������� .git �� .obsidian �ļ���
echo ʹ�� robocopy ͬ���������Ʊ䶯�ļ�...
robocopy "%OBSIDIAN_DIR%" "%TARGET_DIR%" /MIR /FFT /Z /XA:H /W:1 /R:1 /XD ".git" ".obsidian"

:: ���벩��Ŀ¼
cd /d "%BLOG_DIR%"

:: Git �ύ������
echo ��Ӳ��ύ Git ���...
git add example
git commit -m "?? ͬ�� Obsidian ���� %DATE% %TIME%" || echo û�б�����ύ

echo ���͵� GitHub...
git push origin master

echo === ͬ����� ? ===
pause
