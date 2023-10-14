#!/bin/sh
eval $(ssh-agent -s)
ssh-add /root/.ssh/id_ed25519
exec tail -f /dev/null