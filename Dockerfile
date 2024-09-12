# Node.js 18.19 pre-installed on Alpine Linux 3.19 (Python 3.11.x)
FROM node:18.19.0-alpine3.19 as devel-base

# Install Alpine and Python utilities
# Refs:
# Pillow install on Alpine: https://github.com/python-pillow/docker-images/blob/main/alpine/Dockerfile
# numpy install on Alpine: https://stackoverflow.com/a/50443531
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add --no-cache --update  \
    alpine-sdk  \
    wget  \
    ca-certificates  \
    musl-dev  \
    libc-dev gcc  \
    python3-dev  \
    bash  \
    linux-headers  \
    python3  \
    py3-pip  \
    cargo  \
    make  \
    cmake  \
    py3-numpy \
    freetype-dev \
    fribidi-dev \
    harfbuzz-dev \
    jpeg-dev \
    lcms2-dev \
    libimagequant-dev \
    openjpeg-dev \
    tcl-dev \
    tiff-dev \
    tk-dev \
    zlib-dev \
    rclone \
    ffmpeg

# Install pm2
RUN npm install pm2 -g

# Create virtual environment for Python
RUN python3 -m venv /app/venv
RUN . /app/venv/bin/activate

# Install Python requirements
# Ref: https://github.com/python-pillow/Pillow/issues/1763
RUN LIBRARY_PATH=/lib:/usr/lib /bin/sh -c "/app/venv/bin/pip install --no-cache-dir setuptools_rust" # https://github.com/docker/compose/issues/8105#issuecomment-775931324
RUN LIBRARY_PATH=/lib:/usr/lib /bin/sh -c "/app/venv/bin/pip install --no-cache-dir asyncio~=3.4 confuse==2.0.1 PyYAML==6.0.* psutil==5.9.8 emoji==2.11.1 matplotlib==3.9.2 pydantic==2.6.*"

# Set up environment variables
ENV AM_I_IN_A_DOCKER_CONTAINER=Yes

CMD ["echo", "Hello Docker"]
