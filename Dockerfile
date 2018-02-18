FROM fanningert/aria2-daemon

MAINTAINER fanningert <thomas@fanninger.at>

RUN apk update && \
	apk add git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2-webui && \
    	rm /aria2-webui/.git* -rf && \
    	cp /aria2-webui/configuration.js /conf/aria2-webui-configuration.js && \
    	apk del git && \
	apk add --update darkhttpd

EXPOSE 80
