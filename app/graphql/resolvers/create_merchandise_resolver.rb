module Resolvers
  class CreateMerchandiseResolver < LoginRequiredResolver
    type Types::MerchandiseType, null: false

    argument :id

    def resolve(id:)
      Merchandise.find(id)
    end
  end
end
