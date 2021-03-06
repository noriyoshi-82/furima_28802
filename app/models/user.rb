class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'を再入力してください'
  with_options presence: true do
    validates :nickname
    validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '：全角で入力してください' }
    validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '：全角で入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '：全角カナで入力してください' }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: '：全角カナで入力してください' }
    validates :birthday
  end
  has_many :items
  has_one :order
end
