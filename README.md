## 概要

飲食店向け予約アプリ


## 環境
- Rails version: 6.1.3
- Ruby version: ruby 3.0.2
- PostgreSQL

## 環境構築

### フロント

- vue　環境下準備

```bash
# 上書きするか聞かれるので全て No で対応する
# package install　
$ bundle exec rails webpacker:install
$ bundle exec rails webpacker:install:vue

# 必要なpackageと警告がでた時に追加でいれる
$ yarn add @vue/compiler-sfc

# 管理外にしているファイルを取り込む. (不足ファイルを確認してインストールしてくれる)
$ yarn install --check-files
```


```bash
# サーバ起動
$ bin/webpack-dev-server
```
