module Favorites
  class ChangeFavoriteService
    def initialize(user_id:, merchandise_id:, is_favorited: false)
      @user_id = user_id
      @merchandise_id = merchandise_id
      @is_favorited = is_favorited
    end

    def execute
      favorite = FavoriteRepository.new.find_specific_favorite(user_id: @user_id, merchandise_id: @merchandise_id)

      if @is_favorited && favorite.nil?
        ## いいねを新規作成
        FavoriteRepository.new.add_favorite(user_id: @user_id, merchandise_id: @merchandise_id)
      elsif !@is_favorited && favorite.present?
        ## 良いねを取り消し
        FavoriteRepository.new.remove_favorite(favorite: favorite)
      else
        Rails.logger.info '-- 何も起きていない --'
        Rails.logger.debug { "is favorite => #{@is_favorited}" }
        Rails.logger.debug { "favorite record => #{favorite}" }
      end

      Rails.logger.info '--- 最終的な結果 ---'
      Rails.logger.info favorite

      favorite
    end
  end
end
