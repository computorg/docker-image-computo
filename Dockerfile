FROM ubuntu:22.04
MAINTAINER Computo team <computo@sfds.asso.fr>

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends curl bzip2 unzip texlive-latex-recommended texlive-xetex texlive-fonts-recommended cm-super-minimal texlive-fonts-extra dvipng pandoc wget && \
    apt-get --purge -y remove texlive.\*-doc$ && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/* && \
    wget --no-check-certificate https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.280/quarto-1.2.280-linux-amd64.deb && \
    dpkg -i quarto-1.2.280-linux-amd64.deb && \
    rm quarto-1.2.280-linux-amd64.deb && \
    rm -rf /tmp/* /var/tmp/* && \
    true
