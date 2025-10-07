try {
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
    $target = Join-Path $scriptDir 'gradle\wrapper'
    if (-not (Test-Path $target)) { New-Item -ItemType Directory -Path $target -Force | Out-Null }

    $gradleVersion = '8.5'
    $distUrl = "https://services.gradle.org/distributions/gradle-$gradleVersion-bin.zip"
    $tmp = Join-Path $scriptDir ('gradle-dist-' + [System.Guid]::NewGuid().ToString())
    $zipPath = Join-Path $tmp ('gradle-' + $gradleVersion + '.zip')
    New-Item -ItemType Directory -Path $tmp -Force | Out-Null

    Write-Output "Downloading Gradle $gradleVersion distribution to $zipPath ..."
    Invoke-WebRequest -Uri $distUrl -OutFile $zipPath -UseBasicParsing -ErrorAction Stop

    Write-Output "Extracting distribution..."
    Expand-Archive -Path $zipPath -DestinationPath $tmp -Force

    Write-Output "Searching for gradle-wrapper jar inside distribution..."
    $found = Get-ChildItem -Path $tmp -Recurse -Filter 'gradle-wrapper*.jar' -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $found) {
        Write-Error "Could not find gradle-wrapper jar inside the distribution."
        Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue
        exit 1
    }

    $out = Join-Path $target 'gradle-wrapper.jar'
    Copy-Item -Path $found.FullName -Destination $out -Force
    Write-Output "Copied gradle-wrapper.jar to $out"

    # cleanup
    Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue

    exit 0
} catch {
    Write-Error "Failed to bootstrap gradle wrapper: $_"
    exit 1
}
