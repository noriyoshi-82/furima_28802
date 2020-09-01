class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :prefectures

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "code Input correctly" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: ^0\d{9,10} }
  end
  validates :prefectures_id, numericality: { other_than: 0, message: 'Prefecture Select' }
end
