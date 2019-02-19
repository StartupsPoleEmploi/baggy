#!/bin/bash

## Generate config
if [ ! -f $POSTAL_CONFIG_ROOT/postal.yml ]; then
	p2 -t /postal/config/postal.yml.j2 -o $POSTAL_CONFIG_ROOT/postal.yml
fi
cat $POSTAL_CONFIG_ROOT/postal.yml

## Wait for MySQL to start up
echo "== Waiting for MySQL to start up =="
while ! mysqladmin ping -h mysql --silent; do
    sleep 0.5
done

## Run command
"$@"
