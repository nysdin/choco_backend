require 'base64'

class MerchandiseRepository
  def fetch_all_merchandises
    Merchandise.eager_load(
      :merchandise_images,
      divided_department: :department
    ).where(public_status: 0).order(id: :desc)
  end

  ## FIXME: 画像データの更新部分で、画像の保存がうまくいっていない
  def edit_specific_merchandise(merchandise_id:, title:, description:, price:, public_status:, condition:, department_id:, image:)
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
          condition: condition
        )

        merchandise.divided_department.update!(department_id: department_id) if department_id&.present? && department_id != divided_department.department_id

        if image&.present? && image != merchandise_images
          image.each do |uri|
            next if MerchandiseImage.find_by(url: uri, merchandise_id: merchandise.id).present?

            ## https://s3. がついているURIはパース済みなので、何もしない
            is_s3_uri = uri =~ /https:\/\/s3./
            next if is_s3_uri == 0

            MerchandiseImage.create!(
              url: Apps::CarrierwaveBase64UploaderService.new.base64_conversion(uri),
              merchandise_id: merchandise.id
            )
          end
        end
      end
    rescue => e
      Rails.logger.debug { "error type: #{e.class}" }
      Rails.logger.debug { "created error content: #{e}" }
      Rails.logger.debug { "created error backtrace: #{e.backtrace}" }
    end

    merchandise
  end

  def fetch_specific_merchandise(merchandise_id:)
    Merchandise.eager_load(divided_department: :department).find(merchandise_id)
  end

  def self.delete_merchandise(merchandise_id:)
    merchandise = Merchandise.find(merchandise_id)
    result = nil

    begin
      result = merchandise.destroy!
    rescue => e
      result = false
      Rails.logger.debug { "error type: #{e.class}" }
      Rails.logger.debug { "created error content: #{e}" }
    end

    result
  end

  ## 関連するレコードを同時にcreateする
  def self.create_merchandise(title:, description:, price:, public_status:, condition:, department_id:, image:, current_user:)
    merchandise = Merchandise.new(
      title: title,
      description: description,
      price: price,
      public_status: public_status,
      condition: condition,
      seller_id: current_user.id
    )

    ## FIXME: imageとdepartmentは別Repositoryに分割したい
    merchandise.build_divided_department(
      merchandise_id: merchandise.id,
      department_id: department_id
    )

    begin
      ActiveRecord::Base.transaction do
        merchandise.save!
        ## FIXME: imageとdepartmentは別Repositoryに分割したい
        image.each do |i|
          merchandise.merchandise_images.create!(
            url: Apps::CarrierwaveBase64UploaderService.new.base64_conversion(i),
            merchandise_id: merchandise.id
          )
        end
      end
    rescue => e
      Rails.logger "エラーが発生しました。\n\nエラーの内容: #{e}"
      Rails.logger.debug { "error type: #{e.class}" }
    end

    merchandise
  end
end
