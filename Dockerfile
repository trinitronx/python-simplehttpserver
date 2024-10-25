# The smallest docker container using busybox and
# [StaticPython](https://github.com/pts/staticpython)
# Originally based on elyase/staticpython by Yaser Martinez Palenzuela <@elyase>
# Source: https://github.com/elyase/docker/tree/master/staticpython
FROM busybox
LABEL org.opencontainers.image.authors='James Cuzella <@trinitronx>, Yaser Martinez Palenzuela <@elyase>'
LABEL org.opencontainers.image.url=https://hub.docker.com/repository/docker/trinitronx/python-simplehttpserver
LABEL org.opencontainers.image.documentation=https://github.com/trinitronx/docker-python-simplehttpserver/blob/master/README.md
LABEL org.opencontainers.image.source=https://github.com/trinitronx/docker-python-simplehttpserver
LABEL org.opencontainers.image.licenses=GPL-3.0-or-later

ARG PYTHON_BIN=python3.2-static
ARG PYTHON_URL=https://github.com/pts/staticpython/raw/refs/heads/master/release/${PYTHON_BIN}

ADD ${PYTHON_URL} /bin/python
RUN chmod 0755 /bin/python
WORKDIR /var/www/
EXPOSE 8080
CMD [ "python", "-m", "SimpleHTTPServer", "8080" ]
