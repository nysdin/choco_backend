class User < ApplicationRecord
  has_many :listed_merchandises, class_name: 'Merchandise', foreign_key: 'seller_id'
  has_many :purchased_merchandises, class_name: 'Merchandise', foreign_key: 'buyer_id'

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
end
