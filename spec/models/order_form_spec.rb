require 'rails_helper'
describe OrderForm do
  before '#create' do
    @order = FactoryBot.build(:order_form)
  end

  describe '購入者情報の登録' do
    context '購入完了した際登録がうまくいくとき' do
      it '建物名以外の項目が存在すれば登録できる' do
        expect(@order).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", 'Postal code Input correctly')
      end
      it 'postal_codeは半角数字で-を含まなければ登録できない' do
        @order.postal_code = 'aaaaaaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'cityが空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと登録できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以内ではないと登録できない' do
        @order.phone_number = '1234'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'prefectures_idが0だと登録できない' do
        @order.prefectures_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefectures  Select')
      end
    end
  end
end
