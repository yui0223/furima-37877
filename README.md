＃テーブル設計

## usersテーブル

| Column             | Type   | Options                            |
| ------------------ | ------ | ---------------------------------- |
| nickname           | string | null: false                        |
| email              | string | null: false, unique: true          |
| encrypted_password | string | null: false                        |
| last_name          | string | null: false                        |
| first_name         | string | null: false                        |
| last_name_kana     | string | null: false                        |
| first_name_kana    | string | null: false                        |
| birthday           | date   | null: false                        |

- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order


## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false                    |
| item               | references | null: false                    |

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| user               | references | null: false                    |
| item               | references | null: false                    |
| order              | references | null: false,foreign_key: true  |

- belongs_to :order
