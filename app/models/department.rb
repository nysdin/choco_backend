class Department < ApplicationRecord
  has_many :divided_departments, dependent: :destroy
end
