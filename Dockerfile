FROM python:3.6.7-jessie

ARG CLI_VERSION=2.4.38

LABEL maintainer="Jason Poon" \
      org.label-schema.version=$CLI_VERSION \
      org.label-schema.docker.cmd="docker run -v \${HOME}/.oci:/root/.oci -it jpoon/oci-cli:$CLI_VERSION"

WORKDIR /oci-cli

RUN apt-get update \ 
    && apt-get install -y unzip

RUN set -x \
    && wget -qO- -O oci-cli.zip "https://github.com/oracle/oci-cli/releases/download/v${CLI_VERSION}/oci-cli-${CLI_VERSION}.zip" \
    && unzip oci-cli.zip -d .. \
    && rm oci-cli.zip \
    && pip install oci_cli-*-py2.py3-none-any.whl

ENTRYPOINT ["/usr/local/bin/oci"]