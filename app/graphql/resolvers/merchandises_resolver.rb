module Resolvers
  class MerchandisesResolver < BaseResolver
    type Types::MerchandiseType.connection_type, null: true

    def resolve
      Merchandise.all
    end
  end
end