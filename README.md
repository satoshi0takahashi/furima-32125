# Table detail

# Users

|Column    |Type      |Options|
|----------|----------| ---------|
|email     |string    |Null: false, unique:true|
|encrypted_password  |string    |Null: false|
|nickname      |string    |Null: false|
|first_name   |string      |Null: false|
|last_name   |string      |Null: false|
|first_name_katakana   |string      |Null: false|
|last_name_katakana|string      |Null: false|
|birth  |date      |Null: false|

## Association

- has_many :items
- has_many :orders

# Items

|Column    |Type      |Options|
|----------|----------| ---------|
|name     |string    |Null: false|
|detail|text      |Null: false|
|category_id   |integer      |Null: false|
|status_id   |integer      |Null: false|
|shipping_change_id   |integer      |Null: false|
|shipping_area_id   |integer      |Null: false|
|day_to_ship_id   |integer      |Null: false|
|price   |integer      |Null: false|
|user      |references |foreign key: true|

## Association
- belongs_to :user
- has_one :order

# Orders

|Column    |Type      |Options|
|----------|----------| ---------|
|user |references   |foreign key:true|
|item      |references   |foreign key:true|

## Association

- belongs_to :user
- belongs_to :item
- has_one :address

# Address

|Column    |Type      |Options
|----------|----------| ---------|
|postal_code     |string    |Null: false|
|shipping_area_id   |integer      |Null: false|
|city     |string    |Null: false|
|address     |string    |Null: false|
|building     |string    ||
|phone_number     |string    |Null: false|
|order     |references   |foreign key:true|


## Association

- belongs_to :order