require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it '必須項目に入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it '商品画像を1枚つけないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと登録できない' do
        @item.detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品の状態についての情報がないと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end
      it '配送料の負担についての情報がないと登録できない' do
        @item.shipping_change_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping change can't be blank", 'Shipping change is not a number')
      end
      it '発送元の地域についての情報がないと登録できない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank", 'Shipping area is not a number')
      end
      it '発送までの日数についての情報がないと登録できない' do
        @item.day_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank", 'Day to ship is not a number')
      end
      it '価格についての情報がないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが1以外でないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1以外でないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'shipping_change_idが1以外でないと登録できない' do
        @item.shipping_change_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping change must be other than 1')
      end
      it 'shipping_area_idが1以外でないと登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'day_to_ship_idが1以外でないと登録できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to ship must be other than 1')
      end
      it '価格の範囲が、¥300~¥9,999,999の間でないと登録できない(下限)' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格の範囲が、¥300~¥9,999,999の間でないと登録できない(上限)' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格は半角数字じゃないと登録できない' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
