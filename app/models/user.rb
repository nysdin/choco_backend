class User < ApplicationRecord
  has_many :listed_merchandises, class_name: 'Merchandise', foreign_key: 'seller_id'
  has_many :purchased_merchandises, class_name: 'Merchandise', foreign_key: 'buyer_id'
end
