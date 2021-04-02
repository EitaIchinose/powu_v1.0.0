# アプリケーション名

**P.O.W.U(ポウ)**

# 概要

カレンダーを用いて部署ごとに予定（工程）を組むことが可能となります。  
また、各予定表ページにてコメント機能を導入しておりますので、予定を閲覧しながらの打ち合わせが可能です。  
他部署との連携を図るため、全ユーザーが全ての予定を閲覧可能です。

# 本番環境

[P.O.W.U](https://powu-v1.herokuapp.com/)

## ログイン情報(テスト用)

- メールアドレス：test@example1
- パスワード　　：abc123

# 制作背景（意図）

私は前職・製造業で主に工程を組むことが仕事でした。組み方として、紙媒体を用いて自身でテンプレートを作成したり  
使わなくなった書類の裏紙を再利用する形でそこに記述しまとめるといった方法です。  
しかし、その中で業務効率化を図るため下記の事を解決したいと考えておりました。

- 予定をカレンダーの様に見える化し、まとめやすくしたい
- 他部署と連携を図る時に生じる時間（打ち合わせ等）を最低限に抑えたい
- 過去の予定を保管する事が困難であり、予定を遡りづらい

以上のことを解決するため今回のアプリケーション実装に至りました。

# DEMO

## **トップページ**
[![Image from Gyazo](https://i.gyazo.com/b079d748b218144516bff983324105fd.png)](https://gyazo.com/b079d748b218144516bff983324105fd)

- 簡単に取り扱い方法を記載しております。
- 左上のメニューバーから予定表のリストを確認することが出来ます。  
- 左上の「+」ボタンから新規予定表を登録することが出来ます。
- ユーザー名をクリックすることで、アカウントの編集・ログアウトページへ遷移する事が出来ます。

## **アカウントのログイン・新規登録ページ**
[![Image from Gyazo](https://i.gyazo.com/e7ee09327a61a5d3a78555dfe37b9bb2.gif)](https://gyazo.com/e7ee09327a61a5d3a78555dfe37b9bb2)

- 未ログイン時は、ログイン画面へ遷移致します。
- アカウント登録がお済みでない場合は、「sign up」ボタンより、新規登録することが可能です。

## **ユーザー情報編集・ログアウト画面**
[![Image from Gyazo](https://i.gyazo.com/bb277f59d63bd621022ba5acc448ccb9.png)](https://gyazo.com/bb277f59d63bd621022ba5acc448ccb9)

- ユーザーの一部情報を編集可能となっております。
- こちらのページからログアウトすることが可能となります。

## **予定表リスト画面**
[![Image from Gyazo](https://i.gyazo.com/66db38713a00cb07bf79ab606f9d378b.gif)](https://gyazo.com/66db38713a00cb07bf79ab606f9d378b)

- 登録した予定表を全ユーザーが閲覧可能でございます。
- 予定表削除の誤作動を防ぐため、選択した予定表に対してのみリストから削除することが可能となります。
- 非同期通信でページ遷移を行っているため、予定を確認するための時間を削減しております。

## **予定表画面**
[![Image from Gyazo](https://i.gyazo.com/7e7a131fe86230ef0c0f3d1f01262468.gif)](https://gyazo.com/7e7a131fe86230ef0c0f3d1f01262468)

- 「予定を追加」ボタンから予定を新規追加する事が可能です。
- 予定のタイトルを長い文面で書いた場合、後ろの文字列を「...」に切り替え省略しレイアウトの崩れ防止を行っております。
- 予定のタイトルをクリックすることで詳細ページへ遷移できますが、カーソルを合わせることでタイトル名と時間を確認することが出来ます。
- 右上の「週」・「月」タブにて週別or月別カレンダーへ切り替える事が出来ます。

## **コメント機能**
[![Image from Gyazo](https://i.gyazo.com/63f8d968c70903b6942d3abadfecb311.png)](https://gyazo.com/63f8d968c70903b6942d3abadfecb311)

- コメントは文面と画像を送信することが可能であり、どちらか一方のみの送信も可能です。
- 非同期通信にて実装している為、読む込む時間が無くすぐに反映されます。
- 自分のコメントに足して左側にチェックマークが付くようになっており、編集と削除も可能です。
- 自身で新たなコメントを打ち込んだ場合、自動で新規コメント（最下部）までスクロールされます。

## **予定追加画面**
[![Image from Gyazo](https://i.gyazo.com/b686aeafb274aaaa2cec13c92b08467e.gif)](https://gyazo.com/b686aeafb274aaaa2cec13c92b08467e)

- タイトル・時間・内容を打ち込むことが可能であり、内容は無い場合でも登録が可能です。
- 開始時間を打ち込むことによって、終了時間も１時間後の値が自動で打ち込まれるようになっております。
- 開始時間が終了時間よりも遅い場合はエラーを返し登録が出来ない様になっております。

## **予定詳細画面**
[![Image from Gyazo](https://i.gyazo.com/a11cbea19cfdbc31763d8c069617d2eb.png)](https://gyazo.com/a11cbea19cfdbc31763d8c069617d2eb)

- 予定画面のタイトル名から詳細画面へ遷移することが出来ます。
- 予定内容の確認・編集・削除を行なうことが可能です。
- 内容は登録画面と同等の幅であり、長い文面に対しても登録画面で登録されたまま表示されます。

## **予定編集画面**
[![Image from Gyazo](https://i.gyazo.com/f883a3d6e900609bab7d41806d333a33.png)](https://gyazo.com/f883a3d6e900609bab7d41806d333a33)

- 内容が打ち込まれた状態のまま予定を編集することが出来ます。
- もしタイトルが空の状態・開始時間が終了時間よりも遅い場合はエラーが出ます。

## **「手軽さ」を意識して下記３点の工夫ポイント**

- 予定表の確認を行なう際に、ページ間の移動を非同期通信にて実装致しました。  
これにより作業間に確認したい場合等、時間をかけたくない時にでもすぐ確認が出来るようになっております。  

- 予定追加のタイトルが長くなってしまった場合、後ろの文字列が省略されるようになっております。  
しかし、吹き出し機能を導入しており予定にカーソルを合わせることによってタイトル名と時間を表示致します。  
これにより、予定ページ内にて予定内容を確認することも出来ますが、内容量が少ない場合はタイトルのみでも予定内容を把握することが  
可能でございます。

- 予定追加画面にて、開始時間を打ち込んだ場合に終了時間が自動で１時間後の値が入力されるようになっております。  
これにより、一部の予定は終了時間の登録作業を省略して登録することが可能となっております。

# 今後実装したい機能

- マイページ機能を実装予定です。自身が追加した予定だけを可視化出来る事によって、使用用途の幅が増えると考えております。

- 予定リスト部分をフォルダ形式にしたいと考えております。部署の数、又は用途に合わせて予定表を増やした際に今の状態だと全て展開されるため  
視認性に欠けると感じました。

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