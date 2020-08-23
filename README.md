# テーブル設計

## users テーブル
| column       | Type    | Option      |
|--------------|---------|-------------|
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| name         | string  | null: false |
| reading_name | string  | null: false |
| birthday     | date    | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| column         | Type    | Option                        |
|----------------|---------|-------------------------------|
| name     　　　 | string  | null: false                   |
| image          | string  | null: false                   |
| text           | text    | null: false                   |
| category       | integer | null: false                   |
| condition      | integer | null: false                   |
| delivery_pay   | integer | null: false                   |
| prefectures_id | integer | null: false                   |
| delivery_day   | integer | null: false                   |
| price          | integer | null: false                   |
| user_id        | integer | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- belongs_to_active_hash

## orders テーブル

| column       | Type    | Option                        |
|--------------|---------|-------------------------------|
| user_id      | integer | null: false foreign_key: true |
| items_id     | integer | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| column         | Type    | Option                        |
|----------------|---------|-------------------------------|
| orders_id      | integer | null: false foreign_key: true |
| postal_code    | string  | null: false                   |
| prefectures_id | integer | null: false                   |
| city           | string  | null: false                   |
| house_number   | integer | null: false                   |
| building_name  | integer |                               |
| phone_number   | integer | null: false                   |

### Association
- belongs_to :order