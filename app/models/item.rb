class Item < ApplicationRecord
  belongs_to :users
  has_one_attached :file

  with_options presence: true do
    validates :name
    validates :image
    validates :text
    validates :price format: { with: "/^[0-9]+$/", message: "Price Out of setting range"}
    validates :user_id
    with_option numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_pay_id
      validates :prefectures_id
      validates :delivery_day_id
    end
  end
end
