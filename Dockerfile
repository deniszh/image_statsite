FROM buildpack-deps:jessie-curl

RUN apt-get update \
  && apt-get install -y git make gcc scons vim

RUN git clone https://github.com/armon/statsite.git /usr/src/statsite \
  && cd /usr/src/statsite \
  && git checkout tags/v0.8.0 \
  && mkdir -p /opt/statsite/sinks \
  && mkdir -p /etc/statsite \
  && mkdir -p /var/run/statsite

RUN cd /usr/src/statsite \
  && ./bootstrap.sh \
  && ./configure \
  && make \
  && cp statsite /usr/bin/ \
  && cp sinks/* /opt/statsite/sinks/

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD statsite_config /etc/statsite/statsite.conf
ADD sink_stdout.sh /usr/src/statsite/sinks/

EXPOSE 8125

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["statsite"]
