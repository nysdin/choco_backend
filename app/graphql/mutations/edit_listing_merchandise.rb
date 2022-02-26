module Mutations
  class EditListingMerchandise < BaseMutation
    field :merchandise, Types::MerchandiseType, null: false

    argument :merchandise_id, Integer, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :price, Integer, required: true
    argument :public_status, Integer, required: true
    argument :condition, Integer, required: true
    argument :department_id, Integer, required: false
    argument :image, [String], required: false

    def resolve(merchandise_id:, title:, description:, price:, public_status:, condition:, department_id:, image:)
      merchandise = Merchandise.find(merchandise_id)
      divided_department = merchandise.divided_department
      merchandise_images = merchandise.merchandise_images

      begin
        ActiveRecord::Base.transaction do
          merchandise.update!(
            title: title,
            description: description,
            price: price,
            public_status: public_status,
            condition: condition,
          )

          if image&.present? && image != merchandise_images
            merchandise_images.delete_all
            image&.each do |i|
              merchandise_image = MerchandiseImage.find(img.id)
              merchandise_image.update()
              MerchandiseImage.create!(
                url: base64_conversion(i),
                merchandise_id: merchandise.id
              )
            end
          end

          divided_department.update!(department_id: department_id) if department_id&.present? && department_id != divided_department.department_id
        end
      rescue => e
        Rails.logger.debug "error type: #{e.class}"
        Rails.logger.debug "created error content: #{e}"
      end

      { merchandise: merchandise }
    end
  end
end
0