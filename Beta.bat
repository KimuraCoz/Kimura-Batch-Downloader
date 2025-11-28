@echo off
title Downloader V10 - Safe Filename (Kimura)
color 0B

:: --- SETTING PORTABLE ---
cd /d "%~dp0"
set "LOKASI=D:\Penyimpanan Utama Kimura\Download"

:: --- SETTING NAMA FILE AMAN (AUTO TRIM) ---
:: Logika: Ambil Judul max 80 huruf + ID Unik.
:: Ini mencegah error "Filename too long" pada video Facebook/TikTok caption panjang.
set "SAFE_NAME=-o "%%(title).80s [%%(id)s].%%(ext)s""

:MAIN_MENU
cls
echo ==================================================
echo      DOWNLOADER
echo ==================================================
echo.

set /p "url=Paste Link : "

echo.
echo ==================================================
echo [1] VIDEO BIASA  (4K/HD/SD + Auto Trim Name)
echo [2] AUDIO ONLY   (MP3)
echo [3] TIKTOK FOTO  (Slideshow Support)
echo ==================================================
echo.

set /p "mode=Pilih Mode (1-3) : "

if "%mode%"=="3" goto DOWNLOAD_FOTO
if "%mode%"=="2" goto DOWNLOAD_AUDIO
if "%mode%"=="1" goto MENU_KUALITAS
goto MAIN_MENU

:MENU_KUALITAS
cls
echo ==================================================
echo           PILIH RESOLUSI VIDEO
echo ==================================================
echo [1] Max/4K
echo [2] Full HD (1080p)
echo [3] HD (720p)       - Hemat
echo [4] PALING IRIT     (Resolution Terkecil)
echo ==================================================
echo.
set /p "kualitas=Pilih (1-4) : "

echo.
echo Sedang memproses Video...
echo --------------------------------------------------

:: Kita masukkan variable %SAFE_NAME% di setiap perintah

if "%kualitas%"=="1" (
    yt-dlp.exe %SAFE_NAME% -P "%LOKASI%" --remux-video mp4 "%url%"
) else if "%kualitas%"=="2" (
    yt-dlp.exe %SAFE_NAME% -P "%LOKASI%" -f "bv*[height<=1080]+ba/b[height<=1080]/best" --remux-video mp4 "%url%"
) else if "%kualitas%"=="3" (
    yt-dlp.exe %SAFE_NAME% -P "%LOKASI%" -f "bv*[height<=720]+ba/b[height<=720]/best" --remux-video mp4 "%url%"
) else if "%kualitas%"=="4" (
    yt-dlp.exe %SAFE_NAME% -P "%LOKASI%" -S "+res" --remux-video mp4 "%url%"
) else (
    goto MENU_KUALITAS
)
if %errorlevel% neq 0 goto ERROR_HANDLER
goto SELESAI

:DOWNLOAD_FOTO
echo.
echo Sedang mengambil Slide Foto...
:: Mode Foto juga butuh Safe Name karena caption TikTok sering panjang
yt-dlp.exe %SAFE_NAME% -P "%LOKASI%" --remux-video mp4 "%url%"
if %errorlevel% neq 0 goto ERROR_HANDLER
goto SELESAI

:DOWNLOAD_AUDIO
echo.
echo Sedang convert ke MP3...
yt-dlp.exe %SAFE_NAME% -P "%LOKASI%" -x --audio-format mp3 "%url%"
if %errorlevel% neq 0 goto ERROR_HANDLER
goto SELESAI

:ERROR_HANDLER
color 0C
echo.
echo [X] GAGAL / ERROR!
pause
color 0B
goto MAIN_MENU

:SELESAI
color 0A
echo.
echo [V] SUKSES!
pause
goto MAIN_MENU