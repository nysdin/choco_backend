module Types
  class MutationType < Types::BaseObject
    field :create_merchandise, mutation: Mutations::CreateMerchandise
    field :favorite, mutation: Mutations::FavoriteMutation
  end
end
