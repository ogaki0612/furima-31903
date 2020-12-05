# README

## usersテーブル

| column          | type    | option       |
| --------------- | ------- | ------------ |
| email           | string  | unique: true |
| password        | string  | null: false  |
| nick_name       | string  | null: false  |
| first_name      | string  | null: false  |
| last_name       | string  | null: false  |
| first_name_kana | string  | null: false  | 
| last_name_kana  | string  | null: false  |
| birth_day       | date    | null: false  |

### Association

-has_many :items
-has_many :orders

## itemsテーブル

| column        | type       | option            |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| category      | string     | null: false       |
| price         | integer    | null: false       |
| status        | string     | null: false       |
| postage       | boolean    | null: false       |
| region        | string     | null: false       |
| shipping_date | string     | null: false       |
| image         |            | null: false       |
| user          | references | foreign_key: true |

### Association

-belongs_to :user
-has_one :order

## ordersテーブル

| column        | type       | option            |
| ------------- |------------| ------------------|
| buyer         | references | foreign_key: true |
| seller        | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :address

## addressesテーブル

| column        | type       | option            |
| ------------- |------------| ------------------|
| address       | text       | null: false       |
| order         | references | foreign_ker: true |

### Association

-belongs_to :order
