module Mutations
  class CreateMerchandise < BaseMutation
    field :merchandise, Types::MerchandiseType, null: false

    argument :title, String, required: true
    argument :description, String, required: true
    argument :price, Integer, required: true
    argument :public_status, Integer, required: true
    argument :condition, Integer, required: true
    argument :department_id, Integer, required: true
    argument :image, [String], required: false

    def resolve(title:, description:, price:, public_status:, condition:, department_id:, image:)
      merchandise = MerchandiseRepository.create_merchandise(
        title: title,
        description: description,
        price: price,
        public_status: public_status,
        condition: condition,
        department_id: department_id,
        image: image,
        current_user: context[:current_user]
      )

      { merchandise: merchandise }
    end
  end
end
