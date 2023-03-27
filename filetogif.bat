setlocal EnableDelayedExpansion
set /p FileType="File Type: "

ren "output.gif" "output-!RANDOM!.gif"
if exist "input.%FileType%" (
    ffmpeg -i "input.%FileType%" "output.gif"
) else (
    rem No target file found!
)
ren "input.%FileType%" "input-!RANDOM!.%FileType%"
timeout /t 2
endlocal