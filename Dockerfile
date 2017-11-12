FROM alpine:edge

MAINTAINER fanningert <thomas@fanninger.at>

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 && \
	apk add git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2-webui && \
    rm /aria2-webui/.git* -rf && \
    cp /aria2-webui/configuration.js /conf-copy/aria2-webui-configuration.js
    apk del git && \
	apk add --update darkhttpd

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/on-bt-download-complete.sh /conf-copy/on-bt-download-complete.sh
ADD files/on-download-complete.sh /conf-copy/on-download-complete.sh
ADD files/on-download-error.sh /conf-copy/on-download-error.sh
ADD files/on-download-pause.sh /conf-copy/on-download-pause.sh
ADD files/on-download-start.sh /conf-copy/on-download-start.sh
ADD files/on-download-stop.sh /conf-copy/on-download-stop.sh

RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/download"]
VOLUME ["/finished"]
VOLUME ["/conf"]
EXPOSE 80
EXPOSE 6800

CMD ["/conf-copy/start.sh"]
