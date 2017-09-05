# ubuntu-desktop-ja

Ubuntu 14.04 の日本語デスクトップ環境を作るための Vagrantfile です。

## 目次

* [必要なもの](#必要なもの)
* [設定](#設定)
* [使い方](#使い方)
* [日本語化](#日本語化)
* [日本語入力](#日本語入力)
* [ライセンス](#ライセンス)

## 必要なもの

* [Vagrant]
* [VirtualBox]

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/

### 注意

動作確認は Vagrant 1.9.8 と VirtualBox 5.1.26 で行っています。
バージョンの組み合わせがシビアで、
相性が悪いと上手く起動できないことがあるためご注意下さい。

## 設定

リポジトリをクローンした後 `Vagrantfile` と `ansible` ディレクトリを適当なところに置いてください。
`$HOME` (Windows であれば `%USERPROFILE%` ) に置くのがおすすめです。

    $ git clone https://github.com/rinatz/ubuntu-desktop-ja
    $ cp -rp ubuntu-desktop-ja/{Vagrantfile,ansible} $HOME

必要に応じて `Vagrantfile` を編集します。
デフォルトのままでいい場合は何もしてくていいです。

### プライベートネットワーク

プライベートネットワークとして IP アドレスを DHCP で割り当てています。
固定 IP アドレスにしたい場合は `Vagrantfile` の

```ruby
config.vm.network "private_network", type: "dhcp"
```

の箇所を変更してください。

### CPU・メモリ

メモリは 4096 MB 割り当てています。また CPU は 2 つに設定しています。
変更したい場合は `Vagrantfile` の

```ruby
config.vm.provider "virtualbox" do |vb|
  # Display the VirtualBox GUI when booting the machine
  # vb.gui = true

  # Customize the amount of memory on the VM:
  vb.memory = "4096"

  vb.cpus = 2
```

の `vb.memory, vb.cpus` を適宜変更してください。

### インストールパッケージ

プロビジョニング時に下記の Playbook を [Ansible] で実行するようにしています。
[Ansible] をあらかじめインストールしておく必要はありません。

インストールするパッケージの詳細は [ansible](./ansible) ディレクトリ配下を見てください。
インストールが不要のライブラリがあれば、好みに合わせて使用する
Playbook や role を編集してください。

[Ansible]: https://www.ansible.com/

#### bootstrap

Ubuntu Japanese Team が推奨するパッケージをインストールします。
その他下記の変更を行っています。

* タイムゾーンを `Asia/Tokyo` に設定
* 起動時に `System program problem detected` というダイアログが出ないようにする（初回起動時は出てしまう）

#### develop

開発でよく使用されるライブラリと docker をインストールします。

#### extra

`develop` でインストールされるパッケージに加えて各種言語のライブラリなどをインストールします。

#### ide

Eclipse などの IDE をインストールします。

## 使い方

`Vagrantfile` の置かれたところ（ここでは `$HOME` としています）で
`vagrant up` と打てばプロビジョニングが始まります。

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

## ライセンス

[![license](https://img.shields.io/github/license/rinatz/ubuntu-desktop-ja.svg)](LICENSE)

Copyright (c) 2017 Kenichiro IDA
