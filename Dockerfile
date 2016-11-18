FROM ubuntu:16.04

ARG DEBIAN_FRONTEND=noninteractive
ENV USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends ubuntu-desktop && \
    apt-get install -y gnome && \
    apt-get install -y tightvncserver && \
    mkdir /root/.vnc

ADD xstartup /root/.vnc/xstartup
ADD passwd /root/.vnc/passwd

RUN chmod 600 /root/.vnc/passwd

CMD /usr/bin/vncserver :1 -geometry 1280x800 -depth 24 && tail -f /root/.vnc/*:1.log

EXPOSE 6080
