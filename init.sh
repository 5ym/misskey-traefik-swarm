#!/bin/sh

mkdir -p misskey/files misskey/.config misskey/db misskey/redis
wget -O misskey/.config/default.yml https://raw.githubusercontent.com/misskey-dev/misskey/develop/.config/docker_example.yml
wget -O misskey/.config/docker.env https://raw.githubusercontent.com/misskey-dev/misskey/develop/.config/docker_example.env
wget https://raw.githubusercontent.com/5ym/misskey-traefik-swarm/main/compose.misskey.yml
echo 'customize compose file'
sleep 5
vim compose.misskey.yml
echo 'customize config file'
sleep 5
vim misskey/.config/default.yml
docker compose -f compose.misskey.yml run --rm misskey pnpm run init
echo 'remove depends_on as it does not work with swarm'
sleep 5
vim compose.misskey.yml
docker stack deploy --with-registry-auth -c compose.misskey.yml misskey
