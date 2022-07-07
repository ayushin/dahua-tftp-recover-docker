FROM alpine
RUN apk add --no-cache tftp-hpa
RUN adduser -D tftp
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
