module Types
  class MutationType < Types::BaseObject
    field :create_merchandise, mutation: Mutations::CreateMerchandise
    # field :create_merchandise, resolver: Resolvers::CreateMerchandiseResolver
  end
end
