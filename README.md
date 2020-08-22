# テーブル設計

## users テーブル
| column       | Type    | Option      |
|--------------|---------|-------------|
| nickname     | string  | null: false |
| email        | string  | null: false |
| name         | string  | null: false |
| reading_name | string  | null: false |
| birthday     | integer | null: false |

### Association
- has_many :item
- has_many :order

## items テーブル

| column         | Type    | Option                        |
|----------------|---------|-------------------------------|
| item_name      | string  | null: false                   |
| image          | string  | null: false                   |
| text           | string  | null: false                   |
| category       | string  | null: false                   |
| condition      | string  | null: false                   |
| delivery_pay   | string  | null: false                   |
| prefectures_id | integer | null: false                   |
| delivery_day   | string  | null: false                   |
| item_price     | integer | null: false                   |
| user_id        | integer | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order

## order テーブル

| column         | Type    | Option                        |
|----------------|---------|-------------------------------|
| user_id        | integer | null: false foreign_key: true |
| item_price     | integer | null: false foreign_key: true |
| postal_code    | integer | null: false                   |
| prefectures_id | integer | null: false                   |
| city           | string  | null: false                   |
| house_number   | integer | null: false                   |
| building_name  | integer |                               |
| phone_number   | integer | null: false                   |

### Association
- belongs_to :user
- belongs_to :item