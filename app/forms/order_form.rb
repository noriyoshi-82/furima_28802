class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :house_number, :building_name, :phone_number, :prefectures_id, :order_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "code Input correctly" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
  validates :prefectures_id, numericality: { other_than: 0, message: ' Select' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, city: city, house_number: house_number, building_name: building_name, prefectures_id: prefectures_id, phone_number: phone_number, order_id: order.id)
  end
end
