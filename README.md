# Python + Node Docker Base Image

This repo contains Docker images that are used by [Tauticord](https://github.com/nwithan8/tauticord).

Images are based on `node:18.19.0-alpine3.19`, which is based on Alpine 3.19 and contain the following:

Via base image:

- Node 18.19.0
- Python 3.11.x

Via `apk`:

- alpine-sdk
- wget
- ca-certificates
- musl-dev
- libc-dev gcc
- python3-dev
- bash
- linux-headers
- py3-pip
- cargo
- make
- cmake
- py3-numpy
- freetype-dev
- fribidi-dev
- harfbuzz-dev
- jpeg-dev
- lcms2-dev
- libimagequant-dev
- openjpeg-dev
- tcl-dev
- tiff-dev
- tk-dev
- zlib-dev

Via `pip`:

- PyYAML
- psutil
- matplotlib
- pydantic-core
- aiohttp
- contourpy
- kiwisolver
- numpy
- pillow

Via `npm`:

- pm2

## Usage

Virtual environment for Python with installed packages is available at '/app/venv'. To use it, copy Python code to `/app` and run it with `/app/venv/bin/python`.
