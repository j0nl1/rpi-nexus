FROM j0nl1/rpi-openjdk:8-jdk-stretch

LABEL maintainer Javier Aceña Viana (j0nl1) <jonlitech@gmail.com>
LABEL description Sonatype Nexus Repository for Raspberry

ARG NEXUS_VERSION=3.16.2-01
ARG NEXUS_DOWNLOAD_URL=https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz

ENV SONATYPE_DIR=/usr/local
ENV NEXUS_HOME=${SONATYPE_DIR}/nexus


RUN  curl -O ${NEXUS_DOWNLOAD_URL} \
        && tar -zxf nexus-${NEXUS_VERSION}-unix.tar.gz -C ${SONATYPE_DIR} \
        && mv ${SONATYPE_DIR}/nexus-${NEXUS_VERSION}* ${NEXUS_HOME} \
        && rm -f nexus-${NEXUS_VERSION}-unix.tar.gz \
        && useradd -m nexus \
        && chown -R nexus ${NEXUS_HOME} \
        && chown -R nexus ${SONATYPE_DIR}/sonatype-work

COPY ./config/nexus.vmoptions ${NEXUS_HOME}/bin/nexus.vmoptions

EXPOSE 8081 8082 8083

VOLUME ${NEXUS_HOME}/data

WORKDIR ${NEXUS_HOME}/bin

USER nexus

CMD ["./nexus", "run"]