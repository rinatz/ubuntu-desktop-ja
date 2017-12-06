# 注意

> このリポジトリは移動しました。
> https://github.com/rinatz/linux-desktop-ja

# ubuntu-desktop-ja

Ubuntu 14.04 の日本語デスクトップ環境を作るための Vagrantfile です。

## 目次

- [必要なもの](#必要なもの)
- [設定](#設定)
- [起動](#起動)
- [日本語化](#日本語化)
- [日本語入力](#日本語入力)
- [ライセンス](#ライセンス)

## 必要なもの

- [Vagrant]
- [VirtualBox]

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/

    注意

    動作確認は Vagrant 2.0.1 と VirtualBox 5.2.0 で行っています。
    バージョンの組み合わせがシビアで、
    相性が悪いと上手く起動できないことがあるためご注意下さい。

## 設定

リポジトリをクローンした後 `Vagrantfile` と `ansible` ディレクトリを適当なところに置いてください。
`$HOME` (Windows であれば `%USERPROFILE%` ) に置くのがおすすめです。

    $ git clone https://github.com/rinatz/ubuntu-desktop-ja
    $ cp -rp ubuntu-desktop-ja/{Vagrantfile,ansible} $HOME

必要に応じて `Vagrantfile` を編集します。
デフォルトのままでいい場合は何もしてくていいです。

## 起動

`Vagrantfile` の置かれたところ（ここでは `$HOME` としています）で
`vagrant up` と打てばプロビジョニングが始まります。

    $ cd $HOME
    $ vagrant up

プロビジョニングが終わったら再起動して下さい。

    $ vagrant reload

## 日本語化

デスクトップ環境を日本語化するには次のようにします。

1. デスクトップ右上の歯車のアイコンから `System settings...` > `Language Support` を選択
1. 表示されるダイアログで `install` を選択（パスワードは `vagrant`）
1. `Language` タブで `日本語` を一番上までドラッグし `Apply System-Wide` ボタンを押す
1. `Regional Formats` で `日本語` を選択し `Apply System-Wide` ボタンを押す
1. 再ログイン

## 日本語入力

日本語入力を有効化するためには次のようにします。

1. デスクトップ右上のキーボードのアイコンから `設定` を選択
1. `入力メソッド` の項目にある `キーボード - 英語(US)` を削除して下記をこの順に追加

    - キーボード - 日本語 - 日本語（かな 86）
    - Mozc

1. `全体の設定` タブで `入力メソッドのオンオフ` の項目に `半角/全角キー` を追加

## ライセンス

[![license](https://img.shields.io/github/license/rinatz/ubuntu-desktop-ja.svg)](LICENSE)

Copyright (c) 2017 Kenichiro IDA
