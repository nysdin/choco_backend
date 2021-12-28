class Merchandise < ApplicationRecord
  belongs_to :seller, class_name: 'User', optional: true
  belongs_to :buyer, class_name: 'User', optional: true
  has_one :divided_department
  has_many :merchandise_images
  has_many :favorite

  enum public_status: { released: 0, draft: 1 }
end
