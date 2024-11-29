ARG BASE_IMAGE="ubuntu"
FROM ${BASE_IMAGE}

ARG CUDA_PATH="cu121"
ARG COMFY_VERSION='0.2.2'

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    curl ffmpeg

RUN pip install --index-url https://download.pytorch.org/whl/cu121 \
    --no-cache-dir -U xformers

ADD ./overlay/ /

RUN COMFY_VERSION=${COMFY_VERSION} /opt/scripts/install_comfyui.sh

ARG VERSION='unknown'
ENV EXPERIMENTS_VERSION=${VERSION}
RUN echo "${EXPERIMENTS_VERSION}" > /etc/experiments-version
