setlocal EnableDelayedExpansion

ren "output.mp4" "output-!RANDOM!.mp4"
if exist "input.mp4" (
    ffmpeg -i "input.mp4" -b:v 50k -b:a 40k "output.mp4"
) else (
    rem No target file found!
    timeout /t 2
)
ren "input.mp4" "input-!RANDOM!.mp4"

endlocal