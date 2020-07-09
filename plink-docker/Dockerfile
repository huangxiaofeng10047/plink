FROM mysql:5.7.28

ENV MYSQL_ROOT_PASSWORD 123456

ARG flink_version=1.11.0
ARG scala_version=2.11
ARG plink_jar_file="plink-0.2.0-SNAPSHOT-bin.tar.gz"

MAINTAINER hairless

COPY flink-${flink_version}-bin-scala_${scala_version}.tgz  ${plink_jar_file} jdk-8u251-linux-x64.tar.gz plink_init.sql start-all.sh /tmp/

# RUN apk add --no-cache bash \
#  && /bin/bash \

RUN cp /tmp/start-all.sh /opt \
 && tar  xf /tmp/${plink_jar_file}  -C /opt/ \
 && cp /tmp/plink_init.sql /opt \
 && tar xf /tmp/jdk-8u251-linux-x64.tar.gz -C /opt \
 && tar xf /tmp/flink-${flink_version}-bin-scala_${scala_version}.tgz -C /opt \
 && ln -s /opt/flink-${flink_version} /opt/flink \
 && ln -s /opt/plink-0.2.0-SNAPSHOT-bin /opt/plink \
 && chmod +x /opt/flink/bin/*.sh \
 && rm -rf /tmp/*

EXPOSE 8081
EXPOSE 8666

ENV JAVA_HOME=/opt/jdk1.8.0_251 \
    FLINK_HOME=/opt/flink

ENV PATH=${PATH}:${JAVA_HOME}/bin:${FLINK_HOME}/bin

CMD ["sh", "/opt/start-all.sh"]
