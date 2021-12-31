module Resolvers
  class MerchandisesResolver < BaseResolver
    type Types::MerchandiseType.connection_type, null: true

    def resolve
      ## いったん、ARのキャッシュを使用しているが、graphql-batchを使うようにリファクタしたいんご
      ## (最新の出品が上位に来るような降順)
      Merchandise.eager_load(:merchandise_images, divided_department: :department).where(public_status: 0).order(id: :desc)
    end
  end
end
