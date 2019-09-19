FROM microsoft/windowsservercore:ltsc2016

ARG LIBERICA_VERSION=13

RUN setx PACKAGE bellsoft-jdk%LIBERICA_VERSION%-windows-amd64.msi
RUN setx PACKAGE_URL https://download.bell-sw.com/java/%LIBERICA_VERSION%
RUN setx SHA1SUM_FILE sha1sum
RUN setx SHA1SUM_URL https://download.bell-sw.com/sha1sum/java/%LIBERICA_VERSION%

RUN powershell -Command (new-object System.Net.WebClient).DownloadFile('%PACKAGE_URL%/%PACKAGE%', 'C:\%PACKAGE%')
RUN powershell -Command (new-object System.Net.WebClient).DownloadFile('%SHA1SUM_URL%', 'C:\%SHA1SUM_FILE%')
RUN powershell -Command "$a=(Get-FileHash C:\%PACKAGE% -Algorithm SHA1).Hash; \
    $b=(Get-Content 'C:\%SHA1SUM_FILE%' | Select-String -Pattern %PACKAGE% | ConvertFrom-String -PropertyNames Hash).Hash.toUpper(); \
    If ($a -ne $b) { Write-Error 'Checksum mismatch' -ErrorAction Stop }"
RUN msiexec /quiet /i C:\%PACKAGE%
RUN del C:\%PACKAGE% C:\%SHA1SUM_FILE%

