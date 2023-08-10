# アプリケーション名
ITvice

# アプリケーション概要
20~30代でITエンジニア歴10年未満の若手エンジニアが、40代以上でITエンジニア歴20年以上のベテランエンジニアから
仕事での悩みに対する対処法を聞くことができる

# URL

# テスト用アカウント
まだ、ログイン機能まで実装できておらず、アカウント未作成です。

# 利用方法
●質問投稿
1.ユーザーの新規登録を行う
2.トップページから「Room」をクリックし、Room一覧に遷移する
3.自身の質問したい内容に近いRoom名をクリック
4.Room内に投稿されている質問の一覧が表示される
5.「質問する」をクリックして内容を入力し投稿

●回答
1.Room内に投稿されている質問を見て、回答したい質問のタイトルをクリック
2.回答内容を入力し投稿

●ダイレクトメッセージ
1.ユーザー一覧より、ユーザー名をクリック
2.ユーザーのマイページに遷移し、「ダイレクトメッセージ」アイコンをクリック
3.メッセージを入力し、送信

# アプリケーションを作成した背景
前職でITエンジニアとして努める傍ら、自身含め仕事の悩みをどう解消すればいいのか悩む人が一定数いることを知る。
先輩に聞く、もしくは知恵袋で質問、ITエンジニア交流会で聞くなど、解決する場所は色々あるように思われたが、
立ち上げプロジェクトだと先輩も初めてのことだらけで経験者からコツが聞けない、知恵袋だと埋もれる、地方だとITエンジニア交流会などがそもそもない、
こういったケースもあるため、なかなかうまく解消されないのが現状。
そこで、ITエンジニアに特化して特有の悩みの解消法を、同じ経験をしたベテランのエンジニアからヒアリングできるアプリの開発を決意。


# 洗い出した要件
要件定義シートを参照

# 実装した機能についての画像やGIFおよびその説明
・まだ、実装が完了した機能はございません。

# 実装予定の機能
・公開、非公開機能
・解決済み表示機能
・Room機能
・ダイレクトメッセージ機能
・ユーザー登録機能
・未解決質問表示機能
・バッチ機能
・マイページ機能
・トップページ表示機能
・質問機能
・回答機能


## DB設計
ER図を参照

## 画面遷移図
画面遷移図を参照

## 開発環境
・HTML
・CSS
・Ruby
・Ruby on rails
・MySQL
・S3

## ローカルでの動作方法
以下のコマンドを順番に実行
git clone 
cd ~/ruby/projects/ITadvice
bundle install
yum install

## 工夫したポイント
データベース設計の際にダイレクトメッセージの箇所で中間テーブルを設けたところです。
1人はダイレクトメッセージを複数の人に送ることができ、また1人の人も複数人からダイレクトメッセージを受け取ることになるため、
多対多となります。そこで、中間テーブルが必要となりますが、どのテーブルにカラムを持たせるか、といった部分で工夫を凝らしました。

## 改善点
ダイレクトメッセージの箇所のデータベース設計が少し煩雑となり、なぜこの設計となっているのかを
コードにコメントアウトするなど、他の人と一緒に開発していくことを想定した際に他の人が見ても分かりやすい
コードを書くといった意識が足りてなかった。

## 制作時間
各機能それぞれ下記となります。

ユーザー管理:1h
Room作成:3h
質問:8h
回答:7h
マイページ:5h
ダイレクトメッセージ:4h
バッチ:3h
解決・未解決:4h
トップページ表示機能:8h
公開非公開:4h


## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| name   | string | null: false |
| email  | string | null: false, unique: true |
| encrypted_password | string | null: false |
| span   | string | null: false |
| field  | string | null: false |
| batch  | string | null: false |

### Association
- has_many :rooms
- has_many :advices
- has_many :directs
- has_many :batches
- has_many :directs-users
- has_many :messages



## roomsテーブル
| Column | Type | Option |
|--------|------|------|
| name   | string | null: false |

### Association
- has_many :users
- has_many :questions


## questions テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| content| text       | null: false                    |
| resolved | boolean  | default: false                 |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user
- has_many   :advices


## advices テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| content| text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| question | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :question


## directs テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| content| text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user



## directs-users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| direct | references | null: false, foreign_key: true |



## batches テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## unresolveds テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
| question | references | null: false, foreign_key: true |


