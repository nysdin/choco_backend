class Merchandise < ApplicationRecord
  belongs_to :seller, class_name: 'User', optional: true
  belongs_to :buyer, class_name: 'User', optional: true
  has_one :divided_department, dependent: :destroy
  has_one :department, through: :divided_department, dependent: :destroy
  has_many :merchandise_images, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum public_status: { released: 0, draft: 1 }
end
