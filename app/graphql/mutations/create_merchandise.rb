require 'base64'

module Mutations
  class CreateMerchandise < BaseMutation
    include CarrierwaveBase64Uploader

    field :merchandise, Types::MerchandiseType, null: false

    argument :title, String, required: true
    argument :description, String, required: true
    argument :price, Integer, required: true
    argument :public_status, Integer, required: true
    argument :condition, Integer, required: true
    argument :department_id, Integer, required: true
    argument :image, [String], required: false

    def resolve(title:, description:, price:, public_status:, condition:, department_id:, image:)
      merchandise = nil

      begin
        merchandise = Merchandise.create!(
          title: title,
          description: description,
          price: price,
          public_status: public_status,
          condition: condition,
          seller_id: context[:current_user].id
        )

        image.each do |i|
          MerchandiseImage.create!(
            url: base64_conversion(i),
            merchandise_id: merchandise.id
          )
        end

        DividedDepartment.create!(
          merchandise_id: merchandise.id,
          department_id: department_id
        )
      rescue => e
        logger.debug "error type: #{e.class}"
        logger.debug "created error content: #{e}"
      end

      Rails.logger.info '--- 最終的な商品のレコード ---'
      Rails.logger.info merchandise

      { merchandise: merchandise }
    end
  end
end
