module Mutations
  class DeleteMerchandise < BaseMutation
    field :result, Boolean, null: false
    argument :merchandise_id, Integer, required: true

    def resolve(merchandise_id:)
      result = MerchandiseServices::DeleteMerchandiseService.new(merchandise_id: merchandise_id).execute
      { result: !!result }
    end
  end
end
