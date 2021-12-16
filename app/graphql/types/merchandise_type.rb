module Types
  class MerchandiseType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String
    field :price, Integer, null: false
    field :buyer_id, String
    field :seller_id, String
    field :status, Integer, null: false
    field :traded_at, String, null: false
    field :closed_at, String
  end
end
