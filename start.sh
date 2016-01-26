#!/bin/sh

if [ ! -d /var/lib/docker/convoy-volumes ]; then
    mkdir -p /var/lib/docker/convoy-volumes
fi

if [ ! -d /etc/docker/plugins ]; then
    mkdir -p /etc/docker/plugins
fi

if [ ! -d /var/run/convoy ]; then
    mkdir -p /var/run/convoy
fi

touch /etc/docker/plugins/convoy.spec

if [ "$(cat /tmp/convoy.spec)" != "$(cat /etc/docker/plugins/convoy.spec)" ]; then
    mv -f /tmp/convoy.spec /etc/docker/plugins/convoy.spec
else
    rm /tmp/convoy.spec
fi

ln -fs /convoy /usr/bin/convoy
ln -fs /convoy-pdata_tools /usr/bin/convoy-pdata_tools

/usr/bin/convoy daemon --drivers vfs --driver-opts vfs.path=/var/lib/docker/convoy-volumes
