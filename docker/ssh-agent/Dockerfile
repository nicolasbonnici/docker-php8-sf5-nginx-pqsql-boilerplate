FROM alpine:latest

# install openssh-client package in the Alpine Linux image.
RUN apk --update --no-cache add openssh-client

# create a directory at /root/.ssh in the container.
RUN mkdir -p /root/.ssh

# sets ssh-agent -s as the default command to be run when the container starts.
COPY start_ssh_agent.sh /usr/local/bin/start_ssh_agent.sh
RUN chmod +x /usr/local/bin/start_ssh_agent.sh

ENTRYPOINT ["/usr/local/bin/start_ssh_agent.sh"]