FROM rancher/os-console:v0.4.2

ADD convoy.tar.gz /tmp/convoy.tar.gz
ADD convoy-start.sh /convoy-start.sh

RUN cp /tmp/convoy.tar.gz/convoy/convoy* /usr/bin/ \
    && rm -rf /tmp/convoy.tar.gz \
    && chmod +x /convoy-start.sh

ENTRYPOINT ["/convoy-start.sh"]
