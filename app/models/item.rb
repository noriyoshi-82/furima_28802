class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_pay
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :delivery_day
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    with_options format: { with: /\A[0-9]+\z/, message: 'Half-width number' } do
      validates :price, numericality: { greater_than: 300, less_than: 1_000_000, message: 'Out of setting range' }
    end
  end
  validates :category_id, numericality: { other_than: 0, message: 'Category Select' }
  validates :condition_id, numericality: { other_than: 0, message: 'Sales status Select' }
  validates :delivery_pay_id, numericality: { other_than: 0, message: 'Shipping fee status Select' }
  validates :prefectures_id, numericality: { other_than: 0, message: 'Prefecture Select' }
  validates :delivery_day_id, numericality: { other_than: 0, message: 'Scheduled delivery Select' }
end
