FROM alpine:3.5
MAINTAINER Johan Swetzén <johan@swetzen.com>

RUN apk add --no-cache curl

ADD update_entrydns.sh /etc/periodic/hourly/update_entrydns.sh
RUN chmod +x /etc/periodic/hourly/update_entrydns.sh

CMD /etc/periodic/hourly/update_entrydns.sh && crond -f
