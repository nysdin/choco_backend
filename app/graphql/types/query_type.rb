module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :merchandises, resolver: Resolvers::MerchandisesResolver
    field :myself, resolver: Resolvers::MyselfResolver
    field :merchandise_detail, resolver: Resolvers::MerchandiseDetailResolver
    field :favorite, resolver: Resolvers::CurrentUserFavoriteResolver
    field :listing_merchandise_info, resolver: Resolvers::ListingMerchandiseInfoResolver
  end
end
