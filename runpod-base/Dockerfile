ARG PYTORCH_TAG="2.4.0-cuda12.1-cudnn9-runtime"

#
# Build caddy
#
ARG CADDY_VERSION=2.8.4
FROM caddy:${CADDY_VERSION}-builder AS caddy-builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav

#
# The actual image
#
FROM pytorch/pytorch:${PYTORCH_TAG}
ARG S6_OVERLAY_VERSION=3.2.0.0

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl wget git rsync ca-certificates \
    \
    iproute2 openssh-server \
    \
    nano mg lsof less file tree \
    \
    libgl1 libglib2.0-0


RUN mkdir -p /tmp/dist \
    && curl -fsSL -o /tmp/dist/s6-overlay-noarch.tar.xz https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz \
    && curl -fsSL -o /tmp/dist/s6-overlay-x86_64.tar.xz https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz \
    && tar -C / -Jxpf /tmp/dist/s6-overlay-noarch.tar.xz \
    && tar -C / -Jxpf /tmp/dist/s6-overlay-x86_64.tar.xz \
    && echo rm -rf /tmp/dist

COPY --from=caddy-builder /usr/bin/caddy /usr/local/bin/caddy

ENV S6_KEEP_ENV=1
ENTRYPOINT ["/init"]

ARG CONTAINER_UID=1000
# Run and own only the runtime files as a non-root user for security
RUN useradd user --create-home --shell /bin/bash --uid ${CONTAINER_UID} -o \
    && mkdir -p /workspace \
    && chown user:user /workspace



RUN conda init bash
RUN conda install -c conda-forge -y \
    jupyterlab ipywidgets jupyter-archive jupyter_contrib_nbextensions \
    && conda clean --all --force-pkgs-dirs

ADD ./overlay/ /

USER user
RUN jupyter contrib nbextension install --user && \
    jupyter nbextension enable --py widgetsnbextension
USER root

EXPOSE 21
EXPOSE 8001

ARG VERSION='unknown'
ENV RUNPOD_BASE_VERSION=${VERSION}
RUN echo "${RUNPOD_BASE_VERSION}" > /etc/runpod-base-version

CMD ["/bin/sleep", "infinity"]
