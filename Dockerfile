# Pull a base image from js2264/hicexperiment (should contain most needed deps)
FROM js2264/hicexperiment

LABEL org.opencontainers.image.source=https://github.com/js2264/OHCA
LABEL org.opencontainers.image.documentation=https://js2264.github.io/OHCA
LABEL org.opencontainers.image.authors="OHCA authors"
LABEL org.opencontainers.image.description="Orchestrating Hi-C analysis with Bioconductor"
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.version ${VERSION}

# Copy everything (minus anything specified in .dockerignore) into the image
COPY . /opt/OHCA
WORKDIR /opt/OHCA
RUN cd /opt/OHCA

# To make installs not ask questions about timezones
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN make deps
RUN make install
RUN make render
