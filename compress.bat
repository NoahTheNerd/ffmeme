setlocal EnableDelayedExpansion
set /p FileType="File Type: "

ren "output.%FileType%" "output-!RANDOM!.%FileType%"
if exist "input.%FileType%" (
    ffmpeg -i "input.%FileType%" -b:v 50k -b:a 40k "output.%FileType%"
) else (
    rem No target file found!
    timeout /t 2
)
ren "input.%FileType%" "input-!RANDOM!.%FileType%"

endlocal