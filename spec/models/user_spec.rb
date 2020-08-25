require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全て項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが英数字6文字以上であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'first_nameが全角入力であれば登録できる' do
        @user.first_name = '鈴木'
        expect(@user).to be_valid
      end
      it 'last_nameが全角入力であれば登録できる' do
        @user.last_name = '一郎'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カナ入力であれば登録できる' do
        @user.first_name_kana = 'スズキ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カナ入力であれば登録できる' do
        @user.last_name_kana = 'イチロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみであれば登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角以外だと登録できない' do
        @user.first_name = 'aa1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが全角以外だと登録できない' do
        @user.last_name = 'aa1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角カナ以外だと登録できない' do
        @user.first_name_kana = '阿あ11'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角カナ以外だと登録できない' do
        @user.last_name_kana = '阿あ11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
