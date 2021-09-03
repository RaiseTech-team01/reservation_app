# フロント立ち上げ手順

Rails コンテナ内で　Vue を立ち上げる時の流れをまてめています。
## vue　環境下準備

```bash
# docker Rails コンテナ内で実行する

# コンテナに入る
$ docker-compose exec rails /bin/bash

# 上書きするか聞かれるので全て No で対応する
# package install　
$ bundle exec rails webpacker:install
$ bundle exec rails webpacker:install:vue

# 必要なpackageと警告がでた時に追加でいれる
$ yarn add @vue/compiler-sfc

# 管理外にしているファイルを取り込む. (不足ファイルを確認してインストールしてくれる)
$ yarn install --check-files
```

## フロント 開発環境立ち上げ

```bash
# rails コンテナ内で実行

# サーバ起動
$ bin/webpack-dev-server
```
