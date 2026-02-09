FROM emscripten/emsdk:5.0.0

RUN apt-get update && apt-get install -y \
    cmake \
    python3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src
