﻿
$ErrorActionPreference = 'Stop';

$os = If ($isWindows) {"windows"} Else {"linux"}
if (${env:ARCH} -eq "amd64") {
  docker build --pull -t local_image:$os-${env:ARCH} --build-arg "runtime=3.0-bionic" --build-arg "version=$env:APPVEYOR_BUILD_NUMBER" .
} else {
  docker build --pull -t local_image:$os-${env:ARCH} --build-arg "runtime=3.0-bionic-$env:ARCH" --build-arg "version=$env:APPVEYOR_BUILD_NUMBER" .
}