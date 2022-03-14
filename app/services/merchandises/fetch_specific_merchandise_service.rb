module Merchandises
  class FetchSpecificMerchandiseService
    def initialize(merchandise_id:)
      @merchandise_id = merchandise_id
    end

    def execute
      MerchandiseRepository.new.fetch_specific_merchandise(merchandise_id: @merchandise_id)
    end
  end
end
