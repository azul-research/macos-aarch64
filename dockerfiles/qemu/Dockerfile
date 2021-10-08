FROM debian:buster

RUN \
        apt-get update && \
        DEBIAN_FRONTEND=noninteractive \
        apt-get -y --no-install-recommends install \
		debootstrap \
		qemu-user-static \
		binfmt-support \
        && apt-get clean \
        && rm -rf /var/lib/apt /var/cache/apt

COPY entrypoint.sh /
ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
