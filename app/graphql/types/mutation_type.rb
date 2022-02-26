module Types
  class MutationType < Types::BaseObject
    field :create_merchandise, mutation: Mutations::CreateMerchandise
    field :favorite, mutation: Mutations::FavoriteMutation
    field :delete_merchandise, mutation: Mutations::DeleteMerchandise
    field :edit_listing_merchandise, mutation: Mutations::EditListingMerchandise
  end
end
