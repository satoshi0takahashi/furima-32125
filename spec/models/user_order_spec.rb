require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end
  describe '購入' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end
      it '建物は空でも保存できること' do
        @user_order.building = nil
        expect(@user_order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空だと保存できないこと' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_order.postal_code = 12345678
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end
      it '発送先の地域についての情報がないと登録できない' do
        @user_order.shipping_area_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '都市名が空だと保存できないこと' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it '住所は空だと保存できないこと' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号は空だと保存できないこと' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁以上だと保存できないこと' do
        @user_order.phone_number = 123456789012
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it '電話番号はハイフンが含まれると保存できないこと' do
        @user_order.phone_number = "11-11"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end
end
end