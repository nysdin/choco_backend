module Types
  class FavoriteType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :merchandise, Types::MerchandiseType, null: false
  end
end
