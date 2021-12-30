class User < ApplicationRecord
  has_many :listed_merchandises, class_name: 'Merchandise', foreign_key: 'seller_id', dependent: :nullify, inverse_of: :seller
  has_many :purchased_merchandises, class_name: 'Merchandise', foreign_key: 'buyer_id', dependent: :nullify, inverse_of: :buyer
  has_many :favorite

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
end
