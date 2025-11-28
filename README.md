#  Kimura Batch Downloader (yt-dlp Wrapper)

**A lightweight, portable, and error-proof video downloader script based on yt-dlp.** *Sebuah script downloader ringan, portable, dan anti-error berbasis yt-dlp.*

##  Description

This project is a custom Windows Batch Script (`.bat`) designed to simplify the usage of [yt-dlp](https://github.com/yt-dlp/yt-dlp). It solves common issues found in CLI usage, such as complex command typing and Windows "Filename too long" errors.

This tool is designed to be **100% Portable**—you can run it from a USB drive or any folder without installing Python or setting up System PATH variables.

##  Key Features (Fitur Utama)

*  Safe Filename System (Auto-Trim):** Automatically cuts filenames to 80 characters to prevent Windows `[Errno 22] Invalid argument` errors when downloading videos with long captions (like Facebook Reels or TikTok).
*  Fully Portable:** Uses `cd /d "%~dp0"` logic, allowing the script to run from anywhere (Drive D:, USB, etc.) immediately.
*  Smart Resolution Selector:**
    * **Max/4K:** Best video + best audio.
    * **1080p & 720p:** Auto-fallback if the specific resolution is unavailable.
    * **Data Saver:** Automatically finds the smallest resolution available.
*  TikTok Slideshow Support:** Converts TikTok Photo Slideshows into standard MP4 video format (preserves audio).
*  Audio Mode:** Extracts and converts audio to MP3.

## Requirements (Persyaratan)

To use this script, you need the following "engines" in the same folder:
* Windows 10 / 11
* `yt-dlp.exe`
* `ffmpeg.exe` & `ffprobe.exe`

## Installation (Cara Instalasi)

1.  **Download this repository** (the `.bat` file).
2.  **Download yt-dlp:** Get the latest `yt-dlp.exe` from the [Official Release](https://github.com/yt-dlp/yt-dlp/releases).
3.  **Download FFmpeg:** Get the "Essentials Build" from [Gyan.dev](https://www.gyan.dev/ffmpeg/builds/). Extract `ffmpeg.exe` and `ffprobe.exe` from the `bin` folder.
4.  **Organize Files:** Put all files into **ONE FOLDER**. The structure must look like this:

```text
MyDownloader/
├── Beta.bat          <-- The script from this repo
├── yt-dlp.exe        <-- Engine
├── ffmpeg.exe        <-- For video processing
└── ffprobe.exe       <-- For metadata
