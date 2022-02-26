module Mutations
  class DeleteMerchandise < BaseMutation
    field :result, Boolean, null: false
    argument :merchandise_id, Integer, required: true

    def resolve(merchandise_id:)
      merchandise = Merchandise.find(merchandise_id)
      result = nil

      begin
        result = merchandise.destroy!
      rescue => e
        Rails.logger.debug "error type: #{e.class}"
        Rails.logger.debug "created error content: #{e}"
      end

      { result: !!result }
    end
  end
end
