FROM debian:buster

RUN \
        apt-get update && \
        DEBIAN_FRONTEND=noninteractive \
        apt-get -y --no-install-recommends install \
                ca-certificates \
		curl \
                build-essential \
                autoconf \
                file \
                unzip \
                zip \
		gcc-aarch64-linux-gnu \
		g++-aarch64-linux-gnu \
        && apt-get clean \
        && rm -rf /var/lib/apt /var/cache/apt

# determine necessary jdk package here: https://www.azul.com/downloads/?package=jdk
# find its path here: https://cdn.azul.com/zulu/bin/
ARG ZULU_VERSION=15.36.13-ca-jdk15.0.5
RUN PKG=zulu${ZULU_VERSION}-linux_x64.tar.gz; \
	curl -LO https://cdn.azul.com/zulu/bin/$PKG && \
	tar -C /opt -axf $PWD/$PKG && \
	rm $PKG
