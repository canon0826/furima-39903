# テーブル設計

## users テーブル

| Column             | Type  | Options                    |
| ------------------ | ----- | -------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null:false                |
| first_name         | string | null:false                |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null:false                |

### Association

- has_many:items, dependent::destroy
- has_many:purchases, dependent::destroy
- has_one:shipping_address, dependent::destroy

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| image         | string     |                                |
| name          | string     |                                |
| description   | text       |                                |
| category      | string     |                                |
| condition     | string     |                                |
| shipping_fee  | string     |                                |
| shipping_area | string     |                                |
| shipping_days | string     |                                |
| price         | integer    |                                |

### Association

- belongs_to :user
- has_one :purchase

## shipping_addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| postal_code   | string     |                                |
| prefecture    | string     |                                |
| city          | string     |                                |
| address       | string     |                                |
| building_name | string     |                                |
| phone_number  | string     |                                |

### Association

- belongs_to :user

## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
