FROM alpine

RUN apk add --no-cache openssh
COPY ./sshd_config /etc/ssh/
COPY ./start.sh /usr/bin/

EXPOSE 22

RUN chmod +x /usr/bin/start.sh

# Run the OpenSSH server
CMD ["/usr/bin/start.sh"]