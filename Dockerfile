FROM hugojosefson/ubuntu-gnome:16.04

RUN apt-get install -y tightvncserver && \
    mkdir /root/.vnc
    
ADD passwd /root/.vnc/passwd

RUN chmod 600 /root/.vnc/passwd

CMD /usr/bin/vncserver :1 -geometry 1280x800 -depth 24 && tail -f /root/.vnc/*:1.log

EXPOSE 6080
