require 'rails_helper'
describe Item do
  before '#create' do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end
  describe '新規商品情報登録' do
    context '新規商品情報登録がうまくいくとき' do
      it '全て項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上あれば登録できる' do
        @item.price >= 300
        expect(@item).to be_valid
      end
      it 'priceが1000000以下であれば登録できる' do
        @item.price >= 1_000_000
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = '11111'
        expect(@item).to be_valid
      end
    end

    context '新規商品情報登録がうまくいかないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300以下であれば登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが1000000以上であれば登録できない' do
        @item.price = 1_000_001
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'categoryが -- だと登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Category Select')
      end
      it 'conditionが -- だと登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Sales status Select')
      end
      it 'delivery_payが -- だと登録できない' do
        @item.delivery_pay_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery pay Shipping fee status Select')
      end
      it 'prefecturesが -- だと登録できない' do
        @item.prefectures_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures Prefecture Select')
      end
      it 'delivery_dayが -- だと登録できない' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day Scheduled delivery Select')
      end
    end
  end
end
