module Resolvers
  class MerchandiseDetailResolver < BaseResolver
    type Types::MerchandiseType, null: false
    argument :id, Integer, required: true

    def resolve(id:)
      Merchandises::FetchSpecificMerchandiseService.new(merchandise_id: id).execute
    end
  end
end
