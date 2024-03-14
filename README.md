## データベーステーブル構成

### users テーブル

| カラム名       | データ型    | オプション             |
|--------------|----------|-------------------|
| id           | integer  |          |
| nickname     | string   | null:false       |
| email        | string   | null:false      |
| password     | string   | null:false        |
| last_name    | string   | null:false              |
| first_name   | string   | null:false                |
| last_name_kana | string | null:false         |
| first_name_kana | string | null:false       |
| birth_date   | date     | null:false          |
### Association
has_many :buys

### items テーブル

| カラム名       | データ型    | 説明               |
|--------------|----------|-------------------|
| id           | integer  |             |
| name         | string   | null:false              |
| description  | text     | null:false          |
| category_id  | integer  | null:false        |
| status_id    | integer  | null:false        |
| shipping_fee_id | integer | null:false    |
| prefecture_id | integer | null:false     |
| scheduled_delivery_id | integer | null:false  |
| price        | integer  | null:false                |
| user         | references | belongs_to:users |

### Association
has_many:buys
has_one_attached :image

### buys テーブル

| カラム名       | データ型    | 説明               |
|--------------|----------|-------------------|
| id           | integer  | null:false          |
| user         | references | belongs_to:users |
| item         | references | belongs_to:items           |


### Association
belongs_to:users
belongs_to:items
has_many:address



### addresses テーブル

| カラム名       | データ型    | 説明               |
|--------------|----------|-------------------|
| id           | integer  | null:false            |
| postal_code  | string   | null:false            |
| prefecture_id | integer | null:false         |
| city         | string   | null:false            |
| block        | string   | null:false               |
| building     | string   |              |
| phone_number | string   | null:false            |
| buy          | references | belongs_to:users        |


### Association
belongs_to:buys
