FROM dockcross/linux-arm64

ENV DEFAULT_DOCKCROSS_IMAGE tetov/linux-arm64-kernel-xcompile
RUN apt-get update && \
        apt-get install -y --no-install-recommends libssl-dev fakeroot && \
        rm -rf /var/lib/apt/lists/
