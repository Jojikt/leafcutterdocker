###############################################################
# Dockerfile to build container images for leafcutter v0.2.9
# Based on stephanholgerdrukewitz/leafcutter:latest
################################################################

FROM stephanholgerdrukewitz/leafcutter:latest

# File Author / Maintainer
LABEL maintainer="Jimmy John Thomas <jimmymannekkattu@gmail.com>"

# Update sources.list and install samtools
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt-get update && \
    apt-get install -y samtools \
    r-base \
    r-base-dev \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    curl \
    g++ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Set up the correct Makevars file for Rstan
RUN mkdir -p /root/.R && \
    echo "CXX14FLAGS=-O3 -march=native -mtune=native -fPIC" > /root/.R/Makevars && \
    echo "CXX14=g++" >> /root/.R/Makevars

# Install devtools package dependencies first (for R packages)
RUN R -e "install.packages(c('curl', 'openssl', 'git2r'), repos='https://cloud.r-project.org/')"

# Install rstan after devtools and rstantools
RUN R -e "install.packages('rstan', repos='https://cloud.r-project.org/')"

# Install classify_clusters.R (same as original)
RUN cd /opt/leafcutter/leafcutter/leafcutter/R && \
    wget https://raw.githubusercontent.com/davidaknowles/leafcutter/classify_clusters/leafviz/classify_clusters.R

# Set working directory
WORKDIR /home

