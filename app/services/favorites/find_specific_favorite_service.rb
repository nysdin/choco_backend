module Favorites
  class FindSpecificFavoriteService
    def initialize(user_id:, merchandise_id:)
      @user_id = user_id
      @merchandise_id = merchandise_id
    end

    def execute
      FavoriteRepository.new.find_specific_favorite(user_id: @user_id, merchandise_id: @merchandise_id)
    end
  end
end
