FROM dockcross/linux-arm64

ENV DEFAULT_DOCKCROSS_IMAGE arm64-kernel-xcompile
RUN apt-get install libssl-dev fakeroot
