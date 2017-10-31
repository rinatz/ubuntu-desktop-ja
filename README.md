# ubuntu-desktop-ja

Ubuntu 14.04 の日本語デスクトップ環境を作るための Vagrantfile です。

## 目次

- [必要なもの](#必要なもの)
- [設定](#設定)
- [使い方](#使い方)
- [日本語化](#日本語化)
- [日本語入力](#日本語入力)
- [ライセンス](#ライセンス)

## 必要なもの

- [Vagrant]
- [VirtualBox]

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/

### 注意

動作確認は Vagrant 2.0.0 と VirtualBox 5.1.28 で行っています。
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
  vb.gui = true

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

- タイムゾーンを `Asia/Tokyo` に設定
- Ubuntu のパッケージアーカイブミラーを日本国内に変更

#### develop

- Ubuntu Japanese Team 推奨パッケージをインストール
- 開発でよく使用されるライブラリと docker をインストール

#### extra

- 各種言語のライブラリをインストール

#### ide

- IDE をインストール

## 使い方

`Vagrantfile` の置かれたところ（ここでは `$HOME` としています）で
`vagrant up` と打てばプロビジョニングが始まります。

    $ cd $HOME
    $ vagrant up

## 日本語化

デスクトップ環境を日本語化するには次のようにします。

1. デスクトップ右上の歯車のアイコンから `System settings...` > `Language Support` を選択
1. 表示されるダイアログで `install` を選択（パスワードは `vagrant`）
1. `Language` タブで `日本語` を一番上までドラッグし `Apply System-Wide` ボタンを押す
1. `Regional Formats` で `日本語` を選択し `Apply System-Wide` ボタンを押す
1. 再ログイン

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
