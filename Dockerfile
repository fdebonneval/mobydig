FROM ubuntu:16.04
MAINTAINER Foucault de Bonneval <foucault(at)commit.ninja>


LABEL RUN="docker run -i -t --privileged -v /var/run/docker.sock:/host/var/run/docker.sock -v /dev:/host/dev -v /proc:/host/proc:ro -v /lib/modules:/host/lib/modules:ro -v /usr:/host/usr:ro --name NAME IMAGE"

ARG application_version
COPY resources /tmp/resources

ENV SYSDIG_HOST_ROOT /host

RUN /tmp/resources/build && rm -rf /tmp/resources

ENTRYPOINT ["/entrypoint.sh"]
