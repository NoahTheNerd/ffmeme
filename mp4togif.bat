setlocal EnableDelayedExpansion
set /p FileType=<config/filetype.setting

ren "output.gif" "output-!RANDOM!.gif"
if exist "input.mp4" (
    ffmpeg -i "input.mp4" "output.gif"
) else (
    rem No target file found!
    timeout /t 2
)
ren "input.mp4" "input-!RANDOM!.mp4"

endlocal