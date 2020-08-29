# require 'rails_helper'
# describe Item do
#   before do
#     @item = FactoryBot.build(:item)
#     @user = FactoryBot.build(:user)
#   end

#   describe '新規商品情報登録' do

#     context '新規商品情報登録がうまくいくとき' do
#       it '全て項目が存在すれば登録できる' do
#         expect(@item).to be_valid
#       end
#       it 'priceが300円以上あれば登録できる' do
#         @item.price >= 300
#         expect(@item).to be_valid
#       end
#       it 'priceが1000000以下であれば登録できる' do
#         @item.price >= 1000000
#         expect(@item).to be_valid
#       end
#       it 'priceが半角数字であれば登録できる' do
#         @item.price = '11111'
#         expect(@item).to be_valid
#       end
#     end

#     context '新規商品情報登録がうまくいかないとき' do
#       it 'imageが空では登録できない' do
#         @item.image = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Image can't be blank")
#       end
#       it 'nameが空だと登録できない' do
#         @item.name = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Name can't be blank")
#       end
#       it 'textが空では登録できない' do
#         @item.text = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Text can't be blank")
#       end
#       it 'priceが空では登録できない' do
#         @item.price = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Price can't be blank")
#       end
#       it 'priceが半角数字以外であれば登録できない' do
#         @item.price = 'aaaaa'
#         @item.valid?
#         expect(@item.errors.full_messages).to include('Price Half-width number')
#       end
#       it 'priceが300以下であれば登録できない' do
#         @item.price <= 300
#         @item.valid?
#         expect(@item.errors.full_messages).to include('Price Out of setting range')
#       end
#       it 'priceが1000000以上であれば登録できない' do
#         @item.price < 1000000
#         @item.valid?
#         expect(@item.errors.full_messages).to include('Price Out of setting range')
#       end
#       it 'categoryが -- だと登録できない' do
#         @item = 0
#         @user.valid?
#         expect(@item.errors.full_messages).to include('Category Select')
#       end
#       it 'conditionが -- だと登録できない' do
#         @item = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include('Sales status Select')
#       end
#       it 'delivery_payが -- だと登録できない' do
#         @item = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include('Shipping fee status Select')
#       end
#       it 'prefecturesが -- だと登録できない' do
#         @item = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include('Prefecture Select')
#       end
#       it 'delivery_dayが -- だと登録できない' do
#         @item = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include('Scheduled delivery Select')
#       end
#     end
#   end
# end
