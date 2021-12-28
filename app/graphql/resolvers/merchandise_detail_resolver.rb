module Resolvers
  class MerchandiseDetailResolver < BaseResolver
    type Types::MerchandiseType, null: false
    argument :id, Integer, required: true

    def resolve(id:)
      Loaders::RecordLoader.for(Merchandise).load(id)
    end
  end
end