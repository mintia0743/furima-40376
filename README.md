## データベーステーブル構成

### users テーブル

| カラム名       | データ型    | 説明               |
|--------------|----------|-------------------|
| id           | integer  | ユーザーID         |
| nickname     | string   | ニックネーム       |
| email        | string   | メールアドレス     |
| password     | string   | パスワード         |
| last_name    | string   | 姓                |
| first_name   | string   | 名                |
| last_name_kana | string | 姓（カナ）        |
| first_name_kana | string | 名（カナ）      |
| birth_date   | date     | 生年月日           |

### items テーブル

| カラム名       | データ型    | 説明               |
|--------------|----------|-------------------|
| id           | integer  | 商品ID            |
| name         | string   | 商品名             |
| description  | text     | 商品の説明         |
| category_id  | integer  | カテゴリーID       |
| status_id    | integer  | 商品の状態ID       |
| shipping_fee_id | integer | 配送料の負担ID   |
| prefecture_id | integer | 発送元の地域ID    |
| scheduled_delivery_id | integer | 配送までの日数ID |
| price        | integer  | 価格               |
| user         | references | 出品者（ユーザー） |

### buys テーブル

| カラム名       | データ型    | 説明               |
|--------------|----------|-------------------|
| id           | integer  | 購入履歴ID         |
| user         | references | 購入者（ユーザー） |
| item         | references | 購入商品           |

### addresses テーブル

| カラム名       | データ型    | 説明               |
|--------------|----------|-------------------|
| id           | integer  | 住所ID             |
| postal_code  | string   | 郵便番号           |
| prefecture_id | integer | 都道府県ID        |
| city         | string   | 市区町村           |
| block        | string   | 番地               |
| building     | string   | 建物名             |
| phone_number | string   | 電話番号           |
| buy          | references | 購入履歴         |