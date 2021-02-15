@shift /0
rem 压缩包隐藏大师v1.0

@ECHO OFF&(CD /D "%~DP0")&(>NUL 2>&1 REG QUERY "HKU\S-1-5-19")||(powershell -Command "Start-Process '%~snx0' -Verb RunAs"&&exit)
:reboot

chcp 65001

cls

@echo off
color A0
mode con lines=30 cols=100

rem 注释

@title Loading...

echo 加载中...
ping -n 2 127.0.0.1 > nul
cls

@title 压缩包隐藏大师v1.0
echo 加载成功!
echo ****************************
echo.
echo.
echo ============================
echo.
echo  压  缩  包  隐  藏  大  师
echo.
echo ============================
echo 此工具用于合并压缩包与图片文
echo 件，合并其他文件会导致打不开
echo 文件，文件损坏一律不负责。
echo.
echo 1  继续
echo.
echo 2  结束
echo.
echo ****************************

choice /C 12 /N
if %errorlevel% equ 1 (
	goto in1
) Else (
    exit
)


:in1

cls

rem 输入1

set INPUTFILE1=
set /p INPUTFILE1=第一个文件路径:

rem 判断文件是否存在
if exist %INPUTFILE1% (
echo > nul
) else (
echo 文件%INPUTFILE1%不存在
pause
goto :in1
)

:in2

cls

rem 输入2

set INPUTFILE2=
set /p INPUTFILE2=第二个文件路径:

if exist %INPUTFILE2% (
echo > nul
) else (
echo 文件%INPUTFILE2%不存在
pause
goto :in2
)

:out

cls

rem 输出

set OUTPUTFILE=
set /p OUTPUTFILE=输出文件路径:

ping -n 2 127.0.0.1 > nul

cls
copy/b %INPUTFILE1%+%INPUTFILE2% %OUTPUTFILE%

if %errorlevel% neq 0 (
    cls
    echo 任务失败
    pause
	goto reboot
) Else (
    cls
    Echo 成功隐藏压缩包
	ping -n 2 127.0.0.1 > nul
	cls
    goto deleteornot
)

:deleteornot
choice /C YN /M 是否删除源文件？Y=是，N=否 /n
if %errorlevel% equ 1 (
    echo 文件删除中
    ping -n 2 127.0.0.1 > nul
	goto del555
) Else (
    Echo 取消
    
    goto reboot
)

:del555
del /f /s /q %INPUTFILE1%
if %errorlevel% neq 0 (
    cls
    echo 失败
    pause
	goto reboot
) Else (
    echo > nul
)
del /f /s /q %INPUTFILE2%
if %errorlevel% neq 0 (
    cls
    echo 失败
    pause
	goto reboot
) Else (
    ping -n 2 127.0.0.1 > nul
    goto reboot
)


rem 你找到了彩蛋



