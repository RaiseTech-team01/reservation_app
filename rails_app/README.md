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

## flont 立ち上げ

```bash
# rails コンテナ内で実行

# サーバ起動
$ bin/webpack-dev-server


# 出力結果: Compiled successfully. と出ていればOK
ℹ ｢wds｣: Project is running at http://localhost:3035/
ℹ ｢wds｣: webpack output is served from /packs/
ℹ ｢wds｣: Content not from webpack is served from /rails_app/public/packs
ℹ ｢wds｣: 404s will fallback to /index.html
Though the "loose" option was set to "false" in your @babel/preset-env config, it will not be used for @babel/plugin-proposal-private-methods since the "loose" mode option was set to "true" for @babel/plugin-proposal-class-properties.
The "loose" option must be the same for @babel/plugin-proposal-class-properties, @babel/plugin-proposal-private-methods and @babel/plugin-proposal-private-property-in-object (when they are enabled): you can silence this warning by explicitly adding
        ["@babel/plugin-proposal-private-methods", { "loose": true }]
to the "plugins" section of your Babel config.
ℹ ｢wdm｣: Hash: a5d5904a319c775cb439
Version: webpack 4.46.0
Time: 37864ms
Built at: 08/14/2021 5:57:48 PM
                                  Asset       Size       Chunks                         Chunk Names
    application-a5d5904a319c775cb439.js   5.62 MiB  application  [emitted] [immutable]  application
application-a5d5904a319c775cb439.js.map   5.99 MiB  application  [emitted] [dev]        application
      hello_vue-a5d5904a319c775cb439.js   5.35 MiB    hello_vue  [emitted] [immutable]  hello_vue
  hello_vue-a5d5904a319c775cb439.js.map   5.39 MiB    hello_vue  [emitted] [dev]        hello_vue
                          manifest.json  665 bytes               [emitted]
ℹ ｢wdm｣: Compiled successfully.
```
