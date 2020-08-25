require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全て項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが英数字6文字以上であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it "first_nameが全角入力であれば登録できる" do
        @user.first_name = "鈴木"
        expect(@user).to be_valid
      end
      it "last_nameが全角入力であれば登録できる" do
        @user.last_name = "一郎"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カナ入力であれば登録できる" do
        @user.first_name_kana = "スズキ"
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カナ入力であれば登録できる" do
        @user.last_name_kana = "イチロウ"
        expect(@user).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "nicknameが7文字以上であれば登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
    end
  end
end
