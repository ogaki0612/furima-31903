# README

## usersテーブル

| column             | type    | option       |
| ------------------ | ------- | ------------ |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  |
| nick_name          | string  | null: false  |
| first_name         | string  | null: false  |
| last_name          | string  | null: false  |
| first_name_kana    | string  | null: false  | 
| last_name_kana     | string  | null: false  |
| birth_day          | date    | null: false  |

### Association

-has_many :items
-has_many :orders

## itemsテーブル

| column           | type       | option            |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| details          | text       | null: false       |
| category_id      | integer    | null: false       |
| price            | integer    | null: false       |
| status_id        | integer    | null: false       |
| postage_id       | integer    | null: false       |
| region_id        | integer    | null: false       |
| shipping_date_id | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

-belongs_to :user
-has_one :order

## ordersテーブル

| column        | type       | option            |
| ------------- |------------| ------------------|
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :address

## addressesテーブル

| column        | type       | option            |
| ------------- |------------| ------------------|
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| address_1     | string     | null: false       |
| address_2     | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| order         | references | foreign_key: true |

### Association

-belongs_to :order
