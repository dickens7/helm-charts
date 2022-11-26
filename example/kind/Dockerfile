FROM ubuntu@sha256:9d6a8699fb5c9c39cf08a0871bd6219f0400981c570894cd8cbea30d3424a31f


RUN  WSL_COMMIT_REF=linux-msft-wsl-5.15.74.2 && \
apt update && apt install -y git build-essential flex bison libssl-dev libelf-dev bc python3 dwarves && \
mkdir src && \
cd src  && \
git init  && \
git remote add origin https://github.com/microsoft/WSL2-Linux-Kernel.git && \
git config --local gc.auto 0 && \
git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +${WSL_COMMIT_REF}:refs/remotes/origin/build/linux-msft-wsl-5.15.y && \
git checkout --progress --force -B build/linux-msft-wsl-5.10.y refs/remotes/origin/build/linux-msft-wsl-5.15.y 

# adds support for clientIP-based session affinity
RUN cd src && sed -i 's/# CONFIG_NETFILTER_XT_MATCH_RECENT is not set/CONFIG_NETFILTER_XT_MATCH_RECENT=y/' Microsoft/config-wsl && \

# required modules for Cilium
sed -i 's/# CONFIG_NETFILTER_XT_TARGET_CT is not set/CONFIG_NETFILTER_XT_TARGET_CT=y/' Microsoft/config-wsl && \
sed -i 's/# CONFIG_NETFILTER_XT_TARGET_TPROXY is not set/CONFIG_NETFILTER_XT_TARGET_TPROXY=y/' Microsoft/config-wsl && \

# build the kernel
make -j32 KCONFIG_CONFIG=Microsoft/config-wsl