FROM ubuntu:latest
MAINTAINER Computo team <computo@sfds.asso.fr>

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    unzip \
    ca-certificates \
    curl \
    dvipng pandoc wget \
    texlive-latex-recommended texlive-xetex texlive-fonts-recommended  texlive-fonts-extra cm-super-minimal && \
    && apt-get --purge -y remove texlive.\*-doc$ && apt-get clean \
    && wget --no-check-certificate https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.280/quarto-1.2.280-linux-amd64.deb \
    && dpkg -i quarto-1.2.280-linux-amd64.deb \
    && rm quarto-1.2.280-linux-amd64.deb \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log \
    && true

