ARG DISTRO_VERSION="24.10"
ARG DISTRO="ubuntu"
FROM ${DISTRO}:${DISTRO_VERSION}

# Install Build Tools
RUN DEBIAN_FRONTEND="noninteractive" apt-get -qq update && \
    apt-get -qq -y install \
    build-essential \
    libbz2-dev \
    libonig-dev \
    lintian \
    lsb-release \
    pandoc \
    wget

ADD minisign_install.sh .
RUN bash minisign_install.sh

# Install zig
# https://ziglang.org/download/
ARG ZIG_VERSION="0.13.0"
RUN wget -q "https://ziglang.org/download/$ZIG_VERSION/zig-linux-$(uname -m)-$ZIG_VERSION.tar.xz" && \
    tar -xf "zig-linux-$(uname -m)-$ZIG_VERSION.tar.xz" -C /opt && \
    rm "zig-linux-$(uname -m)-$ZIG_VERSION.tar.xz" && \
    ln -s "/opt/zig-linux-$(uname -m)-$ZIG_VERSION/zig" /usr/local/bin/zig

# Install Ghostty Dependencies
RUN DEBIAN_FRONTEND="noninteractive" apt-get -qq update && \
    apt-get -qq -y install \
    libadwaita-1-dev \
    libgtk-4-dev
