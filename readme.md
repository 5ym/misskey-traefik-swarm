# misskey-traefik-swarm

traefikを使用している環境でswarmで容易にmisskeyを動かすためのスクリプトです  
初期状態では下記仕様になっています

- traefikはmain_defaultのネットワーク上で動作misskeyをそこに参加させる形
- myresolverという名前でcertresolverを設定

## how to use

```sh
curl -sf https://raw.githubusercontent.com/5ym/misskey-traefik-swarm/main/init.sh | sh -s
```
