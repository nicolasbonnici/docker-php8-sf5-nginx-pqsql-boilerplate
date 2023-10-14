#!/bin/sh

eval $(ssh-agent -s)
ssh-add /root/.ssh/${SSH_KEY_NAME}

# Keep the container running
tail -f /dev/null