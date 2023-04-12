
FROM ubuntu:18.04

# Dockerfile for gpgpusim-4.0.1 build

LABEL description="GPGPU-Sim v4.0.1"

# --------------------------------------
# Installing basic applications
# --------------------------------------
RUN apt-get update && \
	apt-get install -y curl wget vim gcc g++ make git \
	build-essential xutils-dev bison zlib1g-dev flex libglu1-mesa-dev \
	libxi-dev libxmu-dev freeglut3-dev

# --------------------------------------
# Installing CUDA Toolkit 10.2
# --------------------------------------
RUN curl -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin && \
	mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1804-10-1-local-10.1.105-418.39_1.0-1_amd64.deb && \
	dpkg -i cuda-repo-ubuntu1804-10-1-local-10.1.105-418.39_1.0-1_amd64.deb && \
	rm -f cuda*.deb
RUN apt-key add /var/cuda-repo-10-1-local-10.1.105-418.39/7fa2af80.pub && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install cuda

# --------------------------------------
# Installing GPGPU-Sim
# --------------------------------------

## DONE
