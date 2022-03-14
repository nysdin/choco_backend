module Merchandises
  class EditMerchandiseService
    def initialize(merchandise_id:, title:, description:, price:, public_status:, condition:, department_id:, image:)
      @merchandise_id = merchandise_id
      @title = title
      @description = description
      @price = price
      @public_status = public_status
      @condition = condition
      @department_id = department_id
      @image = image
    end

    def execute
      MerchandiseRepository.new.edit_specific_merchandise(
        merchandise_id: @merchandise_id,
        title: @title,
        description: @description,
        price: @price,
        public_status: @public_status,
        condition: @condition,
        department_id: @department_id,
        image: @image
      )
    end
  end
end
