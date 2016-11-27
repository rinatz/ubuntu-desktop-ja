# ubuntu-desktop-ja

Ubuntu の日本語デスクトップ環境を作るための Vagrantfile です。

## 必要なもの

* [Vagrant]
* [VirtualBox]

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/

## 使い方

リポジトリをクローンした後、 `Vagrantfile` と `ansible` ディレクトリを
適当なところ（`$HOME` など）においてください。

    $ git clone https://github.com/rinatz/ubuntu-desktop-ja
    $ cp -rp ubuntu-desktop-ja/{Vagrantfile,ansible} $HOME

`Vagrantfile` の置かれたところで `vagrant up` と打てばプロビジョニングが始まります。

    $ cd $HOME
    $ vagrant up

## 日本語化

Ubuntu が起動したら右上の歯車のアイコンから

`System settings...` > `Language Support`

とたどります。ダイアログが表示されるので `install` を選択し
言語パッケージをインストールします。
パスワードを聞かれるので `vagrant` と入力します。

`Language` タブで `日本語` をドラッグして一番上に持って行き、 `Apply System-Wide` ボタンを押します。
`Regional Formats` でも `日本語` を選択し、 `Apply System-Wide` ボタンを押します。

再ログインすれば日本語化されます。

## 日本語入力

デスクトップ右上のキーボードのアイコンから `設定` を選択し
`入力メソッド` の項目に

1. キーボード - 日本語 - 日本語（かな 86）
1. Mozc

という入力メソッドがこの順に並ぶように設定してください。
英語キーボードは削除していいです。

## インストールパッケージ

プロビジョニング時に下記のパッケージを [Ansible] を使用してインストールするようにしています。
インストールが不要のライブラリがあれば、好みに合わせて使用する
PlayBook や role を編集しても構いません。

[Ansible]: https://www.ansible.com/

### bootstrap

Ubuntu Japanese Team が推奨するパッケージをインストールします。
その他下記の変更を行っています。

* タイムゾーンを `Asia/Tokyo` に設定
* 起動時に `System program problem detected` というダイアログが出ないようにする（初回起動時は出てしまう）

### develop

開発でよく使用されるライブラリと docker をインストールします。

### extra

`develop` でインストールされるパッケージに加えて各種言語のライブラリなどをインストールします。

## ライセンス

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

Copyright (c) 2016 Kenichiro IDA
