# アプリケーション名

## **P.O.W.U(ポウ)**

# 概要

## **「予定・工程共有アプリ」**

カレンダー表にて、部署ごとに予定・工程を共有する事が出来ます。  
また、各予定表ページにてコメント機能を導入しておりますので、予定を閲覧しながら打ち合わせが可能です。  

# 本番環境

[P.O.W.U](http://13.230.46.173/)

## ログイン情報(テスト用)

- メールアドレス：test@example1
- パスワード　　：abc123

# 動作確認方法
- 予定閲覧方法
  - ログイン情報（テスト用）でログイン→左上のバーガーボタンを押下→どれか部署名を押下（現場・レーザーに例として予定が入っております。是非ご確認ください。）
- 予定追加方法
  - ログイン情報（テスト用）でログイン→左上のバーガーボタンから「テスト」を押下→「予定を追加」ボタンを押下→情報を入力→予定を追加

- 確認後、ログアウト処理をお願いします。

# 制作背景（意図）

私は前職、製造業であり主に工程管理を担当しておりました。
工程を共有する手段として工場内に掲示板を設置し一日の予定や連絡事項を記載しておりました。
ですが、工程を毎日手書きで書くことは時間がかかってしまい、やや不便に感じておりました。  
そのため、今回 **「工程・予定を共有できるシステム」** を目的としたアプリケーションを実装致しました。


# DEMO

## **トップページ**
[![Image from Gyazo](https://i.gyazo.com/2264c730cb2dc8d3a8ab7160a08a3f52.png)](https://gyazo.com/2264c730cb2dc8d3a8ab7160a08a3f52)

- 簡単に取り扱い方法を記載しております。
- 左上のメニューバーから予定表のリストを確認することが出来ます。  
- 左上の「+」ボタンから新規予定表を登録することが出来ます。
- ユーザー名をクリックすることで、マイページへ遷移することが出来ます。

## **ユーザー管理機能**
[![Image from Gyazo](https://i.gyazo.com/e7ee09327a61a5d3a78555dfe37b9bb2.gif)](https://gyazo.com/e7ee09327a61a5d3a78555dfe37b9bb2)

- ユーザー登録が必須となります。ユーザー情報を用いて予定者やコメント者が明確になるように実装しております。
- 未ログイン時の場合、ログイン画面へ遷移致します。

## **マイページ**
[![Image from Gyazo](https://i.gyazo.com/93d0bd2016c90a5ad433fd03b1f3c7f9.png)](https://gyazo.com/93d0bd2016c90a5ad433fd03b1f3c7f9)

- ユーザーの登録情報・登録した予定の情報を確認することが出来ます。
- 「アカウントの編集ボタン」からアカウントの編集・ログアウトをすることが可能です。

## **予定表リスト画面**
[![Image from Gyazo](https://i.gyazo.com/a69411faf8e60d3b6143a1cea869e589.gif)](https://gyazo.com/a69411faf8e60d3b6143a1cea869e589)

- 予定表は全ユーザーが閲覧可能です。
- 予定表削除の誤作動を防ぐため、選択した予定表に対してのみリストから削除することが可能となります。
- 非同期通信でページ遷移を行っているため、予定を確認するための時間を削減しております。

## **予定表画面**
[![Image from Gyazo](https://i.gyazo.com/b544df653f658084689abd45906e18b0.gif)](https://gyazo.com/b544df653f658084689abd45906e18b0)

- 「予定を追加」ボタンから予定を新規追加する事が可能です。
- 予定のタイトルを長い文面で書いた場合、後ろの文字列が「...」に省略される様になっております。
- 予定のタイトルをクリックすることで詳細ページへ遷移できますが、カーソルを合わせることで予定者・タイトル名・時間を確認することが出来ます。
- 右上の「週」・「月」タブにて週別or月別カレンダーへ切り替える事が出来ます。

## **コメント機能**
[![Image from Gyazo](https://i.gyazo.com/06c77c90d0c3aaa68bc2693e7be2ae4b.gif)](https://gyazo.com/06c77c90d0c3aaa68bc2693e7be2ae4b)

- コメントは文面と画像を送信することが可能であり、どちらか一方のみの送信も可能です。
- 非同期通信にて実装している為、読む込む時間が無くすぐに反映されます。
- 自身のコメントに対しては左側にチェックマークが付くようになっております。また、編集と削除も可能です。
- 自身で新たなコメントを打ち込んだ場合、自動で新規コメント（最下部）までスクロールされます。
- コメントされたユーザー名をクリックすることで、ユーザーの詳細ページに遷移します。

## **予定追加画面**
[![Image from Gyazo](https://i.gyazo.com/887240e90a02a1ef16bba8d082f45e63.gif)](https://gyazo.com/887240e90a02a1ef16bba8d082f45e63)

- タイトル・時間・内容を打ち込むことが可能であり、内容は無い場合でも登録が可能です。
- 開始時間を打ち込むことによって、終了時間も１時間後の値が自動で打ち込まれるようになっております。
- 開始時間が終了時間よりも遅い場合はエラーを返し登録が出来ない様になっております。

## **予定詳細画面**
[![Image from Gyazo](https://i.gyazo.com/0b2b4a3dee11acffb6ee402ca16612dd.png)](https://gyazo.com/0b2b4a3dee11acffb6ee402ca16612dd)

- 予定内容の確認・編集・削除を行なうことが可能です。
- 内容は登録画面と同等の幅であり、長い文面に対しても登録画面で登録されたまま表示されます。

## **「手軽さ」を意識して下記３点の工夫ポイント**

- 予定表の確認を行なう際に、ページ間の移動を非同期通信にて実装致しました。  
これにより作業間に確認したい場合等、時間をかけたくない時にでもすぐ確認が出来るようになっております。  

- 予定表にて予定のタイトルが長くなってしまった場合、後ろの文字列が省略されるようになっております。  
ですが、吹き出し機能を導入しており、予定にカーソルを合わせることによって予定者・タイトル名・時間を表示致します。  
これにより、予定詳細画面にて予定内容を確認することも出来ますが、内容量が少ない場合は吹き出し内のタイトルでも予定内容を把握することが可能です。

- 予定追加画面にて、開始時間を打ち込んだ場合に終了時間が自動で１時間後の値が入力されるようになっております。  
これにより、一部の予定は終了時間の登録作業を省略して登録することが可能となっております。

# 使用技術（開発環境）

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML,CSS,JavaScript, jQuery, Ajax

## データベース
MySQL,SequelPro

## インフラ
AWS(EC2),Capistrano

## Webサーバ（本番環境）
nginx

## アプリケーションサーバ（本番環境）
unicorn

## ソース管理
GitHub,GitHubDesktop

## テスト
RSpec,Capybara

## エディタ
VScode

# DB設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| family_name           | string  | null: false               |
| given_name            | string  | null: false               |
| family_name_kana      | string  | null: false               |
| given_name_kana       | string  | null: false               |
| duty_station          | string  |                           |
| birthday              | date    | null: false               |

### Association

- has_many :events
- has_many :comments

## departments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |

### Association

- has_many :events
- has_many :comments

## events テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| title            | string      | null: false                    |
| start_time       | datetime    | null: false                    |
| end_time         | datetime    | null: false                    |
| content          | text        |                                |
| user             | references  | null: false, foreign_key: true |
| department       | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :department

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| department    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :department