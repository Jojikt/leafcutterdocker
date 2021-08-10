###############################################################
# Dockerfile to build container images for leafcutter
# Based on miniconda2
################################################################

FROM conda/miniconda2:latest

# File Author / Maintainer
LABEL maintainer="Naoto Kubota <n.kubota@bioreg.kyushu-u.ac.jp>"

# Install dependencies first
RUN apt-get -qq update && apt-get -qq -y install wget git r-base && \
    conda install -y -c bioconda samtools regtools

# Install leafcutter
RUN cd /home && git clone https://github.com/davidaknowles/leafcutter

# Set working directory
WORKDIR /home
