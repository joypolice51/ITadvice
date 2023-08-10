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
