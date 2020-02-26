FROM alpine

RUN mkdir -p smartdns/config && mkdir -p smartdns/logs &&\
        cd /smartdns && \
        wget "https://github.com/pymumu/smartdns/releases/download/Release29/smartdns-x86_64" -O "smartdns" && \
        chmod +x smartdns

ADD run.sh /smartdns/
ADD smartdns.conf /smartdns/smartdns.conf

RUN chmod +x /smartdns/run.sh

WORKDIR /smartdns

EXPOSE 53

CMD ["sh", "-c", "/smartdns/run.sh" ]


