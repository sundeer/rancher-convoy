FROM rancher/os-console:v0.4.0-rc10

ADD convoy.tar.gz /tmp/convoy.tar.gz
RUN cp -f /tmp/convoy.tar.gz/convoy/convoy* /
RUN rm -rf /tmp/convoy.tar.gz

ADD start.sh /start.sh
RUN chmod +x /start.sh

RUN echo "unix:///var/run/convoy/convoy.sock" > /tmp/convoy.spec

CMD ["/start.sh"]
