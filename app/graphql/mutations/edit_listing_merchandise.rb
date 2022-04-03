module Mutations
  class EditListingMerchandise < BaseMutation
    field :merchandise, Types::MerchandiseType, null: false

    argument :merchandise_id, Integer, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :price, Integer, required: true
    argument :public_status, Integer, required: true
    argument :condition, Integer, required: true
    argument :department_id, Integer, required: true
    argument :image, [String], required: false

    def resolve(merchandise_id: nil, title: nil, description: nil, price: nil, public_status: nil, condition: nil, department_id: nil, image: nil)
      merchandise = MerchandiseServices::EditMerchandiseService.new(
        merchandise_id: merchandise_id,
        title: title,
        description: description,
        price: price,
        public_status: public_status,
        condition: condition,
        department_id: department_id,
        image: image.presence || ''
      ).execute

      { merchandise: merchandise }
    end
  end
end
