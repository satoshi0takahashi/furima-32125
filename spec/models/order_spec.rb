require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '寄付情報の保存' do
  before do
    @user_order = FactoryBot.build(:user_order)
  end


  it 'すべての値が正しく入力されていれば保存できること' do
  end
  it 'nameが空だと保存できないこと' do
  end
  it 'nameが全角日本語でないと保存できないこと' do
  end
  it 'name_readingが空だと保存できないこと' do
  end
  it 'name_readingが全角日本語でないと保存できないこと' do
  end
  it 'nicknameが空だと保存できないこと' do
  end
  it 'nicknameが半角でないと保存できないこと' do
  end
  it 'postal_codeが空だと保存できないこと' do
  end
  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
  end
  it 'prefectureを選択していないと保存できないこと' do
  end
  it 'cityは空でも保存できること' do
  end
  it 'house_numberは空でも保存できること' do
  end
  it 'building_nameは空でも保存できること' do
  end
  it 'priceが空だと保存できないこと' do
  end
  it 'priceが全角数字だと保存できないこと' do
  end
  it 'priceが1円未満では保存できないこと' do
  end
  it 'priceが1,000,000円を超過すると保存できないこと' do
  end
end
end

  it "priceとtokenがあれば保存ができること" do
    expect(@order).to be_valid
  end

  it "priceが空では登録できないこと" do
    @order.price = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Price can't be blank")
  end

  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
end