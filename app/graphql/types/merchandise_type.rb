module Types
  class MerchandiseType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :price, Integer, null: false
    field :buyer, Types::UserType, null: true
    field :condition, Integer, null: false
    field :seller, Types::UserType, null: true
    field :public_status, Integer, null: false
    field :merchandise_images, [Types::MerchandiseImageType], null: true
    field :divided_department, Types::DividedDepartmentType, null: false
    # field :status, Integer, null: false
    # field :traded_at, String, null: true
    # field :closed_at, String, null: true
  end
end
