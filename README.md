## データベーステーブル構成

### users テーブル

| カラム名           | データ型   | オプション               |
|-------------------|----------|-------------------------|
| nickname          | string   | null:false              |
| email             | string   | null:false, unique:true|
| encrypted_password| string   | null:false              |
| last_name         | string   | null:false              |
| first_name        | string   | null:false              |
| last_name_kana    | string   | null:false              |
| first_name_kana   | string   | null:false              |
| birth_date        | date     | null:false              |

### Association
- has_many :buys
- has_many :items

### items テーブル

| カラム名                | データ型 | オプション                  |
|------------------------|--------|----------------------------|
| name                   | string | null:false                 |
| description            | text   | null:false                 |
| category_id            | integer| null:false                 |
| status_id              | integer| null:false                 |
| shipping_fee           | integer| null:false                 |
| prefecture             | integer| null:false,                |
| scheduled_delivery_id  | integer| null:false,                |
| price                  | integer| null:false                 |
| user                   | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy
- has_one_attached :image

### buys テーブル

| カラム名 | データ型 | オプション                          |
|---------|--------|------------------------------------|
| user  | integer| null:false, foreign_key: true |
| item  | integer| null:false, foreign_key: true |

### Association
- has_one :address

### addresses テーブル

| カラム名      | データ型 | オプション                        |
|--------------|--------|----------------------------------|
| postal_code  | string | null:false                       |
| prefecture_id| integer| null:false,                      |
| city         | string | null:false                       |
| block        | string | null:false                       |
| building     | string |                                  |
| phone_number | string | null:false                       |
| buy_id   | integer| null:false,                          |

### Association
- belongs_to :buy