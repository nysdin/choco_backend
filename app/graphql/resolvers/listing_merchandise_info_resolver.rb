module Resolvers
  class ListingMerchandiseInfoResolver < LoginRequiredResolver
    type Types::MerchandiseType, null: false
    argument :merchandise_id, Integer, required: true

    def resolve(merchandise_id:)
      Merchandises::FetchSpecificMerchandiseService.new(merchandise_id: merchandise_id).execute
    end
  end
end
