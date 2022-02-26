module Mutations
  class FavoriteMutation < BaseMutation
    field :favorite, Types::FavoriteType, null: true
    argument :merchandise_id, Integer, required: true
    argument :is_favorited, Boolean, required: true

    def resolve(merchandise_id:, is_favorited:)
      user_id = context[:current_user][:id]
      favorite = Favorite.find_by(
        merchandise_id: merchandise_id,
        user_id: user_id
      )

      if is_favorited && favorite.nil?
        begin
          Rails.logger.info '--- 新規のいいねを作成 ---'
          favorite = Favorite.create!(
            merchandise_id: merchandise_id,
            user_id: user_id
          )
        rescue => e
          Rails.logger.debug { "error type: #{e.class}" }
          Rails.logger.debug { "created error content: #{e}" }
        end
      elsif !is_favorited && favorite
        begin
          Rails.logger.info '--- いいねの取り消しを実行 ---'
          favorite.destroy!
        rescue => e
          Rails.logger.debug { "error type: #{e.class}" }
          Rails.logger.debug { "created error content: #{e}" }
        end
      else
        Rails.logger.info '-- 何も起きていない --'
        Rails.logger.debug { "is favorite => #{is_favorited}" }
        Rails.logger.debug { "favorite record => #{favorite}" }
      end

      Rails.logger.info '--- 最終的な結果 ---'
      Rails.logger.info favorite

      { favorite: favorite }
    end
  end
end
