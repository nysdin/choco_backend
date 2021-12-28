module Types
  class MerchandiseImageType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, null: false
  end
end
