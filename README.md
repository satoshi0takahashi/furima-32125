# Table detail

# Users

|Column    |Type      |Options
|----------|----------| ---------|
|email     |string    |Null: false|
|password  |string    |Null: false|
|nickname      |string    |Null: false|
|real_name   |string      |Null: false|
|name_katakana|string      |Null: false|
|birth_day  |integer      |Null: false|
|birth_month  |integer      |Null: false|
|birth_year  |integer      |Null: false|
|item_id      |reference   |foreign key:true|

## Association
- has_many :prototypes
- has_many :orders

# Items
|Column    |Type      |Options
|----------|----------| ---------|
|name     |string    |Null: false
|item_detail|text      |Null: false|
|category   |string      |Null: false|
|status   |string      |Null: false|
|shipping_changes   |string      |Null: false|
|shipping_area   |string      |Null: false|
|day_to_ship   |integer      |Null: false|
|price   |integer      |Null: false|
|image     |Active Storage||
|user_id      |reference |foreign key: true|

## Association
- has_many :users
- belongs_to :order


# Orders
|Column    |Type      |Options
|----------|----------| ---------|
|card_infomation     |string    |Null: false|
|expiration_month     |string    |Null: false|
|expiration_year     |string    |Null: false|
|security_code     |string    |Null: false|
|postal_code     |string    |Null: false|
|prefectures     |text    |Null: false|
|city     |text    |Null: false|
|address     |text    |Null: false|
|building     |text    |Null: false|
|phone_number     |string    |Null: false|
|user_id |reference   |foreign key:true|
|item_id      |reference   |foreign key:true|

## Association
- belongs_to :user
- belongs_to :Item