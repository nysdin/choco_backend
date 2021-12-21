module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :merchandise, Types::MerchandiseType, null: false do
      argument :id, ID
    end

    def merchandise(id:)
      Merchandise.find(id)
    end

    field :merchandises, resolver: Resolvers::MerchandisesResolver
    field :myself, resolver: Resolvers::MyselfResolver
  end
end
