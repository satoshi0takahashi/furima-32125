require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailが一意性であれば登録できる" do
        @user.email = Faker::Internet.free_email
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混在であれば登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが同じであれば登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
      it "ユーザー名が全角であれば登録できる" do
        @user.first_name = "全角"
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end
      it "ユーザー名のフリガナが全角カタカナであれば登録できる" do
        @user.first_name_katakana = "ゼンカク"
        @user.last_name_katakana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordに入力されても、password_confirmationが空だと登録できない" do
        @user.password = "aaa111"
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_katakanaが空だと登録できない" do
        @user.first_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it "last_name_katakanaが空だと登録できない" do
        @user.last_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it "birthが空だと登録できない" do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@を含まないと登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数字混合ではないと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "aaa111"
        @user.password_confirmation = "111aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名は全角じゃないと登録できない" do
        @user.first_name = Gimei.romaji
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ユーザー本名のフリガナは全角カタカナじゃないと登録できない" do
        @user.first_name_katakana = Gimei.romaji
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end
    end
  end
end