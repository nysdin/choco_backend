module MerchandiseServices
  class DeleteMerchandiseService
    def initialize(merchandise_id:)
      @merchandise_id = merchandise_id
    end

    def execute
      MerchandiseRepository.delete_merchandise(merchandise_id: @merchandise_id)
    end
  end
end
