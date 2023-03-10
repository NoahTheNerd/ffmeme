setlocal EnableDelayedExpansion
set /p FileType=<config/filetype.setting

ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=s=x:p=0 input.mp4 >> width.tmp
set /p Hi=<width.tmp

ren "output.%FileType%" "output-!RANDOM!.%FileType%"
if exist "input.%FileType%" (
    ffmpeg -i input.mp4 -i assets/speech.png -filter_complex "[1:v]scale=%Hi%:128:flags=lanczos[ovrl],[0:v][ovrl]overlay=0:0" -pix_fmt yuv420p output.mp4
) else (
    rem No target file found!
)
ren "input.%FileType%" "input-!RANDOM!.%FileType%"

del /s width.tmp>nul

timeout /t 2

endlocal