module Resolvers
  class MerchandisesResolver < BaseResolver
    type Types::MerchandiseType.connection_type, null: true

    def resolve
      MerchandiseServices::FetchAllMerchandisesService.new.execute
    end
  end
end
