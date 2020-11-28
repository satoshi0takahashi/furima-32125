# Table detail

# Users

|Column    |Type      |Options|
|----------|----------| ---------|
|email     |string    |Null: false|
|encrypted_password  |string    |Null: false|
|nickname      |string    |Null: false|
|first_name   |string      |Null: false|
|last_name   |string      |Null: false|
|first_name_katakana   |string      |Null: false|
|last_name_katakana|string      |Null: false|
|birth  |date      |Null: false|

## Association

- has_many :items, through: :user_items
- has_many :user_items
- has_many :orders

# Items

|Column    |Type      |Options|
|----------|----------| ---------|
|name     |string    |Null: false|
|detail|text      |Null: false|
|category_id   |integer      |Null: false|
|status_id   |integer      |Null: false|
|shipping_changes_id   |integer      |Null: false|
|shipping_area_id   |integer      |Null: false|
|day_to_ship_id   |integer      |Null: false|
|price   |integer      |Null: false|
|user      |references |foreign key: true|

## Association

- has_many :users, through: :user_items
- has_many :user_items
- belongs_to :order

# user_items

|Column    |Type      |Options|
|----------|----------| ---------|
|user |references   |foreign key:true|
|item      |references   |foreign key:true|

## Association

- belongs_to :user
- belongs_to :item

# Orders

|Column    |Type      |Options
|----------|----------| ---------|
|postal_code     |string    |Null: false|
|prefectures_id     |integer    |Null: false|
|city     |string    |Null: false|
|address     |string    |Null: false|
|building     |string    ||
|phone_number     |string    |Null: false|


## Association

- belongs_to :user
- has_one :Item