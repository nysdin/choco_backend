module Resolvers
  class ListingMerchandiseInfoResolver < LoginRequiredResolver
    type Types::MerchandiseType, null: false
    argument :merchandise_id, Integer, required: true

    def resolve(merchandise_id:)
      Merchandise.eager_load(divided_department: :department).find_by(id: merchandise_id)
    end
  end
end
