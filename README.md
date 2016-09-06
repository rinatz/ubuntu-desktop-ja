# ubuntu-desktop-ja

Ubuntu の日本語デスクトップ環境を作るための Vagrantfile です。

## インストールパッケージ

`boxcutter/ubuntu1404-desktop` をベースにして、追加で下記のパッケージをインストールします。

* Ubuntu Japanese Team 推奨パッケージ
* docker
* docker-compose
* docker の `buildpack-deps:trusty` イメージでインストールされるパッケージ

## 設定

* タイムゾーンを `Asia/Tokyo` に設定
* 一部の環境で `System program problem detected` というダイアログが出ないようにする（初回起動時は出てしまう）

## スペック

メモリを 4096 MB 確保しています。値は適宜変更してください。

## ライセンス

MIT License

Copyright (c) 2016 Kenichiro IDA
