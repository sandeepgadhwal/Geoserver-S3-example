FROM tomcat:9.0

RUN apt update && \
    apt install wget unzip -y

ENV WEBAPPS_DIR=/usr/local/tomcat/webapps
ENV GEOSERVER_DIR=${WEBAPPS_DIR}/geoserver
ENV GEOSERVER_VERSION=2.23
ENV GEOSERVER_BUILD=${GEOSERVER_VERSION}.x
ENV GEOSERVER_BUILD_URL_PREFIX=https://build.geoserver.org/geoserver/${GEOSERVER_BUILD}

RUN cd /tmp && \
    wget ${GEOSERVER_BUILD_URL_PREFIX}/geoserver-${GEOSERVER_BUILD}-latest-war.zip -O geoserver.zip && \
    unzip geoserver.zip -d ./geoserver && \
    unzip ./geoserver/geoserver.war -d ${GEOSERVER_DIR} &&\
    rm -rf geoserver.zip ./geoserver

RUN cd /tmp && \
    wget ${GEOSERVER_BUILD_URL_PREFIX}/community-latest/geoserver-${GEOSERVER_VERSION}-SNAPSHOT-cog-plugin.zip -O cog-plugin.zip && \
    unzip -o cog-plugin.zip -d ${GEOSERVER_DIR}/WEB-INF/lib &&\
    rm cog-plugin.zip

# RUN cd /tmp && \
#     wget ${GEOSERVER_BUILD_URL_PREFIX}/community-latest/geoserver-${GEOSERVER_VERSION}-SNAPSHOT-s3-geotiff-plugin.zip -O s3-geotiff-plugin.zip && \
#     unzip -o s3-geotiff-plugin.zip -d ${GEOSERVER_DIR}/WEB-INF/lib &&\
#     rm s3-geotiff-plugin.zip
